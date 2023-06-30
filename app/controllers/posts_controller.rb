class PostsController < ApplicationController

  def new

    @post = Post.new
    
  end


  def index
    @posts = Post.page(params[:page]).reverse_order
  end

  def indexan
    @posts = Post.where(mode:"アンレート").page(params[:page]).reverse_order
  end

  def indexcon
    @posts = Post.where(mode:"コンペティティブ").page(params[:page]).reverse_order
  end

  def indexcus
    @posts = Post.where(mode:"カスタム").page(params[:page]).reverse_order
  end

  def indexoth
    @posts = Post.where(mode:"その他").page(params[:page]).reverse_order
  end

  def create
  @post = Post.new(post_params)
  @post.user_id = current_user.id
    if @post.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new  
    @comments = @post.comments.page(params[:page]).per(7).reverse_order
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:mode, :text, :nop,:profile_image)
  end



end
