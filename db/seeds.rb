# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
Course.delete_all
Hole.delete_all
Round.delete_all
Player.delete_all
Playerleague.delete_all
League.delete_all
User.delete_all

# Create users
puts "Creating users"
garner_user = User.create(email: "garner@garner.com", password: "test1234")
linder_user = User.create(email: "linder@linder.com", password: "test1234")
joe_user = User.create(email: "joe@joe.com", password: "test1234")
white_user = User.create(email: "white@white.com", password: "test1234")

# Create Courses
puts "Creating courses"
sanctuary_course = Course.create(name: "Sanctuary Golf Course", logo: "sanctuary_logo.png", slope: 126, rating: 70.3)

# Create Holes
puts "Creating holes"
Hole.create(course_id: sanctuary_course.id, number: 1, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 1", handicap: 9, par: 4, yards: 363, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 9")
Hole.create(course_id: sanctuary_course.id, number: 2, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 2", handicap: 15, par: 4, yards: 365, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 15")
Hole.create(course_id: sanctuary_course.id, number: 3, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 3", handicap: 3, par: 4, yards: 343, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 3")
Hole.create(course_id: sanctuary_course.id, number: 4, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 4", handicap: 17, par: 3, yards: 140, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 17")
Hole.create(course_id: sanctuary_course.id, number: 5, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 5", handicap: 1, par: 5, yards: 517, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 1")
Hole.create(course_id: sanctuary_course.id, number: 6, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 6", handicap: 13, par: 3, yards: 156, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 13")
Hole.create(course_id: sanctuary_course.id, number: 7, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 7", handicap: 7, par: 4, yards: 369, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 7")
Hole.create(course_id: sanctuary_course.id, number: 8, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 8", handicap: 5, par: 5, yards: 528, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 5")
Hole.create(course_id: sanctuary_course.id, number: 9, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 9", handicap: 11, par: 4, yards: 350, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 11")
Hole.create(course_id: sanctuary_course.id, number: 10, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 10", handicap: 16, par: 4, yards: 327, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 16")
Hole.create(course_id: sanctuary_course.id, number: 11, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 11", handicap: 18, par: 3, yards: 143, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 18")
Hole.create(course_id: sanctuary_course.id, number: 12, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 12", handicap: 10, par: 5, yards: 503, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 10")
Hole.create(course_id: sanctuary_course.id, number: 13, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 13", handicap: 6, par: 4, yards: 427, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 6")
Hole.create(course_id: sanctuary_course.id, number: 14, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 14", handicap: 8, par: 4, yards: 339, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 8")
Hole.create(course_id: sanctuary_course.id, number: 15, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 15", handicap: 12, par: 3, yards: 191, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 12")
Hole.create(course_id: sanctuary_course.id, number: 16, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 16", handicap: 14, par: 4, yards: 346, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 14")
Hole.create(course_id: sanctuary_course.id, number: 17, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 17", handicap: 2, par: 5, yards: 538, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 2")
Hole.create(course_id: sanctuary_course.id, number: 18, number_validation: "course" + sanctuary_course.id.to_s + " - hole: 18", handicap: 4, par: 4, yards: 397, handicap_validation: "course" + sanctuary_course.id.to_s + " - hcap: 4")

# Create Players
puts "Creating players"
garner = Player.create(user_id: garner_user.id, name: "Adam Garner", handicap_index: 12.1)
linder = Player.create(user_id: linder_user.id, name: "Matt Linder", handicap_index: 12.4)
joe = Player.create(user_id: joe_user.id, name: "Joe Monocchio", handicap_index: 11.8)
white = Player.create(user_id: white_user.id, name: "Adam White", handicap_index: 14.7)

# Create Rounds
puts "Creating rounds"
Round.create(course_id: sanctuary_course.id, player_id: garner.id, course_handicap: 13, strokes_earned: 0, score_gross: 0, score_net: 0)
Round.create(course_id: sanctuary_course.id, player_id: linder.id, course_handicap: 14, strokes_earned: 1,  score_gross: 0, score_net: 0)
Round.create(course_id: sanctuary_course.id, player_id: joe.id, course_handicap: 13, strokes_earned: 0,  score_gross: 0, score_net: 0)
Round.create(course_id: sanctuary_course.id, player_id: white.id, course_handicap: 16, strokes_earned: 3,  score_gross: 0, score_net: 0)

# Create Holescores
puts "Creating holescores"
Round.create(course_id: sanctuary_course.id, player_id: garner.id, score_gross: 0, score_net: 0)
Round.create(course_id: sanctuary_course.id, player_id: linder.id, score_gross: 0, score_net: 0)
Round.create(course_id: sanctuary_course.id, player_id: joe.id, score_gross: 0, score_net: 0)
Round.create(course_id: sanctuary_course.id, player_id: white.id, score_gross: 0, score_net: 0)

# Create League
puts "Creating leagues"
gladiator = League.create(name: "The Gladiator Cup", logo: "default_league.jpg")

# Create Playerleagues
puts "Creating playerleagues"
Playerleague.create(player_id: garner.id, league_id: gladiator.id)
Playerleague.create(player_id: linder.id, league_id: gladiator.id)
Playerleague.create(player_id: joe.id, league_id: gladiator.id)
Playerleague.create(player_id: white.id, league_id: gladiator.id)


