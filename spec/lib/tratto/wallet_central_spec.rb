require 'pry'
RSpec.describe WalletCentral do

  subject { WalletCentral.new }

  context '#transfer' do
    context 'sender' do
      context 'success' do
        context 'sender and receiver have a wallet in the same currency' do
          it 'should transfer the money' do
            expect(JSON.parse(subject.output('jon'))["wallets"]["EUR"])
              .to eq 868.65
            expect(JSON.parse(subject.output('sansa'))["wallets"]["EUR"])
              .to eq 1065.45
            expect(subject.transfer('jon', 'sansa', 'EUR', 100))
              .to be_truthy
            expect(JSON.parse(subject.output('jon'))["wallets"]["EUR"])
              .to eq 768.65
            expect(JSON.parse(subject.output('sansa'))["wallets"]["EUR"])
              .to eq 1165.45
          end
        end

        context 'sender and receiver dont have a wallet in the same currency' do
          it 'should transfer the money' do
            expect(JSON.parse(subject.output('jon'))["wallets"]["USD"])
              .to eq 463.39
            expect(JSON.parse(subject.output('sansa'))["wallets"]["EUR"])
              .to eq 1065.45
            expect(subject.transfer('jon', 'sansa', 'USD', 100))
              .to be_truthy
            expect(JSON.parse(subject.output('jon'))["wallets"]["USD"])
              .to eq 363.39
            expect(JSON.parse(subject.output('sansa'))["wallets"]["EUR"])
              .to eq 1146.45
          end
        end
      end

      context 'fail' do
        context 'sender does not have a wallet' do
          it { expect { subject.transfer('johndoe', 'jon', 'USD', 100) }
            .to raise_error(DataAccess::DataNotFoundError,
              'Wallet with params={:client=>"johndoe", :currency=>"USD"} not found!') }
        end

        context 'sender does not have sufficient funds' do
          it { expect { subject.transfer('jon', 'sansa', 'USD', 100000) }
            .to raise_error(Wallet::InsufficientFundsError,
              'Insufficient funds for client jon currecy USD!')}
        end

        context 'negative value' do
          it { expect { subject.transfer('jon', 'sansa', 'USD', -1) }
          .to raise_error(Wallet::NegativeValueError)}
        end

        context 'receiver does not have a wallet' do
          it { expect { subject.transfer('jon', 'johndoe', 'USD', 100) }
            .to raise_error(DataAccess::DataNotFoundError,
              'Wallet with params={:client=>"johndoe"} not found!') }
        end
      end
    end
  end

  context '#output' do
    context 'for a specific client' do
      let(:client) { JSON.parse(subject.output('jon')) }
      it { expect(client).to be_an Hash }
      it { expect(client)
        .to eq("name" => 'jon', "wallets" => {"EUR" => 868.65, "USD" => 463.39}) }
    end

    context 'for all clients' do
      let(:clients) { JSON.parse(subject.output) }

      it { expect(clients).to be_an Array }
      it { expect(clients.size).to be 11 }
      it { expect(clients.first)
        .to eq("name" => 'jon', "wallets" => {"EUR" => 868.65, "USD" => 463.39}) }
    end
  end
end
