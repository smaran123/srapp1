class CreateMarkReports < ActiveRecord::Migration
  def change
    create_table :mark_reports do |t|
    	t.integer :user_id
    	t.integer :admin_id
    	t.integer :batch_id
    	t.integer :subject_id
  		t.integer :receiver_id
      t.integer :min_marks
      t.integer :max_marks
      t.integer :total_marks
      t.string :result
      t.text :comment
      t.string :markrepot_file_name
      t.string :markrepot_content_type
      t.integer :markrepot_file_size
      t.timestamps
    end
  end
end

 
    