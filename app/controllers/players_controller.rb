class PlayersController < ApplicationController
  skip_before_action :require_user, only: [:index, :show]

  def index
    @players = Player.all
  end

  def show
    @players = Player.all
    @player = Player.find_by(id: params["id"])
  end

  def new
    @player = Player.new
  end

  def create
    player_params = params.require(:player).permit!
    @player = Player.create(player_params)
    if @player.valid?
      redirect_to players_path, notice: "A new player has been added to the database."
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong."
      render "new"
    end
  end

  def edit
    @player = Player.find_by(id: params["id"])
  end

  def update
    player_params = params.require(:player).permit!
    @player = Player.find_by(id: params["id"])
    @player.update(player_params)
    if @player.valid?
      redirect_to players_path, notice: "Player edited successfully."
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong."
      render "new"
    end
  end

  def destroy
    @player = Player.find_by(id: params["id"])
    @player.destroy
    redirect_to players_path
  end

end