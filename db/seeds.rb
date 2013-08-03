#coding: utf-8

Category.delete_all
Category.connection.execute("delete from sqlite_sequence where name='categories'")
Category.create([
  {:category_name => "カテゴリA", :color => "red"},
  {:category_name => "カテゴリB", :color => "blue"},
  {:category_name => "カテゴリC", :color => "yellow"},
  {:category_name => "カテゴリD", :color => "green"},
  {:category_name => "カテゴリE", :color => "orange"},
  {:category_name => "カテゴリF", :color => "purple"},
  {:category_name => "カテゴリG", :color => "indigo"}
])

User.delete_all
Category.connection.execute("delete from sqlite_sequence where name='users'")
User.create([
  {:user_name => "admin",  :admin_flag => 1},
  {:user_name => "ユーザA", :admin_flag => 0},
  {:user_name => "ユーザB", :admin_flag => 0},
  {:user_name => "ユーザC", :admin_flag => 0},
  {:user_name => "ユーザD", :admin_flag => 0}
])

Post.delete_all
Category.connection.execute("delete from sqlite_sequence where name='posts'")
Post.create([
  {:title => "title", :content => "content", :post_date => "2013-01-01 00:00:00.000", :user_id => 1, :category_id => 1},
  {:title => "テスト", :content => "あああああああ", :post_date => "2013-01-02 00:00:00.000", :user_id => 2, :category_id => 2}
])
