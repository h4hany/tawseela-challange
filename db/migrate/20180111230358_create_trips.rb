class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :info
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
