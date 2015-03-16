class PlayerleaguesController < ApplicationController
  skip_before_action :require_user, only: [:index, :show]

  def index
    @playerleagues = Playerleague.all
  end

  def show
    @playerleagues = Playerleague.all
    @playerleague = Playerleague.find_by(id: params["id"])
    @players = @playerleague.players
  end

  def new
    @playerleague = Playerleague.new
  end

  def create
    playerleague_params = params.require(:playerleague).permit!
    @playerleague = Playerleague.create(playerleague_params)
    if @playerleague.valid?
      redirect_to leagues_path, notice: "A new playerleague has been added to the database."
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong."
      render "new"
    end
  end

  def edit
    @playerleague = Playerleague.find_by(id: params["id"])
  end

  def update
    playerleague_params = params.require(:playerleague).permit!
    @playerleague = Playerleague.find_by(id: params["id"])
    @playerleague.update(playerleague_params)
    if @playerleague.valid?
      redirect_to leagues_path, notice: "Playerleague edited successfully."
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong."
      render "new"
    end
  end

  def destroy
    @playerleague = Playerleague.find_by(id: params["id"])
    @playerleague.destroy
    redirect_to playerleagues_path
  end

end