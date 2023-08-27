FactoryBot.define do
  factory :item do
    name { 'Testing' }
    amount { 100 }
    user
    category
    author { association(:user) }
  end
end
