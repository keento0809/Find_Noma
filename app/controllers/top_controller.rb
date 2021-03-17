class TopController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  
  def index
    @user = User.find_by(id: current_user.id);
  end

  def show

  end
end
