class FavoritesController < ApplicationController
  before_action :authenticate_member!

  def create
    favorite = Favorite.new(member_id: current_member.id, review_id:params[:review_id])
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @review = Review.find(params[:review_id])
    favorite = @review.favorites.find_by(member_id: current_member.id)
    favorite.destroy
    redirect_to request.referer
  end


end
