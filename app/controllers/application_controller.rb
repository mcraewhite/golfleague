class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :require_user
  before_filter :set_breadcrumbs

  def current_user
    User.find_by(id: session["user_id"])
  end

  def require_user
    if current_user.nil?
      redirect_to new_session_path
    end
  end

  def set_breadcrumbs
    if session[:breadcrumbs]
      @breadcrumbs = session[:breadcrumbs]
    else
      @breadcrumbs = Array.new
    end

    @breadcrumbs.push(request.url)
    puts "breadcrumb: " + request.url

    if @breadcrumbs.count > 4
      @breadcrumbs.shift
    end

    session[:breadcrumbs] = @breadcrumbs
  end
end
