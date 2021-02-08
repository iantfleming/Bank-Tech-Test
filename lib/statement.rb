# frozen_string_literal: true

class Statement
  def initialize
    @bank_statement = []
  end

  def record_transaction(date = Time.new.strftime('%Y-%m-%d'), withdrawal, deposit, balance)
    @bank_statement << { date: date, withdrawal: withdrawal, deposit: deposit, balance: balance }
  end

  def display
    @bank_statement
  end
end
