class HolesController < ApplicationController
  skip_before_action :require_user, only: [:index, :show]

  before_filter :load_parent

  def index
    @holes = Hole.all
  end

  def show
    @holes = Hole.all
    @hole = Hole.find_by(id: params["id"])
  end

  def new
    @hole = @course.holes.new
  end

  def create
    hole_params = params.require(:hole).permit!
    @hole = @course.holes.create(number: params[:hole][:number], par: params[:hole][:par], yards: params[:hole][:yards], handicap: params[:hole][:handicap], number_validation: "course" + @course.id.to_s + " - hole: " + params[:hole][:number], handicap_validation: "course" + @course.id.to_s + " - hcap: " + params[:hole][:handicap])
    if @hole.valid?
      redirect_to new_course_hole_path(@course), notice: "Hole #" + @hole.number.to_s + " added successfully."
    else
      puts "Failure!"
      redirect_to new_course_hole_path(@course), alert:"Something went wrong."
    end
  end

  def edit
    @hole = Hole.find_by(id: params["id"])
  end

  def update
    hole_params = params.require(:hole).permit!
    @hole = @course.holes.find_by(id: params["id"])
    @hole.update(hole_params)
    if @hole.valid?
      redirect_to course_path(@course), notice: "Hole #" + @hole.number.to_s + " edited successfully."
    else
      puts "Failure!"
      redirect_to edit_course_hole_path([@course, @hole]), alert:"Something went wrong."
    end
  end

  def destroy
    @hole = Hole.find_by(id: params["id"])
    @hole.destroy
    redirect_to holes_path
  end

private

  def load_parent
    @course = Course.find(params[:course_id])
  end

end