# frozen_string_literal: true

require 'statement'

describe Statement do
  it 'can create and instance of statement' do
    expect(subject).to be_kind_of(Statement)
  end
end
