class ApplicationController < Sinatra::Base
    set(:default_content_type,"application/json")

    post '/login' do
      logging_user = User.find_by(username:params[:username],password:params[:password])
      if logging_user
            logged_user = if logging_user.category == "student"
                Student.find(logging_user.student_id).get_student_and_registrations
            elsif logging_user.category == "teacher"
                Teacher.find(logging_user.teacher_id).get_teacher_and_allocations
            else
                logging_user.to_json
            end
      else
            nil.to_json
      end
    
    end
     

##Registration routes  ..Tbh I just dont know how I got this logic but it is just genious
    patch "/registrations/:id" do
      updating_registration = Registration.find(params[:id])
      new_course = Course.find(params[:course_id])
      updating_registration.update(id:params[:id],course_name: new_course.course_name,course_id: new_course.id) #updating the id so that it becomes first in list
      updating_registration.to_json(include: :course)
    end
   

    post "/registrations" do
      new_registration = Registration.create(student_name:params[:student_name],course_name:params[:course_name],grade:"Not Graded",student_id:params[:student_id],course_id:params[:course_id].to_i)
      new_registration.to_json(include: :course) #include the course because it is needed in the frontend.
    end

    delete "/registrations/:id" do
      deleted_registration = Registration.find(params[:id])
      deleted_registration.destroy
      deleted_registration.to_json
    end

    post "/registrations/grades" do
      params.each do |key,value| #params here is a hash of keys representing registration ids and values repesenting grades
        grading_student = Registration.find(key.to_i)
        grading_student.update(grade:value)
      end
      params.to_json
    end
  
    get "/users" do
      all_users = User.all
      all_users.to_json
    end

end
