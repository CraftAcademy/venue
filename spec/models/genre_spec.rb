require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to :user }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:genre)).to be_valid 
    end
  end
end
