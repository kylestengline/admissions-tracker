# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
30.times do |student|
  Student.create (
    name: Faker::Name.name,
    email: Faker::Internet.free_email,
    password_digest: Faker::Lorem.word,
    course: ['WDI', 'UXDI', 'PMI'].sample,    
    application_essay: Faker::Lorem.paragraph,
    application_status: ['Phone Interview Pending', 'In-Person Interview', 'Interviews Completed', 'Accepted', "Rejected"].sample
  )
end

15.times do |instructor|
  Instructor.create (
    name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    password_digest: Faker::Lorem.word,
    course: ['WDI', 'UXDI', 'PMI'].sample    
  )
end

15.times do |ao_officer|
  AdmissionOfficer.create (
    name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    password_digest: Faker::Lorem.word
  )
end	

15.times do |iq|
  InstructorQuestionnaire.create(
		strengths: Faker::Hipster.sentence(8),
		weaknesses: Faker::Hipster.sentence(5),
		good_fit: [true, false].sample,
		comments: Faker::Hipster.sentence(15)
  )
end

15.times do |ao_ques|
  AoQuestionnaire.create(
    course_goals: Faker::Hipster.sentence(10),
	comments: Faker::Hipster.sentence(10),
	reason_for_applying: Faker::Hipster.sentence(10)
  )
end