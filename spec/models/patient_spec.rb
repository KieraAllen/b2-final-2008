require 'rails_helper'

describe Patient, type: :model do
  describe "relationships" do
    it { should have_many :doctors }
  end
end
