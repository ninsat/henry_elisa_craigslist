class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
		require_user
		@categories = Category.all
	end

	def create
		require_user
		@user = current_user
		article = @user.articles.new(article_params)
		# debugger
		if article.save
			redirect_to article_path(article.id)
		else
			render 'new'
		end
	end

	def show
		@article = Article.find(params[:id])
		@user = @article.user
		# @category = Category.find(params[:id])
  #   @article = @category.article
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
