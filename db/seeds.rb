# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..50).each do |i|
	Post.create!(user_id: 1, title: %{Testing Pagination},
	 content: %{Testing will_paginate with forum.})
end

(1..50).each do |i|
	Reply.create!(user_id: 2, post_id: 3, body: %{Testing reply pagination.})
end