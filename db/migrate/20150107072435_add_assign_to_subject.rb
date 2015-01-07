class AddAssignToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :assign, :string
  end
end
