require 'rails_helper'

RSpec.describe Shop, type: :model do
  let(:shop) { FactoryBot.create(:shop) }

  context 'before save' do  
    it 'is not valid with a blank name' do
      shop.update(name: '')
      expect(shop).not_to be_valid
    end
  end
end
