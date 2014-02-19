# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :signature, :class => 'Signatures' do
    signed_key nil
    signing_key nil
  end
end
