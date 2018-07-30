class ProjectPolicy < ApplicationPolicy

	def new?
		user.Manager?
	end

	def create?
		user.Manager?
	end

	def edit?
		user.Manager?
	end

	def update?
		user.Manager?
	end

	def destroy?
		user.Manager?
	end

	def user_unassign?
		user.Manager?
	end

	def add_resource?
		user.Manager?
	end

	def bugs?
		user.user_type != 'Manager'
	end

	def bug_reporting?
		user.QA?
	end
end