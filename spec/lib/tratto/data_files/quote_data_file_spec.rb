RSpec.describe QuoteDataFile do

  describe '#data' do
    subject { QuoteDataFile.new.data }

    it { expect(subject).to be_an Array }
    it { expect(subject.size).to eq 3 }
    it { expect(subject).to all(be_an(Quote)) }
  end
end
