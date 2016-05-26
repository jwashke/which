require "rails_helper"

RSpec.feature "user follows a channel" do
  it "redirects them to following and they see the channel" do
    VCR.use_cassette("User follows a channel") do
      visit root_path
      click_link "Sign In"

      within(".VGBootCamp") do
        click_link "Follow"
      end

      expect(current_path).to eq(following_path)
      expect(page).to have_content("VGBootCamp")
    end
  end
end
