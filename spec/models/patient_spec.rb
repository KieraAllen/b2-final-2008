require 'rails_helper'

describe Patient, type: :model do
  describe "relationships" do
    it { should belong_to :doctor }
  end
end
