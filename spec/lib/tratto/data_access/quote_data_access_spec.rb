RSpec.describe QuoteDataAccess do

  describe '#all' do
    let(:quotes) { subject.all }

    it { expect(quotes).to be_an Array }
    it { expect(quotes.size).to be 3 }
    it { expect(quotes).to all(be_an Quote) }
  end

  describe '#find_by' do
    context 'there is a quote' do
      let(:quote) { subject.find_by(currency: 'BRL') }

      it { expect(quote).to be_an Quote }
      it { expect(quote.currency).to eq 'BRL' }
      it { expect(quote.quotation).to eq 3.29 }
    end

    context 'there is not a quote' do
      let(:quote) { subject.find_by(currency: 'BTC') }

      it { expect(quote).to be_nil }
    end
  end

  describe '#find_by!' do
    context 'there is a quote' do
      let(:quote) { subject.find_by!(currency: 'USD') }

      it { expect(quote).to be_an Quote }
      it { expect(quote.currency).to eq 'USD' }
      it { expect(quote.quotation).to eq 1 }
    end

    context 'there is not a quote' do
      let(:quote) { subject.find_by!(currency: 'BTC') }

      it { expect { quote }.to raise_error(Exception, 'Quote with params={:currency=>"BTC"} not found!') }
    end
  end

  describe '#where' do
    context 'there are quotes' do
      let(:quotes) { subject.where(currency: 'USD') }

      it { expect(quotes).to be_an Array }
      it { expect(quotes.size).to be 1 }
      it { expect(quotes).to all(be_an Quote) }
    end

    context 'there are not quotes' do
      let(:quotes) { subject.where(currency: 'BTC') }

      it { expect(quotes).to be_an Array }
      it { expect(quotes).to be_empty }
    end
  end
end
