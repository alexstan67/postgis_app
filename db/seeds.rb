GeoAirport.destroy_all
GeoAirport.create(name: 'ELLX', lonlat: 'POINT(6.204444 49.6233333)')
GeoAirport.create(name: 'LFST', lonlat: 'POINT(7.627654 48.539680)')
GeoAirport.create(name: 'LFAW', lonlat: 'POINT(5.88899 49.41049)')
GeoAirport.create(name: 'LFAT', lonlat: 'POINT (1.62139199 50.518659)')

# Display of coordinates
puts "Coordinates for ELLX are: lon: #{GeoAirport.find_by(name: "ELLX").lonlat.x} | lat: #{GeoAirport.find_by(name: "ELLX").lonlat.y}"

# Distance calculation
airport_origin = GeoAirport.find_by(name: "ELLX")
airport_destination = GeoAirport.find_by(name: "LFST")
distance_in_meters = airport_origin.lonlat.distance(airport_destination.lonlat).to_f
puts "Distance between ELLX and LFST is: #{distance_in_meters / 1000} km"

# Find all airports more than 50 km away from airport1
distance_threshold = 50000  # 50 km in meters
airports = GeoAirport.where("st_distance(lonlat, ST_GeomFromText('POINT(:lon :lat)', 4326)) > :distance", 
                            { lon: airport_origin.lonlat.x, lat: airport_origin.lonlat.y, distance: distance_threshold })
p airports.to_sql()
airports.each do |a|
  puts a.name
end

GeoWeather.destroy_all
polygon_wkt = 'POLYGON((6 49,7 49,7 50,6 50,6 49))'
GeoWeather.create(weather_tile: RGeo::WKRep::WKTParser.new.parse(polygon_wkt), srid: 4326)
polygon_wkt = 'POLYGON((4 49,5 49,5 50,4 50,4 49))'
GeoWeather.create(weather_tile: RGeo::WKRep::WKTParser.new.parse(polygon_wkt), srid: 4326)
polygon_wkt = 'POLYGON((1 50,2 50,2 51,1 51,1 50))'
GeoWeather.create(weather_tile: RGeo::WKRep::WKTParser.new.parse(polygon_wkt), srid: 4326)

# Now we test for which airport we have weather info (represented by a tile)

