require 'rails_helper'

RSpec.describe 'Patient Index page' do
    let!(:patient1) {Patient.create!(name: "Katie Bryce", age: 24)}
    let!(:patient2) {Patient.create!(name: "Denny Duquette", age: 39)}
    let!(:patient3) {Patient.create!(name: "Rebecca Pope", age: 32)}
    let!(:patient4) {Patient.create!(name: "Zola Shepherd", age: 2)}

    it 'lists all patients older than 18 alphabetically' do
        visit patients_path
        expect(patient2.name).to appear_before(patient1.name)
        expect(patient1.name).to appear_before(patient3.name)
        expect(page).to_not have_content(patient4.name)
    end
end