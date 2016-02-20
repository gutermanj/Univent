class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def not_found
  render :file => File.join(Rails.root, '/public/404'), :formats => [:html], :status => 404, :layout => false
end

end
