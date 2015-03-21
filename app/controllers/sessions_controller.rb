class SessionsController < ApplicationController
  layout false
  skip_before_action :require_user
  skip_before_filter :set_breadcrumbs

  def create
    # params["email"] => the email address
    # params["password"] => the password
    # Do authentication
    # Redirect to the root_path
    # Display a notice that login was either successful or unsuccessful

    user = User.find_by(email: params["email"])
    if user && user.authenticate(params["password"])
      session["user_id"] = user.id
      redirect_to session[:breadcrumbs][-1], notice: "Sweet, you're in!"
    else
      redirect_to session[:breadcrumbs][-1], alert: "No way man."
    end

  end

  def destroy
    # Do sign-out
    session["user_id"] = nil
    redirect_to root_path, notice: "See ya later!"
  end

end