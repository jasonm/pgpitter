require 'hkp'

class Key < ActiveRecord::Base
  has_many :signatures, foreign_key: :signed_key_id
  has_many :signers, through: :signatures, source: :signing_key, class_name: 'Key'
  has_many :statuses

  def signers_statuses
    signers.map(&:statuses).flatten
  end

  def populate_signers!
    signer_keyids.each do |signer_keyid|
      signer = Key.find_or_create_by!(keyid: signer_keyid)
      signatures.create!(signing_key: signer)
    end
  end

  def self.find_or_import(keyid)
    find_or_create_by(keyid: keyid).tap { |key| key.populate_signers! }
  end

  private

  def signer_keyids
    all_signer_keyids.uniq.reject { |k_id| k_id == keyid }
  end

  def all_signer_keyids
    hkp.fetch_and_import(keyid)
    subkeyids_from_gnupg.split("\n")
  end

  def hkp
    Hkp.new
  end

  def subkeyids_from_gnupg
    `gpg --with-colons --fast-list-mode --list-sigs #{keyid} | awk -F ':' '$1 ~ /sig|rev/ {print $5}'`
  end
end
