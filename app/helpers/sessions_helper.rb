module SessionsHelper

=begin
	def log_in(user)
		session[:user_id] = user.id
		session[:user_type] = user.user_type
	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end
	
	def logged_in_manager?
		!current_user.nil? && current_user.manager?
	end

	def logged_in_developer?
		!current_user.nil? && current_user.developer?
	end
	
	def logged_in_qa?
		!current_user.nil? && current_user.qa?
	end

	def log_out
		session.delete(:user_id)
  		@current_user = nil
  	end
=end
end
