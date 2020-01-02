FactoryBot.define do
  factory :discovery do
    text { FFaker::Lorem.sentence }
    author
  end
end
