class Hospital < ApplicationRecord
  has_many :doctors

  def total_doctors
    doctors.count
  end

  def unique_universities
    doctors.distinct.pluck(:university)
  end
end
