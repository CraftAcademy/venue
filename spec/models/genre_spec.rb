require 'rails_helper'

RSpec.describe Genre, type: :model do

  describe 'Associations' do
    it { is_expected.to belong_to :user }
  end
end
