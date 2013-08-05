class User < ActiveRecord::Base
  attr_accessible :user_name, :admin_flag
end
