require 'rails_helper'

RSpec.describe Genre, type: :model do  
  describe 'DB table' do
    it { is_expected.to validate_presence_of :name }
  end
  
  describe 'Associations' do
    it { is_expected.to belong_to :performer }
  end

  describe 'Factory' do
      before :each do
      @performer = FactoryBot.create(:performer)
      
      it 'should have valid Factory' do
            expect(create(:genre)).to be_valid
          end
    end
  end
end
