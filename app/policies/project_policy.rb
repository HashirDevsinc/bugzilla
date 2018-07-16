class ProjectPolicy < ApplicationPolicy

	def index?
		true
	end


	def new?
		user.user_type == 'Manager'
	end

	def create?
		user.user_type == 'Manager'
	end

	def edit?
		user.user_type == 'Manager'
	end

	def destroy?
		user.user_type == 'Manager'
	end

	def developer?
		if user.user_type == 'Developer'
			true
		else
			false
		end
	end


end