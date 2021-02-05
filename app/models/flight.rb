class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: "Airport", foreign_key: "from_airport_id"
  belongs_to :to_airport, class_name: "Airport", foreign_key: "to_airport_id"

  def self.dates
    Flight.all.select("date(departure_time) as departure_time").distinct.order("departure_time asc")
  end

  def self.search(from_airport_id, to_airport_id, date)
    Flight.where("from_airport_id = ? AND to_airport_id = ? AND date(departure_time) = ?", from_airport_id, to_airport_id, date) 
  end

  def pretty_print
    "Departure Time: #{self.departure_time}, Duration: #{self.duration}"
  end
end
