# frozen_string_literal: true

require 'statement'

describe Statement do
  it 'can create an instance of statement' do
    expect(subject).to be_kind_of(Statement)
  end
end
