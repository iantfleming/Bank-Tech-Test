# frozen_string_literal: true

require 'statement'

describe Statement do
  subject(:statement) { described_class.new }

  let(:balance) { 1000 }

  it 'can create an instance of statement' do
    statement = Statement.new
    expect(subject).to be_kind_of(Statement)
  end

  describe '#initialize' do
    it 'contains an empty statement array when initialized' do
      expect(subject.display).to be_empty
    end
  end

  describe '#record_transaction' do
    it 'records a customer transaction' do
      expect(statement.record_transaction(balance)).to eq [balance]
    end
  end
end
