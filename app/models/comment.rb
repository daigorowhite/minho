class Comment < ActiveRecord::Base
  attr_accessible :comment_word, :dialect_id, :user_id
end
