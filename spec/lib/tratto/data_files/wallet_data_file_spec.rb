RSpec.describe WalletDataFile do

  describe '#data' do
    subject { WalletDataFile.new.data }

    it { expect(subject).to be_an Array }
    it { expect(subject.size).to be 20 }
    it { expect(subject).to all(be_an(Wallet)) }
  end
end
