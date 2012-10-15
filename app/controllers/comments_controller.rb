class CommentsController < ApplicationController
	def index
		render json: Comment.all
	end

	def create
		@comment = current_user.comments.build(params[:comment])
		if @comment.save
			render json: @comment.to_json(:include => {:commentor => {:only => :name}}), status: :created, location: @comment
		else
			render json: @comment.errors, status: :unprocessable_entity
		end
	end
end
