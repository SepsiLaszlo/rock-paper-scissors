# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

rock = Tool.create!(name: 'rock')
paper = Tool.create!(name: 'paper')
scissors = Tool.create!(name: 'scissors')
rock.update!(tools_that_this_can_beat: [paper])
paper.update!(tools_that_this_can_beat: [scissors])
scissors.update!(tools_that_this_can_beat: [rock])
