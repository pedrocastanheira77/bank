require_relative 'transaction'

class Transaction_log
  attr_accessor :transactions, :log

  def initialize(initial_amount = 0, log = [[Time.now,"","",initial_amount]])
    @initial_amount = initial_amount
    @log = log
    @transactions = []
  end

  def add_transaction(transaction)
    update_log(transaction)
    @transactions << transaction
  end

  def update_log(transaction)
    @log << [transaction.date, transaction.type, transaction.amount, update_balance(transaction)]
  end

  private

  def update_balance(transaction)
    previous_balance = @log.last
    return previous_balance.last + transaction.amount if transaction.type == "deposit"
    return previous_balance.last - transaction.amount if transaction.type == "withdrawal"
  end
end
