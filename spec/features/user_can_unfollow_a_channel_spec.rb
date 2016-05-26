require "rails_helper"

RSpec.feature "user unfollows a channel" do
  it "redirects them to following and they do not see the channel" do
    VCR.use_cassette("User unfollows a channel") do
      visit root_path
      click_link "Sign In"

      within(".VGBootCamp") do
        click_link "Follow Stream"
      end
      within(".VGBootCamp") do
        click_link "Unfollow Stream"
      end

      expect(current_path).to eq(following_path)
      expect(page).not_to have_content("VGBootCamp")
    end
  end
end
