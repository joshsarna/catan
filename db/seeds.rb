# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DevelopmentCard.destroy_all

14.times do
  DevelopmentCard.create({
    name: 'KNIGHT',
    image_url: 'images/knightCard.jpg'
  })
end

2.times do
  DevelopmentCard.create({
    name: 'ROAD BUILDING',
    image_url: 'images/roadBuildingCard.jpg'
  })
end

2.times do
  DevelopmentCard.create({
    name: 'YEAR OF PLENTY',
    image_url: 'images/yearOfPlentyCard.jpg'
  })
end

2.times do
  DevelopmentCard.create({
    name: 'MONOPOLY',
    image_url: 'images/monopolyCard.jpg'
  })
end

DevelopmentCard.create({
  name: 'UNIVERSITY',
  image_url: 'images/universityCard.png'
})

DevelopmentCard.create({
  name: 'MARKET',
  image_url: 'images/marketCard.jpg'
})

DevelopmentCard.create({
  name: 'GREAT HALL',
  image_url: 'images/greatHallCard.png'
})

DevelopmentCard.create({
  name: 'CHAPEL',
  image_url: 'images/chapelCard.png'
})

DevelopmentCard.create({
  name: 'LIBRARY',
  image_url: 'images/libraryCard.jpeg'
})