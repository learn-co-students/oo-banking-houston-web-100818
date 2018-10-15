require_relative './bank_account.rb'
require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
    self.status = 'pending'
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
    #binding.pry
  end

  def execute_transaction
    while self.valid? && self.status == 'pending'
      self.sender.deposit(-amount)
      self.receiver.deposit(amount)
      self.status = "complete"
    end
    if self.valid? == false
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(amount)
      self.receiver.deposit(-amount)
      self.status = "reversed"
    end
  end

end