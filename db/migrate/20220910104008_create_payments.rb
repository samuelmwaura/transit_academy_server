class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table(:payments) do |t|
      t.string(:student_name)
      t.integer(:amount)
      t.string(:student_id)
      t.timestamps
    end
  end
end
