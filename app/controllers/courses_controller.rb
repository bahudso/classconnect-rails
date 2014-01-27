class CoursesController < ApplicationController
	def new
		@course = Course.new
		@teachers = Teacher.all
	end

	def create
		@course = Course.new(params[:course])
		if params[:teacher_name]
			@teacher = Teacher.find_or_create_by_name(params[:teacher_name])
		else
			@teacher = Teacher.find(params[:teacher])
		end
		@course.teacher = @teacher
 
		if @course.save
			redirect_to @course
		else
			render 'new'
		end
	end

	def edit
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])

		if @course.update_attributes(params[:course])
			redirect_to @course
		else
			render 'edit'
		end
	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy

		redirect_to courses_path
	end

	def show
		@course = Course.find(params[:id])
	end

	def index
		@courses = Course.all
	end
end
