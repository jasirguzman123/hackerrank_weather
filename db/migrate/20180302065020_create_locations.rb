class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :lat, null: false
      t.float :lon, null: false
      t.string :city, null: false
      t.string :state, null: false

      t.timestamps
    end
  end
end
