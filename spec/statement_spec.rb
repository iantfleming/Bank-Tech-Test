# frozen_string_literal: true

require 'statement'

describe Statement do
  it 'can create an instance of statement' do
    expect(subject).to be_kind_of(Statement)
  end

  describe '#initialize' do
    it 'contains an empty statement array when initialized' do
      expect(subject.display).to be_empty
    end
  end
end
