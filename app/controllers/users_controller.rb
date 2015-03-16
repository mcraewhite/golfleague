class UsersController < ApplicationController
  layout false, unless: [:edit]
  skip_before_action :require_user, only: [:new, :index, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params["id"])
  end

  def new
    @user = User.new
  end

  def create
    # user_params = params.require(:user).permit!
    @user = User.create(email: params[:user][:email], password: params[:user][:password])
    if @user.valid?
      @player = Player.create(user_id: @user.id, name: params[:user][:players][:name], handicap_index: params[:user][:players][:handicap_index])
      redirect_to courses_path, notice: "Welcome to The Golf League!"
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong. Please ensure you submit a valid email address and your password is typed correctly."
      render "new"
    end
  end

  def edit
    @user = User.find_by(id: params["id"])
  end

  def update
    user_params = params.require(:user).permit!
    @user = User.find_by(id: params["id"])
    if @user.valid?
      redirect_to courses_path, notice: "Success!"
    else
      flash[:alert] = "Something went wrong. Please ensure you submit a valid email address and your password is typed correctly."
      render "edit"
    end
  end

  def destroy
    @user = User.find_by(id: params["id"])
    @user.destroy
    redirect_to users_path
  end

end