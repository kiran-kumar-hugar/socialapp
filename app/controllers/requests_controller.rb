class RequestsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def requests
		@request_ids 	= User.requests.where("friends.friend_id" => current_user.id).pluck(:user_id)
		@users				= User.where("id IN (?)", @request_ids)
	end

	def decide 
		@friend	= Friend.find_by(user_id: params[:id], friend_id: current_user.id )
		@friend.status	= params[:type]
		@message	= 'Request status has been '+params[:type]+' successfully'
		if @friend.save
      render :js =>"decideRequestResponse( 'success','" + @message +"')"
    else
      render :js => "decideRequestResponse( 'error', 'Some error occoured while saving')"
    end
	end
end