class Boat
  attr_reader :type, :price_per_hour, :hours_rented, :renter

  def initialize(type, price_per_hour)
    @type = type
    @price_per_hour = price_per_hour
    @hours_rented = 0
    @renter = nil
  end

  def add_hour
    @hours_rented += 1
  end

  def add_renter(renter)
    @renter = renter
  end

  def boat_revenue(max_rental_time)
    if @hours_rented > max_rental_time
      @price_per_hour * max_rental_time
    else
      @price_per_hour * @hours_rented
    end
  end
end
