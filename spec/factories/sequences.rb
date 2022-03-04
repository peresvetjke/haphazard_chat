FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  sequence(:login) { |n| "user#{n}" }
end