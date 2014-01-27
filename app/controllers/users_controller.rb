class UsersController < ApplicationController
	def index
		@user = User.find_by_username(params[:username])
		@courses = @user.courses
		@teachers = []
		@courses.each do |course|
			@teachers.push(course.teacher);
		end
		respond_to do |format|
		  format.html
		  format.json {
		  	render :json => {:username => @user.username, :courses => @courses, :teachers => @teachers}
		  }
		end
	end

	def create
		#@user = User.create(:username => params[:name])
	end
end
