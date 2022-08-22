class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :name

      t.timestamps
    end

    create_table :routes_stations, id: false do |t|
      t.belongs_to :route
      t.belongs_to :station
    end
  end
end
