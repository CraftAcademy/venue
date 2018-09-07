require 'rails_helper'

RSpec.describe User, type: :model do
  describe "DB table" do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :role }
  end

  describe "Factory" do
    it "for :user is valid" do
      expect(create(:user)).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many :campaigns }
    it { is_expected.to have_many :genres}
  end

  describe 'User roles' do
    let(:user_fan) { create :user, role: :fan }
    let(:user_artist) { create :user, role: :artist }

    it 'fan responds true if role is fan' do
      expect(user_fan.fan?).to eq true
    end

    it 'fan responds false if role is not fan' do
      expect(user_fan.artist?).to eq false
    end
    
    it 'artist responds true if role is artist' do
      expect(user_artist.artist?).to eq true
    end

    it 'artist responds false if role is not artist' do
      expect(user_artist.fan?).to eq false
    end
  end

    describe 'Genres' do 
      it { is_expected.to belong_to :users}
    end

  describe 'OAuth methods - Facebook and Google' do
    let(:facebook_auth_response) { OmniAuth::AuthHash.new(OmniAuthFixtures.facebook_mock) }
    let(:google_auth_response) { OmniAuth::AuthHash.new(OmniAuthFixtures.google_oauth2_response) }
    let(:create_user_from_facebook) { lambda {User.from_omniauth(facebook_auth_response)}}
    let(:create_user_from_google) { lambda {User.from_omniauth(google_auth_response)}}

    it 'creates an instance from an Facebook oauth hash' do
      expect{create_user_from_facebook.call}.to change{ User.count}.from(0).to(1)
    end

    it 'creates an instance from an Google oauth hash' do
      expect{create_user_from_google.call}.to change{ User.count}.from(0).to(1)
    end

    describe 'Facebook' do
      before do
        create_user_from_facebook.call
        @user = User.last
      end
      it 'has Facebook as provider' do
        expect(@user.provider).to eq("facebook")
      end
    end

    describe 'Google' do
      before do
        create_user_from_google.call
        @user = User.last
      end
      it 'has Google as provider' do
        expect(@user.provider).to eq("google_oauth2")
      end
    end
  end
end
