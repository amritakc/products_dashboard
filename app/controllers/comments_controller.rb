class CommentsController < ApplicationController
	def index
		@comments = Comment.select('*').joins(:product)
	end


	def new_comment
		Comment.create(comment:params[:comment],product: Product.find(params[:id]))

		redirect_to '/products'
	end
end
