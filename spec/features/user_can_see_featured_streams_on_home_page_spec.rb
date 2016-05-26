require "rails_helper"

RSpec.feature "user can visit homepage" do
  it "sees the featured streams" do
    VCR.use_cassette("User visits homepage") do
      visit root_path

      expect(page).to have_content("Featured Streams")
      expect(page).to have_content("VGBootCamp")
    end
  end
end
