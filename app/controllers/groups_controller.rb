class GroupsController < ApplicationController
  skip_before_action :require_user, only: [:index, :show]

  def index
    @groups = Group.all
  end

  def show
    @groups = Group.all
    @group = Group.find_by(id: params["id"])
    @rounds = @group.rounds
  end

  def new
    @group = Group.new
    @rounds = @group.rounds
  end

  def create
    std_slope = 113.0
    
    if @group.valid?
      @course = Course.find_by(id: params[:group][:course_id])
      @player = Player.find_by(id: params[:group][:player_id])
      course_handicap = (@player.handicap_index * @course.slope.to_f / std_slope).group
      @round = Round.create(course_id: params[:group][:course_id], player_id: params[:group][:player_id], league_id: params[:group][:league_id], date: Date.current, datetime: DateTime.current, course_handicap: course_handicap, strokes_earned: 0, score_gross: 0, score_net: 0)

      redirect_to edit_group_path(@group), notice: "A new group has been added to the database."
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong."
      render "new"
    end
  end

  def edit
    @group = Group.find_by(id: params["id"])
  end

  def update
    @group = Group.find_by(id: params["id"])
    @group.update(strokes_earned: params[:group][:strokes_earned])
    if @group.valid?
      redirect_to edit_group_path(@group), notice: "Group edited successfully."
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong."
      render "new"
    end
  end

  def destroy
    @group = Group.find_by(id: params["id"])
    @group.destroy
    redirect_to groups_path
  end

  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def group_params
      params.require(:group).permit!
    end

end