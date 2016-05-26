require "rails_helper"

RSpec.feature "user visits game show " do
  it "sees the channels that are currently live for that game" do
    VCR.use_cassette("User views games show") do
      visit root_path

      within(".navbar") do
        click_link "Games"
      end

      within(".Overwatch") do
        click_link("box-art")
      end

      expect(current_path).to eq(game_path("Overwatch"))
      within(".TimTheTatman") do
        expect(page).to have_content("14296 viewers watching TimTheTatman")
        expect(page).to have_content("not feeling to well, trying to push through;")
      end
      within(".GosuGamers") do
        expect(page).to have_content("11569 viewers watching GosuGamers")
        expect(page).to have_content("Alienware Monthly Melee")
      end
    end
  end
end
