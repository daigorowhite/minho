class City < ActiveRecord::Base
  attr_accessible :city_id, :city_name, :city_yomi, :prefecture_id
end
