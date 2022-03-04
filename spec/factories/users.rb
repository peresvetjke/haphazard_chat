FactoryBot.define do
  factory :user do
    login { generate(:login) }
    email { generate(:email) }
    password { "xxxxxx" }
  end
end
