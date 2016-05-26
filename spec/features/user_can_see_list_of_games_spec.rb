require "rails_helper"

RSpec.feature "user visits games index" do
  it "sees the games alongs with current channels and viewers" do
    VCR.use_cassette("User views games index") do
      visit root_path

      within(".navbar") do
        click_link "Games"
      end

      expect(current_path).to eq(games_path)

      within(".Overwatch") do
        expect(page).to have_content("Overwatch")
        expect(page).to have_content("Viewers: 81334")
        expect(page).to have_content("Channels: 4069")
      end
    end
  end
end
