require 'account'

describe Account do
  let(:transaction){double :transaction}
  let(:transaction_log){double :transaction_log}
  subject(:account) {described_class.new(transaction_log)}

  describe '#transaction_log' do
    it 'creates a transaction_log for the account' do
      expect(account.transaction_log).to eq transaction_log
    end
  end

  describe '#add_transaction' do
    it 'has a add_transaction method' do
      expect(account).to respond_to(:add_transaction).with(2).arguments
    end
  end
end
