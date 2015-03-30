class HolescoresController < ApplicationController
  skip_before_action :require_user, only: [:index, :show]

  def index
    @holescores = Holescore.all
  end

  def show
    @holescores = Holescore.all
    @holescore = Holescore.find_by(id: params["id"])
    @players = @holescore.players
  end

  def new
    @holescore = Holescore.new
  end

  def create
    @holescore = Holescore.create(holescore_params)
    @round = @holescore.round

    score_gross = 0
    score_net = 0
    @round.holescores.each do |holescore|
      score_gross += holescore.score_gross
      if @round.strokes_earned <= holescore.hole.course_handicap
        holescore.score_net -= 1
      end
      score_net += hole.score_net
    end

    @round.update(score_gross: score_gross, score_net: score_net)
    if @holescore.valid?
      redirect_to leagues_path, notice: "A new holescore has been added to the database."
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong."
      render "new"
    end
  end

  def edit
    @holescore = Holescore.find_by(id: params["id"])
  end

  def update
    @holescore = Holescore.find_by(id: params["id"])
    @round = @holescore.round

    round_score_gross = 0
    round_score_net = 0
    score_gross = params[:holescore][:score_gross].to_i
    score_net = params[:holescore][:score_gross].to_i
    if @round.strokes_earned >= @holescore.hole.handicap - 0.5
      score_net -= 1
    end
    @holescore.update(holescore_params)
    if @holescore.valid?
      @round.holescores.each do |holescore|
        round_score_gross += holescore.score_gross
        round_score_net += holescore.score_net
      end
      @round.update(score_gross: round_score_gross, score_net: round_score_net)
      redirect_to edit_round_path(@holescore.round), notice: "Score edited successfully."
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong."
      render "new"
    end
  end

  def destroy
    @holescore = Holescore.find_by(id: params["id"])
    @holescore.destroy
    redirect_to holescores_path
  end

  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def holescore_params
      params.require(:holescore).permit!
    end

end