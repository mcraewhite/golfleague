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
    user_params = params.require(:user).permit!
    @user = User.create(user_params)
    if @user.valid?
      @player = Player.create(user_id: @user.id, seat_id: nil, table_id: nil, is_dealer: false, chips: 1000, bet: nil)
      redirect_to "/login", notice: "Welcome to The Golf League!"
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
      redirect_to games_path, notice: "Success!"
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