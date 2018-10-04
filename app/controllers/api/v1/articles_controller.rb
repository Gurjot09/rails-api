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
				article = Aricle.new(valid_params)
			end
		
			private
			def valid_params
				params.permit(:title , :body)
				
			end
		end
	end
end