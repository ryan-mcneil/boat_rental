require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'
require './lib/renter'
require './lib/boat'

class DockTest < Minitest::Test

  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

  def test_it_has_attributes
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal "The Rowing Dock", dock.name
    assert_equal 3, dock.max_rental_time
  end

  def test_it_starts_with_no_boats_rented
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal [], dock.boats_rented
  end

  def test_it_can_add_boat
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    dock.rent(kayak_1, patrick)
    assert_equal [kayak_1], dock.boats_rented
    dock.rent(kayak_2, patrick)
    assert_equal [kayak_1, kayak_2], dock.boats_rented
  end

  def test_it_can_log_an_hour
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    dock.rent(kayak_1, patrick)
    dock.log_hour
    assert_equal 1, dock.boats_rented[0].hours_rented
    dock.rent(kayak_2, patrick)
    dock.log_hour
    assert_equal 2, dock.boats_rented[0].hours_rented
    assert_equal 1, dock.boats_rented[1].hours_rented
  end

  def test_it_starts_with_no_boats_returned
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal [], dock.boats_returned
  end

  def test_it_can_return
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    assert_equal [kayak_1, kayak_2], dock.boats_rented
    dock.return(kayak_1)
    assert_equal [kayak_2], dock.boats_rented
    assert_equal [kayak_1], dock.boats_returned
  end


end
