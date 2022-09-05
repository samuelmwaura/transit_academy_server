class CreateAllocations < ActiveRecord::Migration[6.1]
  def change
    create_table(:allocations) do |t|
      t.string(:teacher_id)      
      t.string(:courses_id)
    end
  end
end
