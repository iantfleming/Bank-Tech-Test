# frozen_string_literal: true

require 'account'

describe Account do
  it 'can create and instance of account' do
    expect(subject).to be_kind_of(Account)
  end

  it 'responds to the method balance' do
    expect(subject).to respond_to(:balance)
  end

  describe '#balance' do
    it 'gives a default balance of 0' do
      expect(subject.balance).to eq 0
    end
  end
end
