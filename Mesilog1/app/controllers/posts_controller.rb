class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def show
    @post_show = Post.find(params[:id])
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path(@post.id), notice: "投稿に成功しました"
    else
      render  posts_path, alert: "投稿に失敗しました"
    end

  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "編集に成功しました"
    else
      render :edit, alert: "編集に失敗しました"
    end
  end

  def destroy
    if @post.destroy(post_params)
      redirect_to post_path, notice: "削除に成功しました"
    else
      render post_path(@post), alert: "削除に失敗しました"
    end
  end


  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :content_image)
  end

end