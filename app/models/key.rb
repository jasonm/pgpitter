class Key < ActiveRecord::Base
  has_many :signers, class_name: 'Key'
end
