class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show;end

  def new
    @post = Post.new
  end

  def edit;end

  def create
    if @post = Post.create(post_params)
      flash[:success] = 'post created sucessfully! '

      redirect_to posts_path
    else
      flash.now[:alert] = 'post couldnt be created! '

      render :new
    end
  end

  def update
    if @post.update(post_params)

      redirect_to posts_path
    else

      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
    end

  private

  def post_params
    params.require(:post).permit(:title, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
