# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |counter|
  Post.create(
    :title => "This is the title for #{ (counter + 1).ordinalize } post", 
    :body => "This is the body for #{ (counter + 1).ordinalize } post", 
    :author => "Admin")
end