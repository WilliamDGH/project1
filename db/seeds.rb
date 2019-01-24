# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
User.create(
  :fullname => 'Guanhua Ding',
  :email => 'gd@ga.co',
  :password => 'chicken',
  :password_confirmation => 'chicken'
)
User.create(
  :fullname => 'One General',
  :email => 'one@ga.co',
  :password => 'chicken',
  :password_confirmation => 'chicken'
)
User.create(
  :fullname => 'Two General',
  :email => 'two@ga.co',
  :password => 'chicken',
  :password_confirmation => 'chicken'
)
User.create(
  :fullname => 'Three General',
  :email => 'three@ga.co',
  :password => 'chicken',
  :password_confirmation => 'chicken'
)
User.create(
  :fullname => 'Four General',
  :email => 'four@ga.co',
  :password => 'chicken',
  :password_confirmation => 'chicken'
)

user1 = User.find_by :email => 'gd@ga.co'
user2 = User.find_by :email => 'one@ga.co'
user3 = User.find_by :email => 'two@ga.co'
user4 = User.find_by :email => 'three@ga.co'
user5 = User.find_by :email => 'four@ga.co'

Route.destroy_all
Route.create(
  :start => 'Gold Coast',
  :end => 'Brisbane',
  :capacity => '3',
  :price => 10,
  :user_id => user1.id
)

Route.create(
  :start => 'Sydney',
  :end => 'Melbourne',
  :capacity => '3',
  :price => 20,
  :user_id => user1.id
)

Route.create(
  :start => 'Logan',
  :end => 'Byron Bay',
  :capacity => '3',
  :price => 15,
  :user_id => user2.id
)

Route.create(
  :start => 'Brisbane Airport',
  :end => 'Brisbane CBD',
  :capacity => '3',
  :price => 10,
  :user_id => user2.id
)

Route.create(
  :start => 'Newcastle',
  :end => 'Sydney',
  :capacity => '3',
  :price => 20,
  :user_id => user3.id
)

Route.create(
  :start => 'Sydney',
  :end => 'Central Coast',
  :capacity => '3',
  :price => 15,
  :user_id => user3.id
)

Route.create(
  :start => 'Melbourne',
  :end => 'Canberra',
  :capacity => '3',
  :price => 30,
  :user_id => user4.id
)

Route.create(
  :start => 'Adelaide',
  :end => 'Melbourne',
  :capacity => '3',
  :price => 35,
  :user_id => user4.id
)

Route.create(
  :start => 'Cairns',
  :end => 'Brisbane',
  :capacity => '3',
  :price => 50,
  :user_id => user5.id
)

Route.create(
  :start => 'Perth',
  :end => 'Darwin',
  :capacity => '3',
  :price => 100,
  :user_id => user5.id
)
