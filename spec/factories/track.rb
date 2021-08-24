FactoryBot.define do
  factory :track do
    title { Faker::Lorem.word }
    patient { Faker::Number.number(digits: 10) }
  end
end
