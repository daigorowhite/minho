class User < ActiveRecord::Base
  attr_accessible :password, :user_id, :user_name
end
