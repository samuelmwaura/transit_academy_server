class Course < ActiveRecord::Base
   has_many(:registrations)
   has_many(:allocations)
   has_many(:students,through: :registrations)
   has_many(:teachers,through: :allocations)
end