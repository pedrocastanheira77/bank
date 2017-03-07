require 'transaction_log'

describe Transaction_log do
  subject(:transaction_log) {described_class.new}
  let(:deposit) {double :transaction}
  let(:withdrawal) {double :transaction}
  let(:date) {double :date}
  before :each do
    allow(deposit).to receive(:type)
    allow(deposit).to receive(:amount)
    allow(deposit).to receive(:date)
  end

  describe "#add_new" do
    it 'adds a transaction to the transactions' do
      expect{transaction_log.add_new(deposit)}.to change{transaction_log.transactions.length}.by(1)
    end
  end

  describe '#update_log' do
    it 'has a update_balance method' do
      expect(transaction_log).to respond_to(:update_log).with(1).arguments
    end

    it 'updates cumulative amount' do
      allow(deposit).to receive(:type).and_return('deposit')
      allow(deposit).to receive(:amount).and_return(1500)
      allow(deposit).to receive(:date).and_return(date)
      transaction_log.update_log(deposit)
      allow(withdrawal).to receive(:type).and_return('withdrawal')
      allow(withdrawal).to receive(:amount).and_return(500)
      allow(withdrawal).to receive(:date).and_return(date)
      transaction_log.update_log(withdrawal)
      expect(transaction_log.list).to include [date, 'deposit', 1500, 1500]
      expect(transaction_log.list).to include [date, 'withdrawal', 500, 1000]
    end
  end
end
