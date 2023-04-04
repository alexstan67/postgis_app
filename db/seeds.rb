# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

GeoAirport.destroy_all
GeoAirport.create(name: 'ELLX', lonlat: 'POINT(6.204444 49.6233333)')
GeoAirport.create(name: 'LFST', lonlat: 'POINT(7.627654 48.539680)')

puts "Coordinates for ELLX are: lon: #{GeoAirport.find_by(name: "ELLX").lonlat.x} | lat: #{GeoAirport.find_by(name: "ELLX").lonlat.y}"
#puts "Distance between both airports is: 
