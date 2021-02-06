class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @dates = Flight.dates

    @searched = __searched?
    if @searched
      @number_of_passengers = params[:number_of_passengers]
      @flights = Flight.search(params[:from_airport], params[:to_airport], params[:date])
    end
  end

  private

  def __searched?
    return params[:commit] == "Search"
  end
end
