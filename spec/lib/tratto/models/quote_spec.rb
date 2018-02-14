RSpec.describe Quote do

  subject { Quote.new(currency: 'COIN', quotation: 3.20 ) }

  context 'attributes' do
    it { expect(subject).to have_attributes(currency: 'COIN', quotation: 3.20) }
  end
end
