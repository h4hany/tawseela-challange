class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
