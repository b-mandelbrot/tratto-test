RSpec.describe WalletDataAccess do

  describe '#all' do
    let(:wallets) { subject.all }

    it { expect(wallets).to be_an Array }
    it { expect(wallets.size).to be 20 }
    it { expect(wallets).to all(be_an Wallet) }
  end

  describe '#find_by' do
    context 'there is a wallet' do
      let(:wallet) { subject.find_by(client: 'jon') }

      it { expect(wallet).to be_an Wallet }
      it { expect(wallet.client).to eq 'jon' }
      it { expect(wallet.currency).to eq 'EUR' }
      it { expect(wallet.amount).to eq 868.65 }
    end

    context 'there is not a wallet' do
      let(:wallet) { subject.find_by(client: 'johndoe') }

      it { expect(wallet).to be_nil }
    end

    context 'there is a wallet of a specific currency' do
      let(:wallet) { subject.find_by(client: 'jon', currency: 'USD') }

      it { expect(wallet).to be_an Wallet }
      it { expect(wallet.client).to eq 'jon' }
      it { expect(wallet.currency).to eq 'USD' }
      it { expect(wallet.amount).to eq 463.39 }
    end

    context 'there is not a wallet of a specific currency' do
      let(:wallet) { subject.find_by(client: 'jon', currency: 'BTC') }

      it { expect(wallet).to be_nil }
    end
  end

  describe '#find_by!' do
    context 'there is a wallet' do
      let(:wallet) { subject.find_by!(client: 'jon') }

      it { expect(wallet).to be_an Wallet }
      it { expect(wallet.client).to eq 'jon' }
      it { expect(wallet.currency).to eq 'EUR' }
      it { expect(wallet.amount).to eq 868.65 }
    end

    context 'there is not a wallet' do
      let(:wallet) { subject.find_by!(client: 'johndoe') }

      it { expect { wallet }.to raise_error(Exception,
        'Wallet with params={:client=>"johndoe"} not found!') }
    end

    context 'there is a wallet of a specific currency' do
      let(:wallet) { subject.find_by!(client: 'jon', currency: 'USD') }

      it { expect(wallet).to be_an Wallet }
      it { expect(wallet.client).to eq 'jon' }
      it { expect(wallet.currency).to eq 'USD' }
      it { expect(wallet.amount).to eq 463.39 }
    end

    context 'there is not a wallet of a specific currency' do
      let(:wallet) { subject.find_by!(client: 'jon', currency: 'BTC') }

      it { expect { wallet }.to raise_error(Exception,
        'Wallet with params={:client=>"jon", :currency=>"BTC"} not found!') }
    end
  end

  describe '#where' do
    context 'there are wallets' do
      let(:wallets) { subject.where(client: 'jon') }

      it { expect(wallets).to be_an Array }
      it { expect(wallets.size).to be 2 }
      it { expect(wallets).to all(be_an Wallet) }
    end

    context 'there are not wallets' do
      let(:wallets) { subject.where(client: 'johndoe') }

      it { expect(wallets).to be_an Array }
      it { expect(wallets).to be_empty }
    end

    context 'there are wallets of a specific currency' do
      let(:wallets) { subject.where(client: 'jon', currency: 'USD') }

      it { expect(wallets).to be_an Array }
      it { expect(wallets.size).to be 1 }
      it { expect(wallets).to all(be_an Wallet) }
    end

    context 'there are not wallets of a specific currency' do
      let(:wallets) { subject.where(client: 'jon', currency: 'BTC') }

      it { expect(wallets).to be_an Array }
      it { expect(wallets).to be_empty }
    end
  end
end
