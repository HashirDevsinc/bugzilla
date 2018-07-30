class IssuesController < ApplicationController
	
	before_action :authenticate_user!

	before_action :set_project, only: [:index, :new, :create]

	before_action :set_issue, only: [:edit, :update, :show, :assign_bug, :unassign_bug]

	def index
		@issues = @project.issues.paginate(page: params[:page])
		@user = User.find(current_user.id)
	end

	def new
		@issue = Issue.new
		authorize @issue
	end

	def create
		@issue = current_user.issues.new(issue_params)
		@issue.project_id = @project.id
		authorize @issue
	 
	 	if @issue.save
	 		flash[:notice] = "Reported!"
	 		redirect_to project_issues_path
	 	else
	 		render 'new'
	 	end
	end

	def edit
	end

	def update
		if @issue.update_attribute(:status, params[:issue][:status])
			flash[:notice] = "status updated!"
			redirect_to edit_project_issue_path
		else
			flash[:alert] = "Failed!"
			redirect_to edit_project_issue_path
		end
	end

	def show
	end

	def assign_bug
		@project = Project.find(@issue.project_id)
		
		if @issue.d_id
			flash[:alert] = "Already assigned to someone!"
			redirect_to project_issue_path(@project.id, @issue.id)
		else
			@issue.update_attribute(:d_id, current_user.id)
			flash[:notice] = "Assigned!"
			redirect_to project_issues_path(@project.id)
		end
	end

	def unassign_bug
		@project = Project.find(@issue.project_id)

		if @issue.d_id
			@issue.update_attribute(:d_id, nil)
			flash[:notice] = "Unassigned!"
			redirect_to project_issues_path(@project.id)
		else
			flash[:alert] = "Already Unassigned!"
			redirect_to project_issue_path(@project.id, @issue.id)	
		end
	end

	private
		def issue_params
			params.require(:issue).permit(:title, :description, :deadline, :issue_type, :status, :img)
		end

		def set_project
			@project = Project.find(params[:project_id])
		end

		def set_issue
			@issue = Issue.find(params[:id])
		end
end