require "rails_helper"

RSpec.feature "User logs in with twitch" do
  it "redirects them to the homepage and they see a welcome message" do
    VCR.use_cassette("User logs in") do
      visit root_path
      click_link "Sign In"

      expect(current_path).to eq(root_path)
      within(".login-nav") do
        expect(page).to have_content("mrjoshuagiraffe")
        expect(page).to have_link("Sign Out")
      end
    end
  end
end
