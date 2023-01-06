FactoryBot.define do
  factory :graph do
    name { Faker::Alphanumeric.alpha(number: 5) }

    factory :education_map do
      name { "Universities of the country of #{Faker::Food.fruits}" }
    end
  end
end
