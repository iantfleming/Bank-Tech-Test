# frozen_string_literal: true

require 'account'

describe Account do
  it 'responds to the method balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'responds to the method credit' do
    expect(subject).to respond_to(:credit).with(1).argument
  end

  it 'responds to the method debit' do
    expect(subject).to respond_to(:debit).with(1).argument
  end

  describe '#initialize' do
    it 'initializes with an empty bank balance' do
      expect(subject.balance).to eq 0
    end

    describe '#balance' do
      it 'gives a default balance of 0' do
        expect(subject.balance).to eq 0
      end
    end

    describe '#credit' do
      it 'credits 20 to the current balance' do
        subject.credit(20)
        expect(subject.balance).to eq 20
      end

      it 'accepts multiple individual credits' do
        subject.credit(40)
        subject.credit(20)
        expect(subject.balance).to eq 60
      end
    end

    describe '#debit' do
      it 'subtracts a credit from the current balance' do
        subject.credit(20)
        subject.debit(5)
        expect(subject.balance).to eq 15
      end

      it 'accepts multiple individual debitals' do
        subject.credit(20)
        subject.debit(5)
        subject.debit(6)
        expect(subject.balance).to eq 9
      end
    end

    it "raises an error when balance goes below #{Account::BALANCE_MIN}" do
      message = "Balance cannot fall below #{Account::BALANCE_MIN}"
      subject.credit(5)
      expect { subject.debit(6) }.to raise_error message
    end
  end
end
