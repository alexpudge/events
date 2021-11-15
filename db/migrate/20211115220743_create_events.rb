class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :start_date
      t.string :start_time
      t.date :end_date
      t.string :end_time
      t.string :address
      t.string :details
      t.string :photo
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
