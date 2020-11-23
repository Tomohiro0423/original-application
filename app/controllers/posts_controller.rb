class PostsController < ApplicationController
  def index
    @posts = current_user.posts.order(id: :desc).page(params[:page]).per(9)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments
    if logged_in?
    @comment = current_user.comments.new
    end
  end

  def new
    if logged_in?
      @post = Post.new
    else
      flash[:danger] = 'ログインをすると投稿機能が利用できます。'
      redirect_to login_path
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'コーディネートを投稿しました。'
      redirect_to root_url
    else
      @posts = current_user.posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'コーディネートの投稿に失敗しました。'
      render 'posts/index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_to user_path(current_user)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content,:image,:title)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
