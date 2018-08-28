class HomeController < ApplicationController
	respond_to :js, :json, :html
	skip_before_action :verify_authenticity_token
  
  def index
 		get_current_user_friends
    @feeds  = Feed.where('user_id IN (?)',@results.pluck(:id)).paginate(page: params[:page], per_page: 2)
    @posts  = Feed.new
  end

  def search
   @q = User.ransack(params[:q])
 		if params[:q].nil? 
 	 		@search_response = Array.new
 	 	else
      @search_result = @q.result()
      get_current_user_friends
      @final_result = @search_result - @results
      if params[:q].nil? 
        @search_response = Array.new
      else
        @search_response = @final_result
      end 	 		
 		end
  end

  def send_request 
    # HardWorker.perform_async('bob', 5)
    # render plain: "jo".inspect
  	@user = User.find(current_user.id)
    if current_user.id == params[:friend_id].to_i
      render :js => "sendRequestToFriend('error','You can not send request to yourself');" 
    else
      @checkFriend  = @user.friends.where(friend_id: params[:friend_id])
      if @checkFriend.size <= 0
      	@friend = @user.friends.new(friend_id: params[:friend_id])
        if @friend.save
          @friend_details = User.find_by(id: params[:friend_id])
          HardWorker.perform_async(@friend_details.email)
          render :js => "sendRequestToFriend('success','Friend request sent successfully');"
        else
          render :js => "sendRequestToFriend('error','Some error occoured while saving');"
        end
      else
         render :js => "sendRequestToFriend('error','Friend request is already sent to this user');"
      end
    end
  end

end
