# frozen_string_literal: true

class TransactionRecord
  attr_reader :statement

  def initialize
    @statement = []
  end

  def add_transaction(date = Time.new.strftime('%Y-%m-%d'), withdrawal, deposit, balance)
    p @statement << { date: date, withdrawal: withdrawal, deposit: deposit, balance: balance }
  end

  def display
    @statement.map {|x| x.values}.join(', ')
  end

  private

  attr_writer :statement
end
