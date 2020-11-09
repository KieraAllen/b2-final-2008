# User Story 1, Doctors Show Page
# ​
# As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#  - name
#  - specialty
#  - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has

require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit a doctor's show page" do
    before(:each) do
      @greys = Hospital.create!(name: "Grey Sloan Memorial Hospital")

      @meredith = Doctor.create!(name: "Meridith Grey", specialty: "General Surgery", university: "Dartmouth", hospital_id: @greys.id)

      @patient_1 = Patient.create!(name: "Beatrix Potter", age: 45)
      @patient_2 = Patient.create!(name: "Ramona Quimby", age: 12)
      @patient_3 = Patient.create!(name: "Herman Munster", age: 100)
    end

    it "can see doctor's name, specialty, and university, the hospital where they work, and the names of all their patients" do

      visit "/doctors/#{@meredith.id}"


        within("#patients") do
          expect(page).to have_content(@patient_1.name)
          expect(page).to have_content(@patient_2.name)
          expect(page).to have_content(@patient_3.name)
        end

      expect(page).to have_content("Doctor: #{@meredith.name}")
      expect(page).to have_content("Specialty: #{@meredith.specialty}")
      expect(page).to have_content("University: #{@meredith.university}")

      expect(page).to have_content("Hospital: #{@greys.name}")
    end
  end
end
