require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit a doctor's show page" do
    before(:each) do
      @greys = Hospital.create!(name: "Grey Sloan Memorial Hospital")

      @meredith = Doctor.create!(name: "Meridith Grey", specialty: "General Surgery", university: "Dartmouth", hospital_id: @greys.id)

      @patient_1 = Patient.create!(name: "Beatrix Potter", age: 45, doctor_id: @meredith.id)
      @patient_2 = Patient.create!(name: "Ramona Quimby", age: 12, doctor_id: @meredith.id)
      @patient_3 = Patient.create!(name: "Herman Munster", age: 100, doctor_id: @meredith.id)
    end

    it "can see doctor's name, specialty, and university, the hospital where they work, and the names of all their patients" do

      visit "/doctors/#{@meredith.id}"

      expect(page).to have_content("Doctor: #{@meredith.name}")
      expect(page).to have_content("Hospital: #{@greys.name}")
      expect(page).to have_content("Specialty: #{@meredith.specialty}")
      expect(page).to have_content("University: #{@meredith.university}")
      expect(page).to have_content(@patient_1.name)
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_3.name)
    end

    it "has a button that removes patient from doctor's caseload next to each patient" do
      visit "/doctors/#{@meredith.id}"
save_and_open_page
        within("#patient-#{@patient_1.id}") do
          expect(page).to have_button("Remove")
        end

        within("#patient-#{@patient_2.id}") do
          expect(page).to have_button("Remove")
        end

        within("#patient-#{@patient_3.id}") do
          expect(page).to have_button("Remove")
        end
    end
  end
end



# Next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed
