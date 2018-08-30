# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'faker'

user = User.new
user.username = 'admin'
user.email = 'admin@freeshelf.com'
user.password = 'admin'
user.save


user = User.new
user.username = 'user'
user.email = 'user@other.com'
user.password = 'user'
user.save

# 4.times do
#   user = User.new
#   user.username = 'admin'
#   user.email = 'admin@freeshelf.com'
#   user.password = 'admin'
#   user.save
# end

# 47.time do
#   Book.create(


#   )
# end

CSV.foreach('db/books.csv', headers: true) do |row|
  Book.create(row.to_h)
end