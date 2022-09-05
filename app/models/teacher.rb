require_relative "./user"
class Teacher < ActiveRecord::Base
    has_many(:allocations)
    has_many(:courses,through: :allocations)
end