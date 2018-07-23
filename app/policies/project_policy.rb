class ProjectPolicy < ApplicationPolicy

	def index?
		true
	end


	def new?
		if user.user_type == 'Manager'
			true
		else
			false
		end
	end

	def create?
		if user.user_type == 'Manager'
			true
		else
			false
		end
	end

	def edit?
		if user.user_type == 'Manager'
			true
		else
			false
		end
	end

	def update?
		if user.user_type == 'Manager'
			true
		else
			false
		end
	end

	def show?
		# user.user_type == 'Manager'
	end

	def destroy?
		user.user_type == 'Manager'
	end

	def user_delete?
				if user.user_type == 'Manager'
			true
		else
			false
		end
	end

	def assign_qa?
		if user.user_type == 'Manager'
			true
		else
			false
		end
	end

	def assign_dev?
		if user.user_type == 'Manager'
			true
		else
			false
		end
	end

	def bugs?
		if user.user_type != 'Manager'
			true
		else
			false
		end
	end

	def bug_reporting?
		if user.user_type == 'QA'
			true
		else
			false
		end
	end


end