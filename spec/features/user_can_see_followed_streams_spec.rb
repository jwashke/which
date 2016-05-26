require "rails_helper"

RSpec.feature "user visits following" do
  it "sees the channels they are following that are live" do
    VCR.use_cassette("User views following") do
      visit root_path
      click_link "Sign In"

      within(".navbar") do
        click_link "Following"
      end

      expect(current_path).to eq(following_path)
      expect(page).to have_content("TrumpSC")
      expect(page).to have_content("StrifeCro")
      expect(page).to have_content("nl_Kripp")
    end
  end
end
