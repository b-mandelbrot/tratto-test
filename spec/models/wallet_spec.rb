RSpec.describe Wallet do

  subject { Wallet.new(client: 'johndoe', currency: 'USD', amount: 100 ) }

  context 'attributes' do
    it { expect(subject).to have_attributes(client: 'johndoe',
                                            currency: 'USD',
                                            amount: 100) }
  end

  context '#withdraw' do
    context 'success' do
      it { expect(subject.withdraw(100)).to eq 0 }
    end

    context 'insufficient funds' do
      it { expect { subject.withdraw(101) }.to raise_error(Wallet::InsufficientFundsError,
        'Insufficient funds for client johndoe currecy USD!') }
    end

    context 'negative value' do
      it { expect { subject.withdraw(-1) }.to raise_error(Wallet::NegativeValueError) }
    end
  end

  context '#deposit' do
    context 'success' do
      it { expect(subject.deposit(100)).to eq 200 }
    end

    context 'negative value' do
      it { expect { subject.deposit(-1) }.to raise_error(Wallet::NegativeValueError) }
    end
  end
end
