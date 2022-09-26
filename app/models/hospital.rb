class Hospital < ApplicationRecord
  has_many :doctors

  def doctors_by_num_patients
    doctors.joins(:patients).group(:id).order('Count(patients.id) DESC')
  end
end
