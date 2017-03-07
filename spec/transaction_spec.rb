require 'transaction'

describe Transaction do
  TYPE = 'deposit'
  AMOUNT = 1000
  
  describe "#create_new" do
    it 'has a create_new method' do
      expect(Transaction).to respond_to(:create_new).with(2).argument
    end

    context 'when a transaction is done' do
      it 'contains transaction type, amount, and date' do
        time = "11-12-2016"
        expect(Transaction.create_new(TYPE, AMOUNT, time)).to eq [time, TYPE, AMOUNT]
      end
    end
  end
end
