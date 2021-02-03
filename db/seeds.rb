# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flight.delete_all
Airport.delete_all

Airport.create(code: "NYC")
Airport.create(code: "SFO")
Airport.create(code: "SLC")
Airport.create(code: "PSC")

Flight.create(departure_time: DateTime.now + 1, duration: 5 * 60, from_airport_id: Airport.find_by(code: "NYC").id, to_airport_id: Airport.find_by(code: "SFO").id)
Flight.create(departure_time: DateTime.now + 2, duration: 2 * 60, from_airport_id: Airport.find_by(code: "PSC").id, to_airport_id: Airport.find_by(code: "SLC").id)

