class Transaction
  attr_reader :type, :amount, :date

  def initialize(type, amount, date = Time.now)
    @type = type
    @amount = amount
    @date = date
  end
end
