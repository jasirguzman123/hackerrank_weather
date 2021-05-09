class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.date :date, null: false
      t.references :location, foreign_key: true, null: false
      t.text :temperature, array: true, default: [].to_yaml

      t.timestamps
    end
  end
end
