class IssuesController < ApplicationController
	
	before_action :authenticate_user!
	
	def index
		@project = Project.find(params[:p_id])

		# @issues = Issue.all.paginate(page: params[:page])
		@issues = Issue.all.where(project_id: @project.id).paginate(page: params[:page])

		@user = User.find(current_user.id)

		authorize @issues
	end

	def new
		@project = Project.find(params[:p_id])
		
		@issue = Issue.new
		authorize @issue
	end

	def create
		@project = Project.find(params[:project_id])
		
		
		if params[:issue][:issue_type] == "Bug"
			params[:issue][:status] = params[:status_bug]
		end

		# @issue = Issue.new(issue_params)
		@issue = Issue.new(project_id: @project.id, user_id: current_user.id, title: params[:issue][:title], img: params[:issue][:img])
		authorize @issue
	 	if @issue.save
	 		issue_param = params[:issue]
			@issue.update_attributes(description: issue_param[:description], deadline: issue_param[:deadline], issue_type: issue_param[:issue_type], status: issue_param[:status])
	 		
	 		flash[:notice] = "Reported!"
	 		redirect_to issues_path(p_id: @project.id)
	 	else
	 		render 'new'
	 	end
	end


	def edit
		@issue = Issue.find(params[:id])
	end

	def update
		@issue = Issue.find(params[:id])

		if @issue.update_attribute(:status, params[:issue][:status])
			flash[:notice] = "status updated!"
			redirect_to edit_issue_path(@issue.id)
		end
	end

	def show
		@issue = Issue.find(params[:id])

		@user = User.find(current_user.id)
		
		@project = Project.find(@issue.project_id)

	end

	def assign_bug
		@issue = Issue.find(params[:id])
		@project = Project.find(@issue.project_id)

		
		if @issue.d_id
			flash[:alert] = "already assigned to someone!"
			redirect_to issue_path(id: @issue.id)
		else
			@issue.update_attribute(:d_id, current_user.id)
			flash[:notice] = "Assigned!"
			redirect_to issues_path(p_id: @project.id)
		end
	end

	def unassign_bug
		@issue = Issue.find(params[:id])
		@project = Project.find(@issue.project_id)

		if @issue.d_id
			@issue.update_attribute(:d_id, nil)
			flash[:notice] = "Unassigned!"
			redirect_to issues_path(p_id: @project.id)
		else
			flash[:alert] = "Already Unassigned!"
			redirect_to issue_path(id: @issue.id)	
		end
	end

	# private
	# 	def issue_params
	# 		params.require(:issue).permit(:title, :description, :issue_type, :status, :img)
	# 	end
end
