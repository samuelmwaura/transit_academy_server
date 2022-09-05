class CreateAllocations < ActiveRecord::Migration[6.1]
  def change
    create_table(:allocations) do |t|
      t.integer(:teacher_id)      
      t.integer(:courses_id)
    end
  end
end
