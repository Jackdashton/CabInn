class AddDatesToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :arrival, :date
    add_column :bookings, :departure, :date
  end
end
