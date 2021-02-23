# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create([
#   {
#     name: "Vinny",
#     email: "v@gmail.com",
#     password: "password",
#     image_url: "https://i.pinimg.com/originals/09/f2/7b/09f27be723080a2bcda0c9a800b4c3eb.jpg"
#   },
#   {
#     name: "Alice",
#     email: "a@gmail.com",
#     password: "password",
#     image_url: "https://i.pinimg.com/236x/d2/de/71/d2de7134f98c49d1f27cb47f2f91d002--quakertown-pa-bloodhound.jpg"
#   }
#   ])

# Post.create([
#   {
#     user_id: 1,
#     body: "my back feels pretty good today"
#   },
#   {
#     user_id: 1,
#     body: "my back feels great!"
#   }
# ])

# Variable.create([
#   {
#     user_id: 1,
#     name: "pain"
#   },
#   {
#     user_id: 1,
#     name: "hours slept"
#   }
# ])

# Entry.create([
#   {
#     variable_id: 1,
#     value: 2
#   },
#   {
#     variable_id: 2,
#     value: 8
#   }
# ])

User.create([
  {
    name: "Alice",
    email: "a@gmail.com",
    password: "password",
    image_url: "https://i.pinimg.com/236x/d2/de/71/d2de7134f98c49d1f27cb47f2f91d002--quakertown-pa-bloodhound.jpg"
  }
  ])

Variable.create([
{
  user_id: 5,
  name: "pain"
}
])

Entry.create([
  {
    variable_id: 4,
    value: 2
  }
])
