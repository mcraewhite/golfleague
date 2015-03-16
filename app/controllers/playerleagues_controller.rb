class PlayerleaguesController < ApplicationController

  def index
    @playerleagues = Playerleague.all
  end

  def show
    @playerleague = Playerleague.find_by(id: params["id"])
  end

  def new
    @playerleague = Playerleague.new
  end

  def create
    playerleague_params = params.require(:playerleague).permit!
    @playerleague = Playerleague.create(playerleague_params)
    if @playerleague.valid?
      @player = Player.create(playerleague_id: @playerleague.id, seat_id: nil, table_id: nil, is_dealer: false, chips: 1000, bet: nil)
      redirect_to "/login", notice: "Welcome to The Golf League!"
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong. Please ensure you submit a valid email address and your password is typed correctly."
      render "new"
    end
  end

  def edit
    @playerleague = Playerleague.find_by(id: params["id"])
  end

  def update
    playerleague_params = params.require(:playerleague).permit!
    @playerleague = Playerleague.find_by(id: params["id"])
    if @playerleague.valid?
      redirect_to games_path, notice: "Success!"
    else
      flash[:alert] = "Something went wrong. Please ensure you submit a valid email address and your password is typed correctly."
      render "edit"
    end
  end

  def destroy
    @playerleague = Playerleague.find_by(id: params["id"])
    @playerleague.destroy
    redirect_to playerleagues_path
  end

end