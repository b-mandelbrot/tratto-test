class Quote

  attr_reader :currency, :quotation

  def initialize(currency:, quotation:)
    @currency = currency
    @quotation = quotation
  end
end
