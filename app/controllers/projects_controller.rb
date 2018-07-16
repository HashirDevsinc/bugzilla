class ProjectsController < ApplicationController
	
	# after_action :verify_authorized, only: [:new, :create, :edit, :destroy]


	def index
		@projects = Project.where(user_id: current_user.id).paginate(page: params[:page])
		authorize @projects
	end

	def new
		@project = Project.new
		authorize @project
	end

	def create
	  	# project_params = params["project"]
	  	@project = current_user.projects.new(name: project_params[:name], description: project_params[:description])
	  	authorize @project

	  	if @project.save
	  		flash[:success] = "Your project has been created!"
	  		redirect_to projects_path
	  	else
	  		render 'new'
	  	end
	end

	def edit
		authorize @project
	end

	def destroy
		@project = Project.find(params[:id])
		authorize @project
		@project.destroy
		flash[:success] = "Project deleted"
		redirect_to projects_path
	end


	private
	  	def project_params
	  		params.require(:project).permit(:name, :description)
	  	end
end
