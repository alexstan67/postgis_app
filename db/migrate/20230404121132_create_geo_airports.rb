class CreateGeoAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :geo_airports do |t|
      t.string :name
      t.st_point :lonlat, geographic: true

      t.timestamps
    end
  end
end
