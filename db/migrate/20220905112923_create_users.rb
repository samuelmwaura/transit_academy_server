class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table(:users) do |t|
      t.string(:username)
      t.string(:password)
      t.string(:category)
      t.integer(:student_id)
      t.integer(:teacher_id)
    end
  end
end
