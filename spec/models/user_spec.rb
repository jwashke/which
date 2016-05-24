require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_uniqueness_of(:uid) }
    it { is_expected.to validate_presence_of(:display_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:token) }
  end

  describe ".from_omniauth" do
    it "finds the first record that already exists" do
      user = create(:user, uid: "12345")
      found_user = User.from_omniauth(OmniAuth.config.mock_auth[:twitch])
      
      expect(found_user).to eq(user)
      expect(User.count).to eq(1)
    end

    it "creates a record if one doesn't exist" do

      user = User.from_omniauth(OmniAuth.config.mock_auth[:twitch])

      expect(User.last).to eq(user)
      expect(User.count).to eq(1)
    end
  end
end
