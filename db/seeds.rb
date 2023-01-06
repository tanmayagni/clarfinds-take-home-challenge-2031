puts "Generating graph..."
graph = FactoryBot.create :education_map
puts "Done. Generated graph #{graph.name}"

puts "Generating node types..."
course_node_type = FactoryBot.create :node_type, graph: graph, name: "Course"
student_node_type = FactoryBot.create :node_type, graph: graph, name: "Student"
puts "Done. Generated node types #{graph.node_types.pluck(:name).to_sentence}"

puts "Generating courses..."
FactoryBot.create_list :course_node, 30, graph: graph, node_type: course_node_type
courses = course_node_type.nodes
puts "Done. Generated 30 courses: #{course_node_type.nodes.pluck(:name).to_sentence}"

puts "Generating students..."
FactoryBot.create_list :student_node, 2000, graph: graph, node_type: student_node_type
students = student_node_type.nodes
puts "Done. Generated 2000 students"

puts "Generating links..."
courses.each do |course|
  students.sample([rand(5..10), rand(10..50), rand(50..100), 100].sample).each do |student|
    FactoryBot.create :link, graph: graph, source: student, target: course
  end
end
puts "Done. Generated #{graph.links.count} links"
