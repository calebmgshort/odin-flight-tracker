class BookingsController < ApplicationController

  def new
    num_passengers = params[:booking][:number_of_passengers].to_i
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = Booking.new
    num_passengers.times {@booking.passengers.build}
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger).thank_you_email.deliver_now
      end
      redirect_to @booking
    else
      render :new
    end
  end

  def show
    booking = Booking.find(params[:id])
    @flight = booking.flight
    @passengers = booking.passengers
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end
  
end
