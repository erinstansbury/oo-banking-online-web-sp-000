class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
      if @status == "complete"
        puts "Transaction was already excuted"
      elsif @sender.balance < amount
        @status = "rejected"
        puts "Transaction rejected. Please check your account balance."
      else @sender.valid? && @sender.balance > amount
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
