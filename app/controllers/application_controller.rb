class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include UsersHelper
helper_method :current_time


def current_time
	current_time = DateTime.now
end

end
