class CoursesController < ApplicationController
  skip_before_action :require_user, only: [:index, :show]

  def index
    @courses = Course.all
  end

  def show
    @courses = Course.all
    @course = Course.find_by(id: params["id"])
    @holes = @course.holes
  end

  def new
    @course = Course.new
  end

  def create
    course_params = params.require(:course).permit!
    @course = Course.create(course_params)
    if @course.valid?
      redirect_to new_course_hole_path(@course), notice: "A new course has been added to the database. Please add holes to the course."
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong."
      render "new"
    end
  end

  def edit
    @course = Course.find_by(id: params["id"])
  end

  def update
    course_params = params.require(:course).permit!
    @course = Course.find_by(id: params["id"])
    @course.update(course_params)
    if @course.valid?
      redirect_to courses_path, notice: "Course edited successfully."
    else
      puts "Failure!"
      flash[:alert] = "Something went wrong."
      render "new"
    end
  end

  def destroy
    @course = Course.find_by(id: params["id"])
    @course.destroy
    redirect_to courses_path
  end

end