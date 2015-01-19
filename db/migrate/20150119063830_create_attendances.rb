class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
    	t.integer :user_id
      t.integer :batch_id
      t.integer :subject_id
      t.integer :receiver_id
      t.integer :admin_id
      t.string :attendance_status
      t.date :today_date
      t.timestamps
    end
  end
end
