# frozen_string_literal: true

require 'account'

describe Account do
  it 'responds to the method balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'responds to the method deposit' do
    expect(subject).to respond_to(:deposit).with(1).argument
  end

  it 'responds to the method withdraw' do
    expect(subject).to respond_to(:withdraw).with(1).argument
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

    describe '#deposit' do
      it 'deposits 20 to the current balance' do
        subject.deposit(20)
        expect(subject.balance).to eq 20
      end

      it 'accepts multiple individual deposits' do
        subject.deposit(40)
        subject.deposit(20)
        expect(subject.balance).to eq 60
      end
    end

    describe '#withdraw' do
      it 'subtracts a deposit from the current balance' do
        subject.deposit(20)
        subject.withdraw(5)
        expect(subject.balance).to eq 15
      end

      it 'accepts multiple individual withdrawals' do
        subject.deposit(20)
        subject.withdraw(5)
        subject.withdraw(6)
        expect(subject.balance).to eq 9
      end
    end

    it "raises an error when balance goes below #{Account::BALANCE_MIN}" do
      message = "Balance cannot fall below #{Account::BALANCE_MIN}"
      subject.deposit(5)
      expect { subject.withdraw(6) }.to raise_error message
    end
  end
end
