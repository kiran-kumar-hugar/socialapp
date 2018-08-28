class Friend < ApplicationRecord
	belongs_to :friend, class_name: 'User', foreign_key: 'user_id'
  belongs_to :defaultfriend, class_name: 'User', foreign_key: 'friend_id'
end
