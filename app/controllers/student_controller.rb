class StudentController < Sinatra::Base
  set(:default_content_type, 'application/json')
  ###ROUTES FOR THE STUDENTS MODEL
  get "/students" do
    Student.all.to_json  #working class method
  end

  get "/students/payments/:id" do   
    student_payment = Student.find(params[:id])
    student_payment.to_json(include: :payments)
  end

  get "/students/:id" do
    id = params[:id]
    Student.find(id).get_student_and_registrations   #Am calling an instance method for a student I fetch
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
end

