class LeaguesController < ApplicationController
  skip_before_action :require_user, only: [:index, :show]

  def index
    @leagues = League.all
  end

  def show
    @leagues = League.all
    @league = League.find_by(id: params["id"])
    @players = @league.players
    @playerleagues = @league.playerleagues

    double_eagle = 335
    hole_in_one = 165
    eagle = 130
    birdie = 50
    par = 10
    bogey = 0
    double_bogey = -10
    triple_bogey = -20

    @players.each do |player|
      @playerleague = Playerleague.find_by(player_id: player.id, league_id: @league.id)
      points_earned = 0
      player.rounds.each do |round|
        puts "In Rounds"
        round.holescores.each do |holescore|
          puts "In Holescores: holescore.score_net- " + holescore.score_net.to_s + ", holescore.hole.par- " + holescore.hole.par.to_s
          if holescore.score_net - holescore.hole.par == -3
            if holescore.hole.par == 4
              points_earned += hole_in_one
            end
            points_earned += double_eagle
          elsif holescore.score_net - holescore.hole.par == -2
            if holescore.hole.par == 3
              points_earned += hole_in_one
            end
            points_earned += eagle
          elsif holescore.score_net - holescore.hole.par == -1
            points_earned += birdie
          elsif holescore.score_net - holescore.hole.par == -0
            points_earned += par
          elsif holescore.score_net - holescore.hole.par == 1
            points_earned += bogey
          elsif holescore.score_net - holescore.hole.par == 2
            points_earned += double_bogey
          else
            points_earned += triple_bogey
          end
          puts "points_earned: " + points_earned.to_s
        end
      end

      @playerleague.update(league_points: points_earned)
      puts "Loop: " + points_earned.to_s
    end
  end

  def new
    @league = League.new
  end

  def create
    league_params = params.require(:league).permit!
    @league = League.create(league_params)
    if @league.valid?
      redirect_to league_path(@league), notice: "A new league has been added to the database."
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
      redirect_to league_path(@league), notice: "League edited successfully."
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