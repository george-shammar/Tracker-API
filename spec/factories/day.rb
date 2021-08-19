FactoryBot.define do
    factory :item do
      blood_pressure { Faker::Number.number(digits: 2) }
      blood_sugar { Faker::Number.number(digits: 2) }
      track_id nil
    end
end