class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end


module ApplicationHelper
#for current user to use through out the app
   def current_user
     @current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id]) 
     # Use find_by_id to get nil instead of an error if user doesn't exist
   end

end