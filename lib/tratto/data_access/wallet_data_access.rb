class WalletDataAccess < DataAccess

  def initialize(data = WalletDataFile.new.data)
    super
  end

  def output(client = nil)
    if client
      Client.new(client_name: client, wallets: where(client: client)).to_hash
    else
      all.map { |wallet| wallet.client }
         .map { |client| Client.new(client_name: client,
                                    wallets: where(client: client)).to_hash }
         .uniq

    end
  end
end
