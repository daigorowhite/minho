class User < ActiveRecord::Base
  attr_accessible :city_id, :password, :prefecture_id, :user_id, :user_name
end
