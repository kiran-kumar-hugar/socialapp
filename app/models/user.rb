class User < ApplicationRecord
	has_many :feeds
	has_many :friends
	has_many :defaultfriends, class_name: 'Friend', foreign_key: 'friend_id'
	has_many :groupadmins
	scope :requests, -> {
		joins(:defaultfriends).where(friends: {status: nil})}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
