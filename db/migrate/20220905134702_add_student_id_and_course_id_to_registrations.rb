class AddStudentIdAndCourseIdToRegistrations < ActiveRecord::Migration[6.1]
  def change
    add_column(:registrations,:student_id,:integer)
    add_column(:registrations,:courses_id,:integer)
  end
end
