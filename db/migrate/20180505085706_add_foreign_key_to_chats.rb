class AddForeignKeyToChats < ActiveRecord::Migration[5.1]
  def change
    add_reference :chats, :target, foreign_key: { to_table: :users }
  end
end
