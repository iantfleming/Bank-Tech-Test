require 'statement'

describe Statement do
  let(:transaction) { Transaction.new(1000, 200, 800) }
  let(:statement) { Statement.new(transaction) }

  let(:credit) { 1000 }
  let(:debit) { 200 }
  let(:balance) { 1000 }

  describe '#print' do
    it 'prints the date, credit, debit and balance' do
      account = Account.new
      account.deposit(credit)
      expect(statement.print).to eq([
        Account::STATEMENT_TITLES,
        [Time.new.strftime(DATE_FORMAT), 1000, 0, 1000]
      ])
    end
  end
end
