# frozen_string_literal: true

class Transaction

  DATE_FORMAT = '%d/%m/%Y'

  attr_reader :date, :deposit, :withdraw, :balance

  def initialize(deposit, withdraw, balance)
    @date = Time.new.strftime(DATE_FORMAT)
    @deposit = deposit
    @withdraw = withdraw
    @balance = balance
  end
end
