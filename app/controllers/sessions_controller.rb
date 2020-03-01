class SessionsController < Devise::SessionsController

	def destroy
    super
    session[:user_id] = nil
    flash[:notice] = "Signed out successfully."
  	end
end
