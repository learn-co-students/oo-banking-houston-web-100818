require_relative './transfer.rb'
require 'pry'

class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        self.balance = 1000
        self.status = "open"
        @@all << self
    end

    def self.all
        @@all
    end

    def deposit(amount)
        self.balance += amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        (self.status == 'open') && (self.balance > 0)
    end

    def close_account
        self.status = "closed"
    end

end
