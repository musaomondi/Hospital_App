# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
UserType.create!(user_type_name: "ADMIN")
UserType.create!(user_type_name: "DOCTOR")

User.create!(first_name: "Caroline", last_name: "Amoke", email_id: "caro@yahoo.com", user_type_id: 1, password: "abc123", password_confirmation: "abc123")

CommentType.create!(comment_type_name: "Add surgery")
CommentType.create!(comment_type_name: "Add prescription")
CommentType.create!(comment_type_name: "Add medicine")

patients = Patient.order(:created_at).take(6)
5.times do
  content = Faker::Lorem.sentence(5)
  patients.each { |patient| patient.messages.create!(content: content)  }
end


