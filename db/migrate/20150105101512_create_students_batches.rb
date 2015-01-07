class CreateStudentsBatches < ActiveRecord::Migration
  def change
    create_table :students_batches do |t|
      t.integer :user_id
      t.integer :batch_id
      t.timestamps
    end
  end
end
