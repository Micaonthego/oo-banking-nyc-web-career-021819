class Transfer
  attr_reader :sender, :receiver
  attr_accessor :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if status == "pending"
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      @status = "complete"
    end
    if !valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      @status = "reversed"
    end
  end

  # your code here
end
