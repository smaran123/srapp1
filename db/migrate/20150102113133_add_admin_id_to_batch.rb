class AddAdminIdToBatch < ActiveRecord::Migration
  def change
    add_column :batches, :admin_id, :integer
  end
end
