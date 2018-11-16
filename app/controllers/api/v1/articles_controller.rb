module Api
	module V1
		class ArticlesController < ApplicationController
			def index
				articles = Article.order('created_at DESC')
				render json: {status: 'SUCCESS', message: 'Loaded Articles', data: articles}, status: :ok
			end

			def show
				article = Article.find(params[:id])
				render json: {status: 'SUCCESS', message: 'Loaded Article', data: article}, status: :ok
			end

			def create
				byebug
				article = Article.new(valid_params)
				if article.save
					render json: {status: 'SUCCESS', message: 'Saved Article', data: article}, status: :ok
				else
					render json: {status: 'ERROR' , message: 'article not found' , data: article.errors},status: :unprocessable_entity

				end
			end

			def edit
			end

			def update
			end
			private
			def valid_params
				params.permit(:title , :body)
			end
		end
	end
end
