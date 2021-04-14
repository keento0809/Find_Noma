class LikesController < ApplicationController
    before_action :post_params

    def create
        Like.create(user_id: current_user.id, post_id: params[:id])
        # 非同期処理のため、redirect_toを削除
        # redirect_to post_path
    end

    def destroy
        Like.find_by(user_id: current_user.id, post_id: params[:id]).destroy
        # redirect_to post_path
    end

    private

        def post_params
            @post = Post.find(params[:id])
        end
end
