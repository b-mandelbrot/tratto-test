class QuoteDataAccess < DataAccess

  def initialize(data = QuoteDataFile.new.data)
    super
  end
end
