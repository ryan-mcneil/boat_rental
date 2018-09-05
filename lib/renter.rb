class Renter
  attr_reader :name, :credit_card_number, :boats_rented

  def initialize(name, credit_card_number)
    @name = name
    @credit_card_number = credit_card_number
  end
  
end
