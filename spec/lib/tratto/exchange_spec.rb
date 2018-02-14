RSpec.describe Exchange do

  describe '#get_quotation' do
    context 'USD' do
      context 'to USD' do
        it { expect(subject.get_quotation('USD', 'USD', 1)).to eq 1 }
      end

      context 'to EUR' do
        it { expect(subject.get_quotation('USD', 'EUR', 1)).to eq 0.81 }
      end

      context 'to BRL' do
        it { expect(subject.get_quotation('USD', 'BRL', 1)).to eq 3.29 }
      end
    end

    context 'EUR' do
      context 'to USD' do
        it { expect(subject.get_quotation('EUR', 'USD', 1)).to eq 1.23 }
      end

      context 'to EUR' do
        it { expect(subject.get_quotation('EUR', 'EUR', 1)).to eq 1 }
      end

      context 'to BRL' do
        it { expect(subject.get_quotation('EUR', 'BRL', 1)).to eq 4.06 }
      end
    end

    context 'BRL' do
      context 'to USD' do
        it { expect(subject.get_quotation('BRL', 'USD', 1)).to eq 0.30 }
      end

      context 'to EUR' do
        it { expect(subject.get_quotation('BRL', 'EUR', 1)).to eq 0.25 }
      end

      context 'to BRL' do
        it { expect(subject.get_quotation('BRL', 'BRL', 1)).to eq 1 }
      end
    end
  end
end
