# frozen_string_literal: true

require 'terminal-table'

class Statement
  attr_reader :transactions

  STATEMENT_TITLES = %w[Date Credit Debit Balance].freeze

  def initialize(transactions)
    @transactions = transactions
  end

  def print
    rows = [STATEMENT_TITLES]
    transactions.each do |transaction|
      rows << [transaction.date, transaction.credit, transaction.debit, transaction.balance]
    end
    access_table(rows)
    rows
  end

  private

  def access_table(rows)
    table = Terminal::Table.new rows: rows
    puts table
  end
end
