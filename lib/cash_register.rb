require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items, :quantity
  attr_reader :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity=1)
    # @quantity = quantity
    quantity.times do
      @items << item
    end
    @total = @total + (price * quantity)

    @last_transaction = @total
  end

  def apply_discount
    @discount = total * (discount/100.0)
    @total = @total - @discount
    if @discount > 0
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
