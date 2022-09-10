require_relative "./user"

class Student < ActiveRecord::Base
    has_many(:registrations)
    has_many(:payments)
    has_many(:courses,through: :registrations)
    
    #get all information for a student instance
    def get_student_and_registrations
      self.to_json(include: {registrations: {include: :course}})
    end

end