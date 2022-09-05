puts "🌱 Seeding spices..."

# Seed your database here
12.times do
student = Student.create(first_name: Faker::Name.first_name,last_name:Faker::Name.last_name,registration_number:"#{rand(200..400)}/2022",age:rand(16..45))
teacher = Teacher.create(first_name: Faker::Name.first_name,last_name:Faker::Name.last_name,staff_number:"#{rand(1..100)}/22")
course = Course.create(course_name: Faker::Educator.course_name,course_code:"#{rand(1..45)}/09/2022")
end

50.times do
student = Student.find(rand(1..12))
course = Course.find(rand(1..12))
teacher = Teacher.find(rand(1..12))
Registration.create(student_name:"#{student.first_name} #{student.last_name}",course_name:course.course_name,student_id:student.id,course:course)
Allocation.create(teacher:teacher,course:course)
end


puts "✅ Done seeding!"
