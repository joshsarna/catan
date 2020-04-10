# Game.destroy_all
# User.destroy_all
# Player.destroy_all
# Hand.destroy_all
# DevelopmentCardHand.destroy_all

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