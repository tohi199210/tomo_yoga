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
        @user = User.find(params[:id])
    	@post = Post.find(params[:id])
        @post_comment  = PostComment.new
    end

    def edit
    	@post = Post.find(params[:id])
    end

    def update
    	@post = Post.find(params[:id])
        if @post.update(post_params)
    	redirect_to post_path(@post.id)
        else
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end
    
    private
    
    def post_params
    	params.require(:post).permit(:image , :title, :table_content, :subtitle, :content)

    end
end
