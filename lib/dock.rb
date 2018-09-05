require 'pry'

class Dock
  attr_reader :name, :max_rental_time, :boats_rented, :boats_returned

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @boats_rented = []
    @boats_returned = []
  end

  def rent(boat, renter)
    boat.add_renter(renter)
    @boats_rented << boat
  end

  def log_hour
    @boats_rented.each do |boat|
      boat.add_hour
    end
  end

  def return(boat)
    @boats_returned << boat
    @boats_rented.delete(boat)
  end

  def revenue
    @boats_returned.inject(0) do |sum, boat|
      sum + boat.boat_revenue(@max_rental_time)
    end
  end
end
