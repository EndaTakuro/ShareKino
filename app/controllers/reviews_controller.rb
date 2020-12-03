class ReviewsController < ApplicationController

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    @review.member_id = current_member.id
    @review.movie_id = @movie.id
    if @review.save
      redirect_to movie_path(@review.movie)
    else
      render :new
    end
  end


  def edit
    @review = Review.find(params[:id])

  end

  def update
  end

  def destroy
  end


  def review_params
    params.require(:review).permit(:title, :content, :score)
  end

end
