class ApplicationRecord < ActiveRecord::Base
  	self.abstract_class = true
	
	before_commit :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
	end

end