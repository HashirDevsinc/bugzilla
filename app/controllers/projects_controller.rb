class ProjectsController < ApplicationController
	
	before_action :authenticate_user!

	before_action :set_project, only: [:show, :create, :edit, :update, :destroy, :add_resource, :user_unassign]

	def index
		if current_user.Manager?
			@projects = current_user.projects.paginate(page: params[:page])
		else
			@projects = current_user.user_projects.paginate(page: params[:page])
		end
	end

	def new
		@project = Project.new
		authorize @project
	end

	def create
  	authorize @project

  	if @project.save
  		flash[:notice] = "Your project has been created!"
  		redirect_to projects_path
  	else
  		render 'new'
  	end
	end

	def edit
		authorize @project
	end

	def update
		authorize @project

		if @project.update(project_params)
			redirect_to projects_path
		else
			flash[:alert] = "Updation Failed!"
			render 'edit'
		end
	end

	def show
		@users = @project.users.where.not(user_type: "Manager")
	end

	def destroy
		authorize @project

		@project.destroy
		flash[:notice] = "Project deleted"
		redirect_to projects_path
	end

	def user_unassign
		@relation = Relationship.where(project_id: @project.id, user_id: params[:user_id]).first

		authorize @project

		@relation.destroy
		flash[:notice] = "Unassigned!"

		redirect_to project_path(@project)
	end

	def add_resource
		authorize @project
		@user = User.find_by(email: params[:email])
		
		if @user
			if @user.Dev? or @user.QA?
			 	@relationship = Relationship.new(project_id: @project.id, user_id: @user.id)
				if @relationship.save
					flash[:notice] = "Your project has been assigned!"
					redirect_to project_path(@project)
				else
					flash[:alert] = "Already Assigned to this project!"
					redirect_to project_path(@project)
				end
			else
				flash[:alert] = "Developer/QA does not exist!"
				redirect_to project_path(@project)
			end
		else
			flash[:alert] = "User does not exist!"
			redirect_to project_path(@project)
		end
	end

	private
  	def project_params
  		params.require(:project).permit(:name, :description)
  	end

  	def set_project
			@project = Project.find(params[:id])
  	end
end