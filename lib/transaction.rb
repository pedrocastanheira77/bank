class Transaction

  def self.create_new(type, amount, time = Time.now)
    [time, type, amount]
  end

end
