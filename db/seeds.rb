# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

p "is detroying - #{Bike.all.count} bikes - #{User.all.count} users - #{Booking.all.count} bookings"
Booking.destroy_all
# Bike.all.each do |bike|
#   bike.photo.purge
# end
User.destroy_all
Bike.destroy_all

p "destroyed- bikes: #{Bike.all.count} - users:#{User.all.count}"
p "destroyed- bookings:#{Booking.all.count}"
p "number of bikes"
p Bike.count
p "number of users"
p User.count
p "number of bookings"
p Booking.count

pif = User.new(email: 'pif@gmail.com', username: 'pif', password: 'password')
file = URI.open("https://static.wikia.nocookie.net/lotr/images/3/32/Frodo_%28FotR%29.png/revision/latest?cb=20221006065757")
pif.photo.attach(io: file, filename: "pif", content_type: 'image/jpg')
pif.save

tudal = User.new(email: 'tudal@gmail.com', username: 'tudhak', password: 'password')
tudal.save

luka = User.new(email: 'luka@gmail.com', username: 'luka', password: 'password')
file = URI.open("https://scontent-cdg4-2.xx.fbcdn.net/v/t1.18169-9/11200805_10153889836504741_718631745012518813_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=be3454&_nc_ohc=SIm6mQwGOeUAX8XS_oN&_nc_ht=scontent-cdg4-2.xx&oh=00_AfDSAJFhsoeIpXtpudwtysW8j5FXcDaxntG46oltgvGOKw&oe=658824E7")
luka.photo.attach(io: file, filename: "luka", content_type: 'image/jpg')
luka.save

velo_1 = Bike.new(
  user: luka,
  name: "Moutain bike",
  style: "montagne",
  # place: "Paris 12",
  short_description: "Vélo de montagne tout suspendu à louer",
  long_description: "Vélo de montagne tout suspendu à louer, idéal pour les sentiers accidentés. Performant et prêt à vous offrir une expérience de VTT inoubliable.",
  price_per_day: 12
)
file = URI.open("https://images.unsplash.com/photo-1572111504021-40abd3479ddb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bW91bnRhaW4lMjBiaWtlfGVufDB8fDB8fHww")
velo_1.photo.attach(io: file, filename: "velo_1.png", content_type: "image/jpg")
velo_1.save




velo_2 = Bike.new(
  user: luka,
  name: "Vélo de ville",
  style: "ville",
  # place: "Paris 8",
  short_description: "Vélo urbain élégant disponible à la location",
  long_description: "Vélo urbain élégant disponible à la location. Parfait pour les déplacements en ville, léger et équipé d'accessoires pratiques.",
  price_per_day: 15
)
file = URI.open("https://images.unsplash.com/photo-1528537928510-66caf3a3bf91?q=80&w=2978&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
velo_2.photo.attach(io: file, filename: "velo_2.png", content_type: "image/jpg")
velo_2.save

velo_3 = Bike.new(
  user: luka,
  name: "Vélo électrique",
  style: "électrique",
  # place: "Paris 10",
  short_description: "Vélo électrique haut de gamme à louer",
  long_description: "Vélo électrique haut de gamme à louer, offrant une assistance puissante pour des balades sans effort. Parfait pour explorer la ville ou la campagne.",
  price_per_day: 17
)
file = URI.open("https://images.unsplash.com/photo-1620802051782-725fa33db067?q=80&w=2768&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
velo_3.photo.attach(io: file, filename: "velo_3.png", content_type: "image/jpg")
velo_3.save

velo_4 = Bike.new(
  user: luka,
  name: "Vélo de Jalabert",
  style: "course",
  # place: "Paris 6",
  short_description: "Vélo de course en carbone à louer",
  long_description: "Vélo de course en carbone à louer, doté d'une géométrie aérodynamique. Idéal pour les passionnés de cyclisme à la recherche de vitesse et de performance.",
  price_per_day: 10
)
file = URI.open("https://images.unsplash.com/photo-1497515098781-e965764ab601?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8dmVsbyUyMGRlJTIwY291cnNlfGVufDB8fDB8fHww")
velo_4.photo.attach(io: file, filename: "velo_4.png", content_type: "image/jpg")
velo_4.save

velo_5 = Bike.new(
  user: luka,
  name: "Vélo pour les transports",
  style: "pliable",
  # place: "Paris 20",
  short_description: "Vélo pliable pratique disponible à la location",
  long_description: "Vélo pliable pratique disponible à la location. Parfait pour les déplacements quotidiens, compact et facile à ranger dans les espaces restreints.",
  price_per_day: 16
)
file = URI.open("https://images.unsplash.com/photo-1660276412288-7f89179a997b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHZlbG8lMjBwbGlhYmxlfGVufDB8fDB8fHww")
velo_5.photo.attach(io: file, filename: "velo_5.png", content_type: "image/jpg")
velo_5.save

velo_6 = Bike.new(
  user: luka,
  name: "Vélo ancien",
  style: "vintage",
  # place: "Paris 18",
  short_description: "Vélo vintage à louer, plein de charme rétro",
  long_description: "Vélo vintage à louer, plein de charme rétro. Parfait pour une balade décontractée en ville, alliant style et confort.",
  price_per_day: 8
)
file = URI.open("https://images.unsplash.com/photo-1679363336771-ac19093981ee?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
velo_6.photo.attach(io: file, filename: "velo_6.png", content_type: "image/jpg")
velo_6.save

velo_7 = Bike.new(
  user: luka,
  name: "Vélo de triathlon",
  style: "montagne",
  # place: "Paris 2",
  short_description: "Vélo de triathlon à louer",
  long_description: "Vélo de triathlon à louer, équipé de composants haut de gamme. Prêt à vous accompagner dans vos défis sportifs avec efficacité.",
  price_per_day: 40
)
file = URI.open("https://images.unsplash.com/photo-1600492110568-f9bf4835500a?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHZlbG8lMjBkZSUyMGNvdXJzZXxlbnwwfHwwfHx8MA%3D%3D")
velo_7.photo.attach(io: file, filename: "velo_7.png", content_type: "image/jpg")
velo_7.save

velo_8 = Bike.new(
  user: luka,
  name: "Aquabike",
  style: "aquatique",
  # place: "Paris 1",
  short_description: "aquabike, pour remonter la Seine",
  long_description: "aquabike, pour remonter la Seine",
  price_per_day: 12
)
file = URI.open("https://www.linecoaching.com/sites/linecoaching/files/styles/width_700/public/aquabike.jpg.webp?itok=3aGoyD1v")
velo_8.photo.attach(io: file, filename: "velo_8.png", content_type: "image/jpg")
velo_8.save

velo_9 = Bike.new(
  user: luka,
  name: "Vélo d'appartement",
  style: "indoor",
  # place: "Paris 16",
  short_description: "Un magnifique vélo d'appartement",
  long_description: "Un magnifique vélo d'appartement pour refaire son summer-body",
  price_per_day: 12
)
file = URI.open("https://media.gettyimages.com/id/1397342624/fr/photo/homme-%C3%A2g%C3%A9-utilisant-un-v%C3%A9lo-dappartement-%C3%A0-la-maison.webp?s=1024x1024&w=gi&k=20&c=T4fvcETTUkC_DM4-RKdEUKSfOLyuyxvqWYcfm8MSg3A=")
velo_9.photo.attach(io: file, filename: "velo_9.png", content_type: "image/jpg")
velo_9.save

p "created bikes number - #{Bike.all.count} / user number #{User.all.count} / booking number #{Booking.all.count} "
