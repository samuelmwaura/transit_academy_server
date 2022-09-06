class CourseController < Sinatra::Base
    set(:default_content_type,'application/json')

 
###ROUTES FOR COURSES MODEL
   get "/courses" do
    Course.all.to_json
   end

   get "/courses/:id" do
    id = params[:id]
    Course.find(id).get_course_and_its_students
   end

   get "/courses/:id/allocations" do
    id=params[:id]
    Course.find(id).get_course_and_its_teachers
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