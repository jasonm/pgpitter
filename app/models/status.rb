class Status < ActiveRecord::Base
  belongs_to :key

  before_create :set_keyid

  private

  def set_keyid
    self.body, raw_key = verify
    self.key = Key.find_or_create_by(keyid: raw_key.primary_subkey.keyid)
  rescue GPGME::Error::NoData
    self.errors.add(:signed_body, "Invalid signature")
    false
  end

  def verify
    sig = nil
    data = crypto.verify(signed_body){ | sig_ | sig = sig_ }
    [data.read, sig.key]
  end

  def crypto
    GPGME::Crypto.new
  end
end
