class ApplicationController < ActionController::Base
  require "redis"
  before_action :authenticate_user!, :get_redis_instance
  

  def get_current_user_friends
    @friends        = User.left_outer_joins(:friends).where('friends.friend_id' => current_user.id, 'friends.status' => 'accepted')
    @defaultFriends = User.left_outer_joins(:defaultfriends).where('friends.user_id' => current_user.id, 'friends.status' => 'accepted')
    @results        = @friends + @defaultFriends
  end

  def get_redis_instance
  	@redis = Redis.new	
	end

  
end