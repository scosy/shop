require 'rails_helper'

RSpec.describe Shop, type: model do
  it 'is not valid with a blank name' do
    expect(described_class.new(name: '')).not_to be_valid
  end
end