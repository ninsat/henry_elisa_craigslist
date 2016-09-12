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
		require_user
		@article = Article.find(params[:id])
	end

	def update
		require_user
		@article = Article.find(params[:id])
		if @article.update_attributes(article_params)
			redirect_to @article
		else
			@errors = @article.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		require_user
		article = Article.find(params[:id])
		if current_user.id == article.user_id		
		article.destroy
		redirect_to categories_path
		end
	end

	private

	def article_params
		params.require(:article).permit(:title, :description, :price, :condition, :location, :category_id, :user_id)
	end
end
