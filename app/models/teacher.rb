require_relative "./user"
class Teacher < ActiveRecord::Base
    has_many(:allocations)
    has_many(:courses,through: :allocations)

    def get_teacher_and_allocations
        self.to_json(include: {allocations: {include: :course}})
    end

end