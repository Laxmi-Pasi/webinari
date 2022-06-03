# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "workshops are being created"

workshops = Workshop.create!([{
    name:"Full stack Ruby on Rails Development Bootcamp",
    description: "Some dummy project.",
    start_date: Date.today + 2.days,
    end_date: Date.today + 20.days,
    start_time: "10:00 AM",
    end_time: "3:00 AM",
    total_sits: 100,
    remaining_sits: 0,
    registration_fee: 100
},
{
    name:"Python",
    description: "Some dummy project.",
    start_date: Date.today + 12.days,
    end_date: Date.today + 20.days,
    start_time: "10:00 AM",
    end_time: "3:00 AM",
    total_sits: 100,
    remaining_sits: 0,
    registration_fee: 1000
},
{
    name:"Advance Java",
    description: "Some dummy project.",
    start_date: Date.today + 2.days,
    end_date: Date.today + 20.days,
    start_time: "10:00 AM",
    end_time: "3:00 AM",
    total_sits: 100,
    remaining_sits: 0,
    registration_fee: 1200
}])
puts "workshops created"