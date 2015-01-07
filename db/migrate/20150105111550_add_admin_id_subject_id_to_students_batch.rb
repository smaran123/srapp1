class AddAdminIdSubjectIdToStudentsBatch < ActiveRecord::Migration
  def change
    add_column :students_batches, :admin_id, :integer
    add_column :students_batches, :subject_id, :integer 
  end
end
