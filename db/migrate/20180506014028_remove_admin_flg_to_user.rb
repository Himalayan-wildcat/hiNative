class RemoveAdminFlgToUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :admin_flg, :boolean
  end
end
