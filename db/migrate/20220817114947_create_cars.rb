class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.integer :number
      t.integer :type_of, default: 0
      t.belongs_to :train, index: true, foreign_key: true
      t.timestamps
    end
  end
end
