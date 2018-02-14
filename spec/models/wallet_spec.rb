RSpec.describe Wallet do

  subject { Wallet.new(client: 'johndoe', currency: 'USD', amount: 100 ) }

  context 'attributes' do
    it { expect(subject).to have_attributes(client: 'johndoe',
                                            currency: 'USD',
                                            amount: 100) }
  end
end
