# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"
require "open-uri"

Product.delete_all
Platform.delete_all

filename = Rails.root.join("db/data.csv")
puts "Loading data from the csv file: #{filename}"

csv_data = File.read(filename)
products = CSV.parse(csv_data, headers: true, encoding: "utf-8")

products.each do |p|
  platform = Platform.find_or_create_by(name: p["platform"])
  if platform && platform.valid?
    product = platform.products.create(
      name:          p["product_name"],
      description:   p["description"],
      price:         p["price"],
      on_sale_price: p["on_sale_price"]
    )
    unless product&.valid?
      puts "Invalid product #{p['product_name']}: #{product.errors.full_messages.join(', ')}"
    end
  else
    puts "Invalid platform #{p['platform']} for product #{p['product_name']}."
  end

  download_image = URI.open(p["image-src"])
  if download_image.present?
    product.image.attach(io: download_image, filename: "m-#{product.name}.jpg")
  else
    puts "Could not download image for #{product.name}."
  end

end
puts "Created #{Platform.count} platforms."
puts "Created #{Product.count} products."
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?