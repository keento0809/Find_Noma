class TopController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  
  def index
    @user = User.find_by(id: current_user.id);
    @posts = Post.all
  end

  def show

  end
end
