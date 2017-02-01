class AdminUsersController < ApplicationController

before_action :confirm_admin

	layout 'admin'

	def index
		@page_title = "Dashboard"

	end



private

def confirm_admin
unless current_user.admin == true
	flash[:warning] = "Admin Area Restricted to Administrators Only"
	redirect_to(root_path)
end
end


end
