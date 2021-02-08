# frozen_string_literal: true

class Statement
  def initialize
    @bank_statement = []
  end

  def record_transaction(balance)
    @bank_statement << balance
  end

  def display
    @bank_statement
  end
end
