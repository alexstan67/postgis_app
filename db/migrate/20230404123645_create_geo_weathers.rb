class CreateGeoWeathers < ActiveRecord::Migration[7.0]
  def change
    create_table :geo_weathers do |t|
      t.geometry :weather_tile, geographic: true
      t.integer :srid
      t.timestamps
    end
  end
end
