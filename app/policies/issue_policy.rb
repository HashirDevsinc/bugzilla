class IssuePolicy < ApplicationPolicy

	def index?
		true
	end

	def new?
		if user.user_type == 'QA'
			true
		else
			false
		end
	end

	def create?
		if user.user_type == 'QA'
			true
		else
			false
		end
	end

	def edit?
		if user.user_type == 'Dev'
			return true
		else 
			return false
		end
	end

	def show?
		if user.user_type == 'Dev'
			return true
		else 
			return false
		end
	end
end