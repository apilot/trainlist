class CreateTrains < ActiveRecord::Migration[7.0]
  def change
    create_table :trains do |t|
      t.integer :number
      t.integer :car_max
      t.integer :type_of, default: 0
      t.belongs_to :route
      t.belongs_to :station, index: true, foreign_key: true

      t.timestamps
    end
  end
end
