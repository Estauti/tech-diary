FactoryBot.define do
  factory :user, aliases: [:author] do
    email { FFaker::Internet.email }
    name { FFaker::Name.name }
    password { FFaker::Internet.password }
  end
end
