class RoundsController < ApplicationController
  skip_before_action :require_user, only: [:index, :show]

  def index
    @rounds = Round.all
  end

  def show
    @rounds = Round.all
    @round = Round.find_by(id: params["id"])
  end

  def new
    @round = Round.new
  end

  def create
    round_params = params.require(:round).permit!
    std_slope = 113.0
    @course = Course.find_by(id: params[:round][:course_id])
    @player = Player.find_by(id: params[:round][:player_id])
    course_handicap = (@player.handicap_index * @course.slope.to_f / std_slope).round
    @round = Round.create(course_id: params[:round][:course_id], player_id: params[:round][:player_id], league_id: params[:round][:league_id], date: Date.current, datetime: DateTime.current, course_handicap: course_handicap, strokes_earned: 0, score_gross: 0, score_net: 0)
    if @round.valid?
      @course.holes.each do |hole|
        @holescore = Holescore.create(hole_id: hole.id, round_id: @round.id, score_gross: 0, score_net: 0)
      end

      redirect_to edit_round_path(@round), notice: "A new round has been added to the database."
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong."
      render "new"
    end
  end

  def edit
    @round = Round.find_by(id: params["id"])
  end

  def update
    round_params = params.require(:round).permit!
    @round = Round.find_by(id: params["id"])
    @round.update(strokes_earned: params[:round][:strokes_earned])
    if @round.valid?
      redirect_to edit_round_path(@round), notice: "Round edited successfully."
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong."
      render "new"
    end
  end

  def destroy
    @round = Round.find_by(id: params["id"])
    @round.destroy
    redirect_to rounds_path
  end

end