# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
Category.create([{:category_name => "testA", :color => "red"},
	             {:category_name => "testB", :color => "blue"},
	             {:category_name => "testC", :color => "yellow"},
	             {:category_name => "testD", :color => "green"},
	             {:category_name => "testE", :color => "orange"},
	             {:category_name => "testF", :color => "purple"},
	             {:category_name => "testG", :color => "indigo"}
	             ])

User.create([{:user_name => "admin", :admin_flag => 1},
	         {:user_name => "userA", :admin_flag => 0},
	         {:user_name => "userB", :admin_flag => 0},
	         {:user_name => "userC", :admin_flag => 0},
	         {:user_name => "userD", :admin_flag => 0}
	         ])