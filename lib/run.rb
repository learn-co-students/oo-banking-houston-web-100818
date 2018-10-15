require_relative './transfer.rb'
require_relative './bank_account.rb'
require 'pry'

account1 = BankAccount.new("person1")
account2 = BankAccount.new("person2")

transfer1 = Transfer.new(account1, account2, 10)

#binding.pry
