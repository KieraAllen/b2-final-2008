# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#hospitals
@greys = Hospital.create!(name: "Grey Sloan Memorial Hospital")

@general = Hospital.create!(name: "County General")

#doctors
@meredith = Doctor.create!(name: "Meridith Grey", specialty: "General Surgery", university: "Dartmouth", hospital_id: @greys.id)

@teddy = Doctor.create!(name: "Teddy Altman", specialty: "Cardiothoracic Surgery", university: "George Washington University", hospital_id: @greys.id)

@knox = Doctor.create!(name: "Knox", specialty: "Anesthesiology", university: "Dartmouth", hospital_id: @greys.id)
