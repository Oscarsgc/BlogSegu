class CommentsController < ApplicationController
	before_action :signed_in_user
	def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.create(params[:comment].permit(:body))
	@comment.user_id = current_user.id
    @comment.save
	redirect_to root_url 

    
  end

  private 
	def comment_params
		params.require(:comment).permit(:body)
	end
end
