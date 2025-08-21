# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts "Cleaning database..."
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

puts "Creating movies..."
10.times do
  Movie.create!(
    title: Faker::Movie.unique.title,
    overview: Faker::Lorem.paragraph
  )
end

puts "Creating lists..."
5.times do
  List.create!(
    name: Faker::Book.genre,
    overview: Faker::Lorem.paragraph(sentence_count: 3),
    image_url: "https://picsum.photos/300/200?random=#{rand(1000)}"
  )
end

puts "Creating bookmarks..."
20.times do
  Bookmark.find_or_create_by!(
    movie: Movie.all.sample,
    list: List.all.sample
  ) do |bookmark|
    bookmark.comment = Faker::Lorem.sentence(word_count: 10)
  end
end

puts "✅ Seeding finished!"
