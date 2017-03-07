require_relative 'transaction'
require_relative 'transaction_log'

class Account
  attr_reader :transaction_log

  def initialize(log = Transaction_log.new)
    @transaction_log = log
  end

  def add_transaction(type, amount)
    transaction = Transaction.new(type, amount)
    transaction_log.add_new(transaction)
  end
end
