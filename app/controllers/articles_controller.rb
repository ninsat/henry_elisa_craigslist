class ArticlesController < ApplicationController
	def index
	end

	def new
	end

	def create
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def article_params
		params.require(:article).permit(:title, :description, :price, :condition, :location, :category_id, :user_id)
	end
end
