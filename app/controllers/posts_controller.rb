class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create

    @post = current_user.posts.create(post_params)

    if @post.save
    redirect_to @post
    else
      render 'new'
    end

  end

  def edit
  end


  def update
      @post.update(post_params)
        redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  private
    def post_params
      params.require(:post).permit(:title, :body, :post_image)
    end
    def set_post
      @post = Post.find(params[:id])
    end

end