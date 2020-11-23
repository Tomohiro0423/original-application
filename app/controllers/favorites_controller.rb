class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    flash[:success] = '投稿をお気に入りしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavorite(post)
    flash[:success] = '投稿のお気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
