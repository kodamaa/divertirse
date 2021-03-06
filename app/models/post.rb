class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :category_id, :post_date

  has_many :comments

  validates :title, :presence => true
  validates :content, :presence => true,
                     :length => {:minimum => 5}

  default_scope :order => 'created_at DESC'
  paginates_per 20
end
