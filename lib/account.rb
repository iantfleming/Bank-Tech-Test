# frozen_string_literal: true

require_relative 'transaction'

class Account
  attr_reader :balance, :transactions

  BALANCE_MIN = 0
  INITIAL_BALANCE = 0

  def initialize
    @balance = INITIAL_BALANCE
    @balance_min = BALANCE_MIN
    # @statement = TransactionRecord.new
    @transactions = []
  end

  def deposit(amount)
    @transactions << Transaction.new(amount, 0, balance + amount)
    @balance += amount
  end

  def withdraw(amount)
    raise "Balance cannot fall below #{Account::BALANCE_MIN}" if withdraw_over_limit?(amount)

    @transactions << Transaction.new(0, amount, balance - amount)
    @balance -= amount
  end

  def withdraw_over_limit?(amount)
    @balance < amount
  end

  def display
    p @transactions
  end
end
