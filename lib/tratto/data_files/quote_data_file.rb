class QuoteDataFile < DataFile

  private

  def load_data
    @quotes = CSV.read(File.join(File.dirname(__FILE__), '../../resources/quotes.csv'))
    @quotes.shift
    set_quotes(@quotes.to_h)
  end

  def set_quotes(quotes)
    quotes.each { |key, value| add_data(create_quote(key, value.to_f)) }
  end

  def create_quote(currency, quotation)
    Quote.new(currency: currency, quotation: quotation)
  end
end
