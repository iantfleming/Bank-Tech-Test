# frozen_string_literal: true

require_relative 'account'

# class TransactionRecord
#   attr_reader :statement
#
#   def initialize
#     @statement = []
#     @account = Account.new
#   end
#
#   def add_transaction(date=Time.new.strftime('%Y-%m-%d'), withdraw, deposit, balance)
#     self.statement << { date: date, withdraw: @account.withdraw, deposit: @account.deposit, balance: @account.balance }
#   end
#
#   def display
#     p @statement.map {|x| x.values}.join(', ')
#   end
#
#   private
#
#   attr_writer :statement
# end

class TransactionRecord
  attr_reader :statement

  def initialize
    @statement = []
  end

  def add_transaction(date = Time.new.strftime('%Y-%m-%d'), withdraw, deposit, balance)
    self.statement << { date: date, withdrawal: withdraw, deposit: deposit, balance: balance }
  end

  def display
    p @statement.map {|x| x.values}.join(', ')
  end

  private

  attr_writer :statement
end
