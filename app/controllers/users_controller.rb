class UsersController < ApplicationController
  def show
    # user = current_user
    @user = User.find_by(id: current_user.id)
  end
end
