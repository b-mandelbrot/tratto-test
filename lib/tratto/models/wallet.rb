class Wallet
  class NegativeValueError < Exception; end
  class InsufficientFundsError < Exception; end

  attr_reader :client, :currency, :amount

  def initialize(client:, currency:, amount: 0)
    @client = client
    @currency = currency
    @amount = amount
  end

  def withdraw(value)
    check_negative_value(value)
    check_funds(value)
    @amount = (amount - value).round(2)
  end

  def deposit(value)
    check_negative_value(value)
    @amount = (amount + value).round(2)
  end

  private

  def check_negative_value(value)
    raise NegativeValueError.new "Value cannot be negative!" if value.negative?
  end

  def check_funds(value)
    raise InsufficientFundsError.new "Insufficient funds for client #{client} currecy #{currency}!" if value > amount
  end
end
