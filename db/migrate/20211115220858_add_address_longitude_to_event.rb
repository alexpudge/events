class AddAddressLongitudeToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :address_longitude, :float
  end
end
