require 'rails_helper'

RSpec.describe 'hospital show page' do
    let!(:hospital1) {Hospital.create!(name: "Grey Sloan Memorial Hospital")}

    let!(:doctor1) {hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")}
    let!(:doctor2) {hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")}

    let!(:patient1) {doctor1.patients.create!(name: "Katie Bryce", age: 24)}
    let!(:patient2) {doctor1.patients.create!(name: "Denny Duquette", age: 39)}
    let!(:patient3) {doctor2.patients.create!(name: "Rebecca Pope", age: 32)}
    let!(:patient4) {doctor2.patients.create!(name: "Zola Shepherd", age: 2)}
    let!(:patient5) {doctor2.patients.create!(name: "Jake Kim", age: 6)}

    it 'lists doctors of a hospital from most patients to least' do
        visit hospital_path(hospital1)
        expect(page).to have_content(hospital1.name)
        expect(doctor2.name).to appear_before(doctor1.name)
        # within("#{doctor2.id}") do
            expect(page).to have_content("Doctor #{doctor2.name}")
            expect(page).to have_content("has 3 patients")
        # end

        # within("#{doctor1.id}") do
            expect(page).to have_content("Doctor #{doctor1.name}")
            expect(page).to have_content("has 2 patients")
        # end
    end
    
end