class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def new
    @post.new(post_params)
    render :edit
  end
  def create
    @post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
