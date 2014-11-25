# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# u = User.create(email: "user@example.com", password: "asdf;lkj", name: "Test User")

# p = Product.create(name: "Boots", description: "Made for walkin'", price_in_cents: 10000)

# Review.create(product_id: p.id, user_id: u.id, comment: "Walkin' all over the place.")

# User.destroy_all
# Product.destroy_all

# User.create!({
#   email: "example@bitmakerlabs.com",
#   name: "Example User",
#   password: "pass",
#   password_confirmation: "pass"
#   }
# )

100.times do |i|

	p = Product.create!({
	  name: Faker::Commerce.product_name,
	  description: Faker::Company.catch_phrase,
	  price_in_cents: i,
	  category: Faker::Company.suffix
	})
	puts "Creating a product named: #{p.name}." 
end
