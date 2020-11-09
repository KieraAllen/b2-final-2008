require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit a hospital's show page" do
    before(:each) do
      @greys = Hospital.create!(name: "Grey Sloan Memorial Hospital")

      @meredith = Doctor.create!(name: "Meridith Grey", specialty: "General Surgery", university: "Dartmouth", hospital_id: @greys.id)
      @teddy = Doctor.create!(name: "Teddy Altman", specialty: "Cardiothoracic Surgery", university: "George Washington University", hospital_id: @greys.id)
      @knox = Doctor.create!(name: "Knox", specialty: "Anesthesiology", university: "Dartmouth", hospital_id: @greys.id)
    end

    it "can see hospital's name, number of doctors that work at this hospital, and unique list of universities those doctors attend" do

      visit "/hospitals/#{@greys.id}"

      expect(page).to have_content("Hospital: #{@greys.name}")
      expect(page).to have_content("Number of Doctors on Staff: 3")
      expect(page).to have_content("Universities Attended:")
      expect(page).to have_content(@meredith.university)
      expect(page).to have_content(@teddy.university)
      expect(page).to have_content(@knox.university)
    end
  end
end
