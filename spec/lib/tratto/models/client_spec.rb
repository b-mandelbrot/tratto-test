RSpec.describe Client do

  let(:wallets) { [Wallet.new(client: 'johndoe',
                                            currency: 'USD', amount: 100)] }
  subject { Client.new(client_name: 'johndoe',
                       wallets: wallets ) }

  context '#to_hash' do
    it { expect(subject.to_hash).to eq(name: 'johndoe',
                                       wallets: { "USD" => 100}) }
  end
end
