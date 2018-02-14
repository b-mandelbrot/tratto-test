class WalletDataAccess < DataAccess

  def initialize(data = WalletDataFile.new.data)
    super
  end
end
