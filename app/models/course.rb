class Course < ActiveRecord::Base
   has_many(:registrations)
   has_many(:allocations)
   has_many(:students,through: :registrations)
   has_many(:teachers,through: :allocations)

   def get_course_and_its_students
      self.to_json(include: {registrations: {include: :student}})
   end
  
   def get_course_and_its_teachers
      self.to_json(include: {allocations: {include: :teacher}})
   end #Is there a way to connect this method and the one above?


end