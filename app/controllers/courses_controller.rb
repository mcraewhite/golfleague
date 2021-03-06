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
    1.times { @course.teesets.build }
    18.times { @course.holes.build }
    i = 1
    @course.holes.each do |hole|
      1.times { hole.tees.build }
      hole.number = i
      i += 1
    end
  end

  def create
    @course = Course.create(course_params)
    if @course.valid?
      redirect_to courses_path, notice: "A new course has been added to the database."
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
    @course = Course.find_by(id: params["id"])
    @course.update(course_params)
    if @course.valid?
      redirect_to course_path(@course), notice: "Course edited successfully."
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

  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def course_params
      params.require(:course).permit!
    end

end