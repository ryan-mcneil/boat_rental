require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'
require './lib/renter'


class BoatTest < Minitest::Test

  def test_it_exists
    kayak = Boat.new(:kayak, 20)
    assert_instance_of Boat, kayak
  end

  def test_it_has_attributes
    kayak = Boat.new(:kayak, 20)
    assert_equal :kayak, kayak.type
    assert_equal 20, kayak.price_per_hour
  end

  def test_it_starts_with_no_hours
    kayak = Boat.new(:kayak, 20)
    assert_equal 0, kayak.hours_rented
  end

  def test_it_can_add_an_hour
    kayak = Boat.new(:kayak, 20)
    kayak.add_hour
    assert_equal 1, kayak.hours_rented
    kayak.add_hour
    assert_equal 2, kayak.hours_rented
  end

  def test_it_starts_without_a_renter
    kayak = Boat.new(:kayak, 20)
    assert_nil kayak.renter
  end

  def test_it_can_add_renter
    renter = Renter.new("Patrick Star", "4242424242424242")
    kayak = Boat.new(:kayak, 20)
    kayak.add_renter(renter)
    assert_equal renter, kayak.renter
  end

  def test_it_can_calculate_revenue
    kayak = Boat.new(:kayak, 20)
    kayak.add_hour
    kayak.add_hour
    assert_equal 40, kayak.boat_revenue(3)
    kayak.add_hour
    kayak.add_hour
    assert_equal 60, kayak.boat_revenue(3)

  end

end
