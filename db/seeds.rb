# require_relative "../../bin/user.rb"

User.create(name: "Melissa")
User.create(name: "April")
User.create(name: "Luke")
User.create(name: "Devon")
User.create(name: "Sarah")
User.create(name: Faker::Name.name)
User.create(name: Faker::Name.name)
User.create(name: Faker::Name.name)
User.create(name: Faker::Name.name)
User.create(name: Faker::Name.name)

Celebrity.create(name: "Leonardo")
Celebrity.create(name: "Brad")
Celebrity.create(name: "Angelina")
Celebrity.create(name: "Meryl")
Celebrity.create(name: "Bruce")

Hobbies.create(hobby_name: "skiing")
Hobbies.create(hobby_name: "swimming")
Hobbies.create(hobby_name: "singing")
Hobbies.create(hobby_name: "dancing")
Hobbies.create(hobby_name: "fishing")
