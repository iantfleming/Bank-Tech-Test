# frozen_string_literal: true

class Account
  attr_reader :balance
  BALANCE_MIN = 0

  def initialize(balance = 0)
    @balance = balance
    @balance_min = BALANCE_MIN
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise "Balance cannot fall below #{Account::BALANCE_MIN}" if withdraw_over_limit?(amount)
    @balance -= amount
  end

  def withdraw_over_limit?(amount)
    @balance < amount
  end
end
