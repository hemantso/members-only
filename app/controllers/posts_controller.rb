class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @post = Post.all
    end
    
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_param)
        @post.user_id = current_user.id
        if @post.save
            redirect_to root_path
        else
            render new
        end
    end

    def post_param
        params.require(:post).permit(:title, :body)
    end
end
