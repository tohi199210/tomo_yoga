class PostsController < ApplicationController
    
    before_action :authenticate_user!
	def index
		@posts = Post.page(params[:page]).reverse_order
    end

    def new
    	@post = Post.new
    end

    def create
    	@post = Post.new(post_params)
        @post.user_id = current_user.id
    	if @post.save
           redirect_to post_path(@post.id)
        else
            render :new
        end
    end

    def show
    	@post = Post.find(params[:id])
        @post_comment  = PostComment.new
    end

    def edit
    	@post = Post.find(params[:id])
    end

    def update
    	@post = Post.find(params[:id])
        if@post.update(post_params)
    	redirect_to user_path
        else
            render :edit
        end
    end
    
    private
    
    def post_params
    	params.require(:post).permit(:image , :title, :table_content, :subtitle, :content)

    end
end
