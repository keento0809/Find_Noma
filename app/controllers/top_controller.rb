class TopController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  
  def index
    @user = User.find_by(id: current_user.id);
    @posts = Post.all.page(params[:page]).per(3)
    # @posts = Post.all.order(created_at: :desc).page(params[:page]).per(3)
    @post = Post.find_by(params[:id])
    # @Likeposts = Post.Includes(:user_id).sort{ |a,b| b.liked_users.size <=> a.liked_users.size }
    @liked_posts = @user.like_posts.page(params[:page]).per(3)
    # いいね数の多い順に並べる際に使用, includeは小文字！！
    # @ranked_posts = Post.includes(:liked_users).sort{ |a,b| b.liked_users.size <=> a.liked_users.size }
    @ranked_posts = Post.includes(:liked_users).page(params[:page]).per(3).sort{ |a,b| b.liked_users.size <=> a.liked_users.size }
  end

  def show

  end
end
