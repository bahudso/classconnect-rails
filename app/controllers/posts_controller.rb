class PostsController < ApplicationController
	def new
		@post = Post.new
		@courses = Course.all
	end

	def create
		@post = Post.new(params[:post])
		@course = Course.find(params[:course])
		@post.course = @course
 
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(params[:post])
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	def show
		@post = Post.find(params[:id])
	end

	def index
		@posts = Post.all
	end

	private
		def post_params
			params.require(:post).permit(:title, :text)
		end
end
