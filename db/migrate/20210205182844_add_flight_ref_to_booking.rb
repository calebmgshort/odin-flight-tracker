class AddFlightRefToBooking < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :flight, index: true
  end
end
