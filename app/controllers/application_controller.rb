class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include UsersHelper
helper_method :current_time, :date



def date
	date = Date.civil(params[:event]["date(1i)"].to_i,params[:event]["date(2i)"].to_i,params[:event]["date(3i)"].to_i)
end



def current_time
	current_time = DateTime.now
end

end
