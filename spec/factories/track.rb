FactoryBot.define do
    factory :track do
      title { Faker::Lorem.word }
      patient { Faker::Number.number(10) }
    end
end