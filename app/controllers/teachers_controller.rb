class TeachersController < ApplicationController
	def new
		@teacher = Teacher.new
	end

	def create
		@teacher = Teacher.new(params[:teacher])
 
		if @teacher.save
			redirect_to @teacher
		else
			render 'new'
		end
	end

	def edit
		@teacher = Teacher.find(params[:id])
	end

	def update
		@teacher = Teacher.find(params[:id])

		if @teacher.update_attributes(params[:teacher])
			redirect_to @teacher
		else
			render 'edit'
		end
	end

	def destroy
		@teacher = Teacher.find(params[:id])
		@teacher.destroy

		redirect_to teachers_path
	end

	def show
		if params[:name]
			logger.debug ">>>>>>>>------------>#{params[:name]}"
			@teacher = Teacher.find_by_name(params[:name])
			if !@teacher
				@teacher = Teacher.create(:name => params[:name])
			end
		else
			@teacher = Teacher.find(params[:id])
		end

		respond_to do |format|
		  format.html
		  format.json {
		  	render :json => {:id => 1}
		  }
		end
	end

	def index
		@teachers = Teacher.all
	end
end
