# frozen_string_literal: true

require 'account'

describe 'Account holder transactions' do
  it 'prints whatever the account user does along with the date' do
    account = Account.new
    account.deposit(1000)
    account.withdraw(200)
    expect(account.print_statement).to eq([
      Account::STATEMENT_TITLES,
      [Time.new.strftime(DATE_FORMAT), 1000, 0, 1000],
      [Time.new.strftime(DATE_FORMAT), 0, 200, 800]
      ])
  end
end
