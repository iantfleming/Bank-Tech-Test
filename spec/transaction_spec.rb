# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new(1000, 200, 800) }

  describe 'initialization' do
    it 'takes 3 arguments' do
      expect(described_class).to respond_to(:new).with(3).arguments
    end

    it 'is initialized with the current date' do
      expect(transaction.date).to eq(Time.new.strftime(Transaction::DATE_FORMAT))
    end

    it 'is created with an accessible credit attribute' do
      expect(transaction.credit).to eq(1000)
    end
    it 'is created with an accessible debit attribute' do
      expect(transaction.debit).to eq(200)
    end
    it 'is created with an accessible balance attribute' do
      expect(transaction.balance).to eq(800)
    end
  end
end
