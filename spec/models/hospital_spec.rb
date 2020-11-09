require 'rails_helper'

describe Hospital, type: :model do
  describe "relationships" do
    it { should have_many :doctors }
  end

  describe "instance methods" do
    before :each do
      @greys = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @meredith = Doctor.create!(name: "Meridith Grey", specialty: "General Surgery", university: "Dartmouth", hospital_id: @greys.id)

      @teddy = Doctor.create!(name: "Teddy Altman", specialty: "Cardiothoracic Surgery", university: "George Washington University", hospital_id: @greys.id)

      @knox = Doctor.create!(name: "Knox", specialty: "Anesthesiology", university: "Dartmouth", hospital_id: @greys.id)
    end

    it "#total_doctors" do
      expect(@greys.total_doctors).to eq(3)
    end

    it "#unique_universities" do
      expected = ['Dartmouth', 'George Washington University']

      expect(@greys.unique_universities).to eq(expected)
    end
  end
end
