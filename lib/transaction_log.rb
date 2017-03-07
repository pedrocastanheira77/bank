require_relative 'transaction'

class Transaction_log
  attr_accessor :transactions, :list

  def initialize(initial_amount = 0, list = [[Time.now,"","",initial_amount]])
    @initial_amount = initial_amount
    @list = list
    @transactions = []
  end

  def add_new(transaction)
    update_log(transaction)
    @transactions << transaction
  end

  def update_log(transaction)
    @list << [transaction.date, transaction.type, transaction.amount, update_balance(transaction)]
  end

  private

  def update_balance(transaction)
    previous_balance = @list.last
    return previous_balance.last + transaction.amount if transaction.type == "deposit"
    return previous_balance.last - transaction.amount if transaction.type == "withdrawal"
  end
end
