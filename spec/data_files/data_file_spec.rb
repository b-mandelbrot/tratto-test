RSpec.describe DataFile do

  describe '#initialize' do
    context 'fail' do
      it 'should raise an error when class is instantiated' do
        expect{ subject.new }.to raise_error(NotImplementedError)
      end
    end
  end
end
