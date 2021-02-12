# frozen_string_literal: true

require 'terminal-table'
require_relative 'transaction'
class Account
  attr_accessor :balance, :transactions

  BALANCE_MIN = 0
  INITIAL_BALANCE = 0
  STATEMENT_TITLES = %w[Date Credit Debit Balance].freeze

  def initialize
    @balance = INITIAL_BALANCE
    @balance_min = BALANCE_MIN
    @transactions = []
  end

  def deposit(amount)
    @transactions << Transaction.new(amount, 0, balance + amount)
    @balance += amount
  end

  def withdraw(amount)
    raise "Balance cannot fall below #{Account::BALANCE_MIN}" if debit_over_limit?(amount)

    @transactions << Transaction.new(0, amount, balance - amount)
    @balance -= amount
  end

  def debit_over_limit?(amount)
    @balance < amount
  end

  def print_table
    rows = generate_table(transactions)
    access_table(rows)
    rows
  end

  private

  def generate_table(transactions)
    rows = [STATEMENT_TITLES]
    transactions.each do |transaction|
      rows << [transaction.date, transaction.credit, transaction.debit, transaction.balance]
    end
    rows
  end

  def access_table(rows)
    Terminal::Table.new rows: rows
  end
end

# require './spec/feature_spec.rb'
# a = Account.new
# t = Transaction.new(0, 0, 0)
# a.deposit(4000)
# a.print_table
