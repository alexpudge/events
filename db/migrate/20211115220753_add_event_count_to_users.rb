class AddEventCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :events_count, :integer
  end
end
