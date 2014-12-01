class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_user, except: [:index, :show, :destroy, :new, :create]
  before_action :set_admin, only: [:destroy]

  respond_to :html

  def index
    @sticky = User.find_by(:admin => true)
    @posts = Post.all
  end

  def show
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    respond_with(@post)
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private

    def set_admin
      unless current_user.admin?
        redirect_to root_url, alert: "Only admins can destroy posts."
      end
    end

    def check_user
      unless @post.user == current_user || current_user.admin?
        redirect_to root_url, alert: "You are not authorized."
      end
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
