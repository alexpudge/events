class AddGuestCountToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :guests_count, :integer
  end
end
