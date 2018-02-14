class Client

  def initialize(client_name:, wallets: [])
    @client = client_name
    @wallets = wallets
  end

  def to_hash
    {
      name: client,
      wallets: wallets.map{ |wallet| [wallet.currency, wallet.amount] }.to_h
    }
  end

  private

  attr_reader :client, :wallets
end
