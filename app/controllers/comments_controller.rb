class CommentsController < ApplicationController
	def index
		render json: Comment.all
	end

	def create
		@comment = Comment.new(params[:comment])
		if @comment.save
			render json: @comment, status: :created, location: @comment
		else
			render json: @comment.errors, status: :unprocessable_entity
		end
	end
end
