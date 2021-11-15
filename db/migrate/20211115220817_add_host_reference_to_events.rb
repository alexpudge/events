class AddHostReferenceToEvents < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :events, :users
    add_index :events, :user_id
    change_column_null :events, :user_id, false
  end
end
