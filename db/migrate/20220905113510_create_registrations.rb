class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table(:registrations) do |t|
      t.string(:student_name)
      t.string(:course_name)
      t.string(:grade)
    end
  end
end
