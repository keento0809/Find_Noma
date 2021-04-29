class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  def show
    # user = current_user
    @user = User.find_by(id: current_user.id)
    # @posts = @user.posts
    @liked_posts = @user.like_posts
  end

  def edit
    @user = User.find(params[:id])
  end

  private

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
