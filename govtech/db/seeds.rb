# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Drink.create(name: 'Milo', price: 1.20)
Drink.create(name: 'Teh', price: 1.10)
Drink.create(name: 'Kopi', price: 1.00)

Venue.create(name: 'Tu Tu Kueh', description: 'Level 9, 1 Fusionopolis View, 138577')
Venue.create(name: 'Ang Ku Kueh', description: 'Level 9, 1 Fusionopolis View, 138577')
Venue.create(name: 'Open Space', description: 'Level 8, 1 Fusionopolis View, 138577')
Venue.create(name: 'The Village', description: 'Level 10, Mapletree Business City, 117438')
