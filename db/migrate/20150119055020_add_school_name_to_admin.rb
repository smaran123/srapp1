class AddSchoolNameToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :school_name, :string
  end
end
