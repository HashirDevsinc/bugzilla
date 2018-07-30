class IssuePolicy < ApplicationPolicy

	def new?
		user.QA?
	end

	def create?
		user.QA?
	end

	def edit?
		if user.Dev?
			if user.id == record.d_id
				return true
			else
				false
			end
		else 
			return false
		end
	end

	def show?
		user.Dev?
	end

	def not_assigned?
		record.d_id != user.id
	end
end