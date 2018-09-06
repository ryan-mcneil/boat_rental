require 'pry'

class Dock
  attr_reader :name, :max_rental_time, :boats_rented, :boats_returned

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @boats_rented = []
    @boats_returned = []
    @charges = {}
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

  def charges
    charges = {}
    @boats_returned.each do |boat|
      if charges[boat.renter.credit_card_number] == nil
        charges[boat.renter.credit_card_number] = boat.boat_revenue(@max_rental_time)
      else
        charges[boat.renter.credit_card_number] += boat.boat_revenue(@max_rental_time)
      end
    end
    charges
  end

  def total_hours_by_rental_type
    rental_types = {}
    @boats_returned.each do |boat|
      if rental_types[boat.type] == nil
        rental_types[boat.type] = boat.hours_rented
      else
        rental_types[boat.type] += boat.hours_rented
      end
    end
    rental_types
    # Upon return I would have created another hash of the boat.type and += the
    # hours.
  end
end
