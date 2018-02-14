class WalletDataFile < DataFile

  private

  def load_data
    wallets = CSV.read(File.join(File.dirname(__FILE__), '../../resources/wallets.csv'))
    wallets.shift
    set_wallets(wallets)
  end

  def set_wallets(wallets)
    wallets.each do |wallet|
      add_data(create_wallet(wallet[0], wallet[1], wallet[2].to_f))
    end
  end

  def create_wallet(name, currency, amount)
    Wallet.new(client: name, currency: currency, amount: amount)
  end
end
