FactoryBot.define do
  factory :category do
    name { 'Test Category' }
    icon { 'icon.png' }
    association :user, factory: :user
  end
end
