FactoryBot.define do
  factory :node_type do
    graph
    name { Faker::Alphanumeric.alpha(number: 10) }
  end
end
