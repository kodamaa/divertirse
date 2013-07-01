class Post < ActiveRecord::Base
  attr_accessible :content, :title, :author, :category_id

  has_many :comments

  validates :title, :presence => true
  validates :content, :presence => true,
                     :length => {:minimum => 5}

  default_scope :order => 'created_at DESC'
  paginates_per 10
end
