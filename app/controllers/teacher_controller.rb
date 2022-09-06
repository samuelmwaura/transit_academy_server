class TeacherController < Sinatra::Base 
    set(:default_content_type,'application/json')
    
###ROUTES FOR THE TEACHERS MODEL
  get "/teachers" do
    Teacher.all.to_json
  end

  get "/teachers/:id" do
    id = params[:id]
    Teacher.find(id).get_teacher_and_allocations
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


end