class AddGuestReferenceToInterests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :interests, :users
    add_index :interests, :user_id
    change_column_null :interests, :user_id, false
  end
end
