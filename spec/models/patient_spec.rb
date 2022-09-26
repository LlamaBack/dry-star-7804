require 'rails_helper'

RSpec.describe Patient do
  let!(:patient1) {Patient.create!(name: "Katie Bryce", age: 24)}
  let!(:patient2) {Patient.create!(name: "Denny Duquette", age: 39)}
  let!(:patient3) {Patient.create!(name: "Rebecca Pope", age: 32)}
  let!(:patient4) {Patient.create!(name: "Zola Shepherd", age: 2)}

  it {should have_many :doctor_patients}
  it {should have_many(:doctors).through(:doctor_patients)}

  it '#adult_patients' do
    expect(Patient.adult_patients).to eq([patient2,patient1,patient3])
  end
end
