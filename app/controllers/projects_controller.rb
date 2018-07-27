class ProjectsController < ApplicationController
	
	before_action :authenticate_user!

	def index
		# if current_user.user_type == "Manager"

		if current_user.Manager?
			@projects = current_user.projects.paginate(page: params[:page])
		# elsif current_user.user_type == "QA"
		# 	@projects = Project.all.paginate(page: params[:page])
		else
			@projects = current_user.user_projects.paginate(page: params[:page])
		end
	end

	def new
		@project = Project.new
		authorize @project
	end

	def create
  	@project = current_user.projects.new(project_params)
  	authorize @project

  	if @project.save
  		flash[:notice] = "Your project has been created!"
  		redirect_to projects_path
  	else
  		render 'new'
  	end
	end

	def edit
		@project = Project.find(params[:id])
		authorize @project
	end

	def update
		@project = Project.find(params[:id])
		authorize @project

		if @project.update(project_params)
			redirect_to projects_path
		else
			flash[:alert] = "Updation Failed!"
			render 'edit'
		end
	end

	def show
		@project = Project.find(params[:id])
		@users = @project.users.where.not(user_type: "Manager")
	end

	def destroy
		@project = Project.find(params[:id])
		authorize @project

		@project.destroy
		flash[:notice] = "Project deleted"
		redirect_to projects_path
	end

	def user_unassign
		@relation = Relationship.where(project_id: params[:project_id], user_id: params[:user_id]).first
		
		@project = Project.find(params[:project_id])

		authorize @project

		@relation.destroy
		flash[:notice] = "Unassigned!"

		redirect_to project_path(@project)
	end

	def add_resource
		@project = Project.find(params[:project_id])

		authorize @project
		
		@user = User.find_by(email: params[:email])
		
		if @user
			if @user.user_type == "Dev"

				@c_user = Relationship.find_by(project_id: params[:project_id], user_id: @user.id)

		  	if @c_user.blank?
		  		Relationship.create(project_id: params[:project_id], user_id: @user.id)
					flash[:notice] = "Your project has been assigned!"
					redirect_to project_path(@project)
				else
					flash[:alert] = "Already Assigned to this project!"
					redirect_to project_path(@project)
				end
			elsif @user.user_type == "QA"
				
				@c_user = Relationship.find_by(project_id: params[:project_id], user_id: @user.id)

		  	if @c_user.blank?
		  		Relationship.create(project_id: params[:project_id], user_id: @user.id)
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

	# def assign_dev
	# 	@user = User.find_by(email: params[:email], user_type: "Dev")
	# 	@project = Project.find(params[:project_id])

	# 	authorize @project
		
	# 	if @user
			
	# 		@c_user = Relationship.find_by(project_id: params[:project_id], user_id: @user.id)
	  	
	#   	if @c_user.blank?
	#   		Relationship.create(project_id: params[:project_id], user_id: @user.id)
	# 			flash[:notice] = "Your project has been assigned!"
	# 			redirect_to project_path(@project)
	# 		else
	# 			flash[:alert] = "Already Assigned to this project!"
	# 			redirect_to project_path(@project)
	# 		end
	# 	else
	# 		flash[:alert] = "Developer does not exist!"
	# 		redirect_to project_path(@project)
	# 	end

	# end

	# def assign_qa
	# 	@user = User.find_by(email: params[:email], user_type: "QA")
	# 	@project = Project.find(params[:project_id])

	# 	authorize @project

	# 	if @user

	# 		@c_user = Relationship.find_by(project_id: params[:project_id], user_id: @user.id)

	# 		if @c_user.blank?
	# 			Relationship.create(project_id: params[:project_id], user_id: @user.id)
	# 			flash[:notice] = "Your project has been assigned!"
	# 			redirect_to project_path(@project)
	# 		else
	# 			flash[:alert] = "Already Assigned to this project!"
	# 			redirect_to project_path(@project)
	# 		end
	# 	else
	# 		flash[:alert] = "QA does not exist!"
	# 		redirect_to project_path(@project)
	# 	end
	# end


	private
  	def project_params
  		params.require(:project).permit(:name, :description)
  	end
end
