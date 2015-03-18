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
Holescore.delete_all

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
sanctuary_1 = Hole.create(course_id: sanctuary_course.id, number: 1, handicap: 9, par: 4, yards: 363)
sanctuary_2 = Hole.create(course_id: sanctuary_course.id, number: 2, handicap: 15, par: 4, yards: 365)
sanctuary_3 = Hole.create(course_id: sanctuary_course.id, number: 3, handicap: 3, par: 4, yards: 343)
sanctuary_4 = Hole.create(course_id: sanctuary_course.id, number: 4, handicap: 17, par: 3, yards: 140)
sanctuary_5 = Hole.create(course_id: sanctuary_course.id, number: 5, handicap: 1, par: 5, yards: 517)
sanctuary_6 = Hole.create(course_id: sanctuary_course.id, number: 6, handicap: 13, par: 3, yards: 156)
sanctuary_7 = Hole.create(course_id: sanctuary_course.id, number: 7, handicap: 7, par: 4, yards: 369)
sanctuary_8 = Hole.create(course_id: sanctuary_course.id, number: 8, handicap: 5, par: 5, yards: 528)
sanctuary_9 = Hole.create(course_id: sanctuary_course.id, number: 9, handicap: 11, par: 4, yards: 350)
sanctuary_10 = Hole.create(course_id: sanctuary_course.id, number: 10, handicap: 16, par: 4, yards: 327)
sanctuary_11 = Hole.create(course_id: sanctuary_course.id, number: 11, handicap: 18, par: 3, yards: 143)
sanctuary_12 = Hole.create(course_id: sanctuary_course.id, number: 12, handicap: 10, par: 5, yards: 503)
sanctuary_13 = Hole.create(course_id: sanctuary_course.id, number: 13, handicap: 6, par: 4, yards: 427)
sanctuary_14 = Hole.create(course_id: sanctuary_course.id, number: 14, handicap: 8, par: 4, yards: 339)
sanctuary_15 = Hole.create(course_id: sanctuary_course.id, number: 15, handicap: 12, par: 3, yards: 191)
sanctuary_16 = Hole.create(course_id: sanctuary_course.id, number: 16, handicap: 14, par: 4, yards: 346)
sanctuary_17 = Hole.create(course_id: sanctuary_course.id, number: 17, handicap: 2, par: 5, yards: 538)
sanctuary_18 = Hole.create(course_id: sanctuary_course.id, number: 18, handicap: 4, par: 4, yards: 397)

# Create Players
puts "Creating players"
garner = Player.create(user_id: garner_user.id, name: "Adam Garner", handicap_index: 12.1)
linder = Player.create(user_id: linder_user.id, name: "Matt Linder", handicap_index: 12.4)
joe = Player.create(user_id: joe_user.id, name: "Joe Monocchio", handicap_index: 11.8)
white = Player.create(user_id: white_user.id, name: "Adam White", handicap_index: 14.7)

# Create League
puts "Creating leagues"
gladiator = League.create(name: "The Gladiator Cup", logo: nil)

# Create Rounds
puts "Creating rounds"
garner_round = Round.create(course_id: sanctuary_course.id, player_id: garner.id, league_id: gladiator.id, date: Date.current, datetime: DateTime.current, course_handicap: 13, strokes_earned: 0, score_gross: 85, score_net: 85)
#linder_round = Round.create(course_id: sanctuary_course.id, player_id: linder.id, date: Date.current, datetime: DateTime.current, course_handicap: 14, strokes_earned: 1,  score_gross: 0, score_net: 0)
#joe_round = Round.create(course_id: sanctuary_course.id, player_id: joe.id, date: Date.current, datetime: DateTime.current, course_handicap: 13, strokes_earned: 0,  score_gross: 0, score_net: 0)
#white_round = Round.create(course_id: sanctuary_course.id, player_id: white.id, date: Date.current, datetime: DateTime.current, course_handicap: 16, strokes_earned: 3,  score_gross: 0, score_net: 0)

# Create Holescores
puts "Creating holescores"
Holescore.create(hole_id: sanctuary_1.id, round_id: garner_round.id, score_gross: 5, score_net: 5)
Holescore.create(hole_id: sanctuary_2.id, round_id: garner_round.id, score_gross: 5, score_net: 5)
Holescore.create(hole_id: sanctuary_3.id, round_id: garner_round.id, score_gross: 4, score_net: 4)
Holescore.create(hole_id: sanctuary_4.id, round_id: garner_round.id, score_gross: 3, score_net: 3)
Holescore.create(hole_id: sanctuary_5.id, round_id: garner_round.id, score_gross: 4, score_net: 4)
Holescore.create(hole_id: sanctuary_6.id, round_id: garner_round.id, score_gross: 3, score_net: 3)
Holescore.create(hole_id: sanctuary_7.id, round_id: garner_round.id, score_gross: 5, score_net: 5)
Holescore.create(hole_id: sanctuary_8.id, round_id: garner_round.id, score_gross: 5, score_net: 5)
Holescore.create(hole_id: sanctuary_9.id, round_id: garner_round.id, score_gross: 5, score_net: 5)
Holescore.create(hole_id: sanctuary_10.id, round_id: garner_round.id, score_gross: 5, score_net: 5)
Holescore.create(hole_id: sanctuary_11.id, round_id: garner_round.id, score_gross: 4, score_net: 4)
Holescore.create(hole_id: sanctuary_12.id, round_id: garner_round.id, score_gross: 5, score_net: 5)
Holescore.create(hole_id: sanctuary_13.id, round_id: garner_round.id, score_gross: 5, score_net: 5)
Holescore.create(hole_id: sanctuary_14.id, round_id: garner_round.id, score_gross: 5, score_net: 5)
Holescore.create(hole_id: sanctuary_15.id, round_id: garner_round.id, score_gross: 4, score_net: 4)
Holescore.create(hole_id: sanctuary_16.id, round_id: garner_round.id, score_gross: 5, score_net: 5)
Holescore.create(hole_id: sanctuary_17.id, round_id: garner_round.id, score_gross: 7, score_net: 7)
Holescore.create(hole_id: sanctuary_18.id, round_id: garner_round.id, score_gross: 6, score_net: 6)

# Create Playerleagues
puts "Creating playerleagues"
Playerleague.create(player_id: garner.id, league_id: gladiator.id, league_points: 0)
Playerleague.create(player_id: linder.id, league_id: gladiator.id, league_points: 0)
Playerleague.create(player_id: joe.id, league_id: gladiator.id, league_points: 0)
Playerleague.create(player_id: white.id, league_id: gladiator.id, league_points: 0)


