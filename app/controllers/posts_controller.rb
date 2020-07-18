class PostsController < ApplicationController

    def index
        @posts = Post.all
    end
    
    def create
        @post = Post.new(post_params)
        
        if @post.save!
            redirect_to @post
        end
    end

    def show
        @post  = Post.find_by_slug(params[:slug])
    end

    def update
        @post = Post.find_by_id(params[:id])
        
        if @post.update!(post_params)
            redirect_to @post
        end
    end

    def destroy
        @post = Post.find_by_id(params[:id])

        if @post.destroy!
            redirect_to 'posts#index'
        end
    end

    private

        def post_params
            params.require(:post).permit(:title, :slug, :body)
        end

end
