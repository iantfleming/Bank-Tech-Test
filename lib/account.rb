# frozen_string_literal: true

require_relative 'transaction_record'

class Account
  attr_reader :balance

  BALANCE_MIN = 0

  def initialize(balance = 0)
    @balance = balance
    @balance_min = BALANCE_MIN
    @transaction_record = TransactionRecord.new
  end

  def deposit(amount)
    @transaction_record.add_transaction(Time.new.strftime('%Y-%m-%d'), 0, amount, balance + amount)
    @balance += amount
  end

  def withdraw(amount)
    raise "Balance cannot fall below #{Account::BALANCE_MIN}" if withdraw_over_limit?(amount)

    @transaction_record.add_transaction(Time.new.strftime('%Y-%m-%d'), amount, 0, balance - amount)
    @balance -= amount
  end

  def withdraw_over_limit?(amount)
    @balance < amount
  end
end
