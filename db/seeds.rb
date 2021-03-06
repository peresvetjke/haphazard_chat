# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do |u|
  login = "user#{u+1}"
  User.create!(login: login, email: "#{login}@example.com", password: "xxxxxx")
end

user_one = User.first
user_two = User.last

user_one.start_chat_with(user_two)

Chat.first.add_message(author: user_one, body: "Hi!")
Chat.first.add_message(author: user_two, body: "Hello!")