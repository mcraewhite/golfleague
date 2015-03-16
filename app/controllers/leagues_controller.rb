class LeaguesController < ApplicationController
  skip_before_action :require_user, only: [:index, :show]

  def index
    @leagues = League.all
  end

  def show
    @leagues = League.all
    @league = League.find_by(id: params["id"])
    @players = @league.players
  end

  def new
    @league = League.new
  end

  def create
    league_params = params.require(:league).permit!
    @league = League.create(league_params)
    if @league.valid?
      redirect_to leagues_path, notice: "A new league has been added to the database."
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong."
      render "new"
    end
  end

  def edit
    @league = League.find_by(id: params["id"])
  end

  def update
    league_params = params.require(:league).permit!
    @league = League.find_by(id: params["id"])
    @league.update(league_params)
    if @league.valid?
      redirect_to leagues_path, notice: "League edited successfully."
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong."
      render "new"
    end
  end

  def destroy
    @league = League.find_by(id: params["id"])
    @league.destroy
    redirect_to leagues_path
  end

end