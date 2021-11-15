class AddAddressFormattedAddressToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :address_formatted_address, :string
  end
end
