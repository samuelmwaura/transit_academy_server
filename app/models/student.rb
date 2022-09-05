require_relative "./user"
class Student < User
    has_many(:registrations)
    has_many(:students,through: :registrations)
end