require "rails_helper"

RSpec.feature "User logsout" do
  it "redirects them to the homepage and they see a login button" do
    VCR.use_cassette("User logsout") do
      visit root_path
      click_link "Sign In"
      expect(page).to have_content("mrjoshuagiraffe")

      click_link "Sign Out"
      expect(current_path).to eq(root_path)
      within(".login-nav") do
        expect(page).to have_link("Sign In")
      end
    end
  end
end
