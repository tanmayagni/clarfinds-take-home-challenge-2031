FactoryBot.define do
  factory :node do
    graph { nil }
    node_type { nil }
    name { Faker::Alphanumeric.alpha(number: 20) }

    factory :course_node do
      name { [["", Faker::Hacker.adjective, Faker::Company.buzzword].sample, Faker::Educator.course_name].compact_blank.join(" ").titleize }
    end

    factory :student_node do
      name { "#{Faker::Name.first_name}, the #{Faker::Adjective.positive} #{Faker::Creature::Animal.name}" }
    end
  end
end
