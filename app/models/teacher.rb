require_relative "./user"
class Teacher < User
    has_many(:allocations)
    has_many(:courses,through: :allocations)
end