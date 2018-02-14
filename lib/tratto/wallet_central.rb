class WalletCentral

  def initialize(wallet_data_access: WalletDataAccess.new, exchange: Exchange.new)
    @wda = wallet_data_access
    @exchange = exchange
  end

  def transfer(from_client, to_client, currency, amount)
    from_wallet = wda.find_by!(client: from_client, currency: currency)
    to_wallet = wda.find_by(client: to_client, currency: currency)
    to_wallet = wda.find_by!(client: to_client) unless to_wallet

    direct_transfer(from_wallet, to_wallet, amount)
  end

  def output(client = nil)
    wda.output(client).to_json
  end

  private

  attr_reader :wda, :exchange

  def direct_transfer(from_wallet, to_wallet, amount)
    from_wallet.withdraw(amount)
    to_wallet.deposit(exchange.get_quotation(from_wallet.currency,
                                             to_wallet.currency, amount))
    true
  end
end
