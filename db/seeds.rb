# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Clean Seed
Company.delete_all
Customer.delete_all
Ticket.delete_all

# Users
5.times do
  Customer.create(
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.cell_phone_in_e164,
    email: Faker::Internet.email,
    customer_type: rand(1..2),
    birthday: Faker::Date.between_except(from: 100.year.ago, to: 18.year.from_now, excepted: Date.today),
    critical_role: [true, false].sample
  )
end

# Company
5.times do
  Company.create(
    name: Faker::Company.name,
    industry: Faker::Company.industry,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone_in_e164,
    email: Faker::Internet.email,
  )
end

# Tickets
5.times do |i|
  Ticket.create(
    company_id: rand(1..5),
    customer_id: rand(1..5),
    ticket_number: i,
    priority: [true, false].sample,
    state: rand(1..2),
  )
end