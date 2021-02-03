class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.datetime :departure_time
      t.integer :duration

      t.timestamps
    end

    add_reference :flights, :from_airport, foreign_key: {to_table: :airports}
    add_reference :flights, :to_airport, foreign_key: {to_table: :airports}
  end
end
