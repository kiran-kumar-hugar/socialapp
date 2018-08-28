class ProfilesController < ApplicationController
	respond_to :js, :json, :html
	skip_before_action :verify_authenticity_token

	def profile
		@feeds	= User.joins(:feeds).where("feeds.user_id"=>current_user.id).select("feeds.*").paginate(page: params[:page], per_page: 2)
		@type		= 'posts'
	end	

	def get_profile_content
		
		if params[:type] == 'posts'
			@feeds	= User.joins(:feeds).where("feeds.user_id"=>current_user.id).select("feeds.*").paginate(page: params[:page], per_page: 2)
			@type		= 'posts'
			if params.has_key?(:page)
				render :template => 'profiles/profile.html.erb'
			end
		else
	 		get_current_user_friends
			@type			= 'friends'
		end
	end
end