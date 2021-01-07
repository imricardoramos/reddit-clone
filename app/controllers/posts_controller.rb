class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @community = Community.find(params[:community_id])
    @post = Post.new
  end

  def create
    @post = Post.new post_values
    @post.user_id = current_user.id
    @post.community_id = params[:community_id]
    puts @post.inspect
    if @post.save
      puts "Saved"
      redirect_to community_path(@post.community_id)
    else
      @community = Community.find(params[:community_id]) 
      render :new
    end
  end

  private

  def post_values
    params.require(:post).permit(:title, :body)
  end

end
