class AddAddressLatitudeToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :address_latitude, :float
  end
end
