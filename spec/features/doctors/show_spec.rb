require 'rails_helper'

RSpec.describe 'doctors show page' do
    let!(:hospital1) {Hospital.create!(name: "Grey Sloan Memorial Hospital")}
    let!(:hospital2) {Hospital.create!(name: "Seaside Health & Wellness Center")}

    let!(:doctor1) {hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")}
    let!(:doctor2) {hospital2.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")}

    let!(:patient1) {doctor1.patients.create!(name: "Katie Bryce", age: 24)}
    let!(:patient2) {doctor1.patients.create!(name: "Denny Duquette", age: 39)}
    let!(:patient3) {doctor2.patients.create!(name: "Rebecca Pope", age: 32)}
    let!(:patient4) {doctor2.patients.create!(name: "Zola Shepherd", age: 2)}

    it 'shows all the doctor attributes' do
        visit doctor_path(doctor1)
        expect(page).to have_content("Doctor #{doctor1.name}")
        expect(page).to have_content("Specialty: #{doctor1.specialty}")
        expect(page).to have_content("University: #{doctor1.university}")
        expect(page).to have_content("of #{hospital1.name}")
        expect(page).to have_content(patient1.name)
        expect(page).to have_content(patient2.name)

        expect(page).to_not have_content(doctor2.name)
        expect(page).to_not have_content(hospital2.name)
        expect(page).to_not have_content(patient3.name)
        expect(page).to_not have_content(patient4.name)
    end

    it 'adds a button next to each patient to remove that particular patient' do
        doctor2.patients << patient1

        visit doctor_path(doctor1)
        expect(page).to have_content(patient1.name)
        click_on "Remove #{patient1.name}"
        expect(current_path).to eq("/doctors/#{doctor1.id}")
        expect(page).to_not have_content(patient1.name)

        #checks if patient is still under other doctors
        visit doctor_path(doctor2)
        expect(page).to have_content(patient1.name)
    end
end