class FeedsController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
	def new
			@feeds 	= Feed.new
	end

 	def index
    @feeds = Feed.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show

  end

	def create
		@user   = User.find(current_user.id)
    @feeds  = @user.feeds.new(article_params)
		respond_to do |format|
      if @feeds.save
        format.html { redirect_to @feeds, notice: 'Feed was successfully created.' }
      else
        format.html { render :new }
      end
    end
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @feeds = Feed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:feed).permit(:text)
    end
end
