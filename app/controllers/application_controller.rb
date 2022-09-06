class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json' #content_type
  
  # Add your routes here

  ###ROUTES FOR THE STUDENTS MODEL
  get "/students" do
    Student.all.to_json
  end

  get "/students/:id" do
    id = params[:id]
    Student.find(id).to_json
  end

  post "/students" do
    newStudent = Student.create(first_name:params[:first_name],last_name:params[:last_name],registration_number:params[:params],age:params[:age])
    newStudent.to_json
  end

  patch "/students/:id" do
    id = params[:age]
    updatedStudent = Student.find(id)
    updatedStudent.update(first_name:params[:first_name],last_name:params[:params],registration_number:params[:registration_number],age:params[:age])
    updatedStudent.to_json
  end

  delete "/student/:id" do
    id = params[:id]
    deleted_student = Student.find(:id)
    deleted_student.destroy
    deleted_student.to_json
  end

###ROUTES FOR THE TEACHERS MODEL
  get "/teachers" do
    Teacher.all.to_json
  end

  get "/teachers/:id" do
    id = params[:id]
    Teacher.find(id).to_json
  end

  post "/teachers" do
    new_teacher = Teacher.create(fist_name:params[:id],last_name:params[:last_name],staff_number:params[:staff_number])
    new_teacher.to_json
  end

  patch "/teachers/:id" do
    updated_teacher = Teacher.find(:id)
    updated_teacher.update(first_name:params[:first_name],last_name:params[:last_name],staff_number:params[:staff_number])
    updated_teacher.to_json
  end
  
  delete "/teachers/:id" do 
    id = params[:id]
    deleted_teacher = Teacher.find(:id)
    deleted_teacher.destroy
    deleted_teacher.to_json
  end
 
###ROUTES FOR COURSES MODEL
   get "/courses" do
    Course.all.to_json
   end

   get "/courses/:id" do
    id = params[:id]
    Course.find(id).to_json
   end

   post "/courses" do
    new_course = Course.create(course_name:params[:course_name],course_code:params[:course_code])
    new_course.to_json
   end

   patch "/courses/:id" do
    id = params[:id]
    updated_course = Course.find(id)
    updated_course.update(course_name:params[:id],course_code:params[:course_code])
   end

   delete "/courses/:id" do
    id = params[:id]
    deleted_item = Course.find(id)
    deleted_item.destroy
    deleted_item.to_json
   end
end
