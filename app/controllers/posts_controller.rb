class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to sub_url(@post.sub)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to sub_url(@post.sub)
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to sub_url(@post.sub)
  end

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
