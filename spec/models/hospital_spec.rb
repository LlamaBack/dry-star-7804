require 'rails_helper'

RSpec.describe Hospital do
  let!(:hospital1) {Hospital.create!(name: "Grey Sloan Memorial Hospital")}

  let!(:doctor1) {hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")}
  let!(:doctor2) {hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")}

  let!(:patient1) {doctor1.patients.create!(name: "Katie Bryce", age: 24)}
  let!(:patient2) {doctor1.patients.create!(name: "Denny Duquette", age: 39)}
  let!(:patient3) {doctor2.patients.create!(name: "Rebecca Pope", age: 32)}
  let!(:patient4) {doctor2.patients.create!(name: "Zola Shepherd", age: 2)}
  let!(:patient5) {doctor2.patients.create!(name: "Jake Kim", age: 6)}
  it {should have_many :doctors}

  it 'orders doctors by num patients' do
    expect(hospital1.doctors_by_num_patients).to eq([doctor2, doctor1])
  end
end
