FactoryBot.define do
    factory :day do
      blood_pressure { Faker::Number.number(digits: 2) }
      blood_sugar { Faker::Number.number(digits: 2) }
      # track_id nil
      track_id { Faker::Number.number(digits: 1) }
    end
end