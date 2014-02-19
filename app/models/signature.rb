class Signature < ActiveRecord::Base
  belongs_to :signed_key, class_name: 'Key'
  belongs_to :signing_key, class_name: 'Key'
end
