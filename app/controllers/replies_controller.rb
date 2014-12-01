class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: [:show, :edit, :update, :destroy]
  before_action :set_post
  before_action :check_user, except: [:new, :create, :destroy]
  before_action :set_admin, only: [:destroy]

  respond_to :html

  def index
    @replies = Reply.all
    respond_with(@replies)
  end

  def show
    respond_with(@reply)
  end

  def new
    @reply = Reply.new
    respond_with(@reply)
  end

  def edit
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.post_id = @post.id
    @reply.user_id = current_user.id
    @reply.save
    redirect_to(@post)
  end

  def update
    @reply.update(reply_params)
    respond_with(@reply)
  end

  def destroy
    @reply = @post.replies.find(params[:id])
    @reply.destroy
    respond_with(@post)
  end

  private

    def set_admin
      unless current_user.admin?
        redirect_to root_url, alert: "Only admins can destroy replies."
      end
    end

    def check_user
      unless @reply.user == current_user || current_user.admin?
        redirect_to root_url, alert: "You are not authorized."
      end
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_reply
      @reply = Reply.find(params[:id])
    end

    def reply_params
      params.require(:reply).permit(:body)
    end
end
