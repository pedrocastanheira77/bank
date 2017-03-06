require 'transaction'

TYPE = 'deposit'
AMOUNT = 1000

describe Transaction do
  describe "#create_new" do
    it 'has a create_new method' do
      expect(Transaction).to respond_to(:create_new).with(2).argument
    end

    context 'when a transaction is done' do
      it 'contains transaction type, amount, and date' do
        time = Time.now
        expect(Transaction.create_new(TYPE, AMOUNT, time)).to eq [time, TYPE, AMOUNT]
      end
    end
  end
end
