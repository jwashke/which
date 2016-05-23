require "rails_helper"

RSpec.feature "User logs in with twitch" do
  it "redirects them to the homepage and they see a welcome message" do
    visit root_path
    click_link "Sign in with Twitch"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("mrjoshuagiraffe")
    expect(page).to have_link("Logout")
  end
end
