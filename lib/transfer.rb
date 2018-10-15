require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.status = 'pending'
    self.amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if self.status == 'pending'
      if !self.sender.valid? || self.amount > self.sender.balance
        self.status = 'rejected'
        "Transaction rejected. Please check your account balance."
      else
        self.sender.deposit(-self.amount)
        self.receiver.deposit(self.amount)
        self.status = 'complete'
      end
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      self.sender.deposit(self.amount)
      self.receiver.deposit(-self.amount)
      self.status = 'reversed'
    end
  end

end




# The Transfer class acts as a space for a transaction between two instances of the bank account class. Think of it this way: you can't just transfer money to another account without the bank running checks first. Transfer instances will do all of this, as well as check the validity of the accounts before the transaction occurs. Transfer instances should be able to reject a transfer if the accounts aren't valid or if the sender doesn't have the money.
#
# Transfers start out in a "pending" status. They can be executed and go to a "complete" state. They can also go to a "rejected" status. A completed transfer can also be reversed and go into a "reversed" status.
