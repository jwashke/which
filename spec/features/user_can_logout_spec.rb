require "rails_helper"

RSpec.feature "User logsout" do
  it "redirects them to the homepage and they see a login button" do
    visit root_path
    click_link "Sign in with Twitch"
    expect(page).to have_content("mrjoshuagiraffe")

    click_link "Logout"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Sign in with Twitch")
  end
end
