class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @dates = Flight.dates
  end
end
