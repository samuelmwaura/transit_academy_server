class ApplicationController < Sinatra::Base
    set(:default_content_type,"application/json")

    post '/login' do
      logging_user = User.find_by(username:params[:username],password:params[:password])
      if logging_user
            logged_user = if logging_user.category == "student"
                Student.find(logging_user.student_id).get_student_and_registrations
            else
                Teacher.find(logged_user.teacher_id).get_teacher_and_allocations
            end
      else
            nil.to_json
      end
    
    end
end