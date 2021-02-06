class AddBookingIdToPassenger < ActiveRecord::Migration[6.1]
  def change
    add_reference :passengers, :booking, index: true
  end
end
