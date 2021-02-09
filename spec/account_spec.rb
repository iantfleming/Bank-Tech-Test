# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { Account.new }

  let(:credit) { 1000 }
  let(:debit) { 200 }
  let(:balance) { 1000 }

  it 'responds to the method balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'responds to the method credit' do
    expect(subject).to respond_to(:deposit).with(1).argument
  end

  it 'responds to the method debit' do
    expect(subject).to respond_to(:withdraw).with(1).argument
  end

  describe 'initialization' do
    it 'initializes with an empty bank balance' do
      expect(subject.balance).to eq 0
    end

    describe '#balance' do
      it 'gives a default balance of 0' do
        expect(subject.balance).to eq 0
      end
    end

    describe '#deposit' do
      it 'credits 20 to the current balance' do
        subject.deposit(credit)
        expect(subject.balance).to eq credit
      end

      it 'accepts multiple individual credits' do
        subject.deposit(credit)
        subject.deposit(credit)
        expect(subject.balance).to eq credit + credit
      end
    end

    describe '#debit' do
      it 'subtracts a credit from the current balance' do
        subject.deposit(credit)
        subject.withdraw(debit)
        expect(subject.balance).to eq credit - debit
      end

      it 'accepts multiple individual debits' do
        subject.deposit(credit)
        subject.withdraw(debit)
        subject.withdraw(debit)
        expect(subject.balance).to eq credit - debit * 2
      end
    end

    it "raises an error when balance goes below #{Account::BALANCE_MIN}" do
      message = "Balance cannot fall below #{Account::BALANCE_MIN}"
      subject.deposit(credit)
      expect { subject.withdraw(debit * 10) }.to raise_error message
    end
  end
end
