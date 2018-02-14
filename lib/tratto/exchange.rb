class Exchange

  def initialize
    @quote_data_access = QuoteDataAccess.new
  end

  def get_quotation(from_currency, to_currency, amount = 1)
    from = @quote_data_access.find_by(currency: from_currency)
    to = @quote_data_access.find_by(currency: to_currency)
    (amount / from.quotation * to.quotation).round(2)
  end
end
