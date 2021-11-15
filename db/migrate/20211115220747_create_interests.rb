class CreateInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :interests do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :response

      t.timestamps
    end
  end
end
