require_relative "./user"
class Teacher < ActiveRecord::Base
    has_many(:allocations)
    has_many(:courses,through: :allocations)

    def get_teacher_and_allocations #This is an instance method that will be called on a teacher instance
        self.to_json(include: {allocations: {include: {course: {include: :registrations}}}})  #Carries all the information of a techer from their allocation to the courses in those allocation to the regustrations for the course
    end

end