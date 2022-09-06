require_relative "./user"

class Student < ActiveRecord::Base
    has_many(:registrations)
    has_many(:courses,through: :registrations)
    
    def get_all_students
      self.all
    end

    def get_a_student_teachers
       self.courses
    end
end