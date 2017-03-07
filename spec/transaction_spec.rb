require 'transaction'

describe Transaction do
  TYPE = 'deposit'
  AMOUNT = 1000
  let(:date) {double :date}
  subject(:transaction){described_class.new(TYPE, AMOUNT, date)}

  describe "#type" do
    context 'when a transaction is created' do
      it 'contains transaction type' do
        expect(transaction.type).to eq TYPE
      end
    end
  end
  describe "#amount" do
    context 'when a transaction is created' do
      it 'contains transaction amount' do
        expect(transaction.amount).to eq AMOUNT
      end
    end
  end
  describe "#date" do
    context 'when a transaction is created' do
      it 'contains transaction date' do
        expect(transaction.date).to eq date
      end
    end
  end
end
