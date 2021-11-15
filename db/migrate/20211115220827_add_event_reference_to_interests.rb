class AddEventReferenceToInterests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :interests, :events
    add_index :interests, :event_id
    change_column_null :interests, :event_id, false
  end
end
