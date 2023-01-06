FactoryBot.define do
  factory :node_type do
    graph { nil }
    name { Faker::Alphanumeric.alpha(number: 10) }
  end
end
