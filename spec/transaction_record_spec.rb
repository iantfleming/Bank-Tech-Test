# frozen_string_literal: true

require 'transaction_record'

describe TransactionRecord do
  subject(:transaction_record) { described_class.new }

  let(:date) { Time.new.strftime('%Y-%m-%d') }
  let(:withdrawal) { 0 }
  let(:deposit) { 1000 }
  let(:balance) { 1000 }

  it 'can create an instance of transaction record' do
    transaction_record = TransactionRecord.new
    expect(subject).to be_kind_of(TransactionRecord)
  end

  describe '#initialize' do
    it 'contains an empty statement array when initialized' do
      expect(subject.display).to be_empty
    end
  end

  describe '#add_transaction' do
    it 'records a customer transaction' do
      transaction_record.add_transaction(date, withdrawal, deposit, balance)
      expect(transaction_record.display).to eq [{ date: date, withdrawal: withdrawal, deposit: deposit,
                                                  balance: balance }]
    end
  end
end

# frozen_string_literal: true

# require 'statement'
#
# describe Statement do
#   subject(:statement) { described_class.new }
#
#   let(:balance) { 1000 }
#
#   it 'can create an instance of statement' do
#     statement = Statement.new
#     expect(subject).to be_kind_of(Statement)
#   end
#
#   describe '#initialize' do
#     it 'contains an empty statement array when initialized' do
#       expect(subject.display).to be_empty
#     end
#   end
#
#   describe '#record_transaction' do
#     it 'records a customer transaction' do
#       expect(statement.record_transaction(balance)).to eq [balance]
#     end
#   end
# end
