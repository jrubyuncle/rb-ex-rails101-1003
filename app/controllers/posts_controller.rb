class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group

  def new
    @post = @group.posts.new
  end

  def create
    @post = @group.posts.new post_params   # <----- important!!!
    if @post.save
      redirect_to group_path(@group), notice: "Create post ok"
    else
      render :new
    end
  end

  def edit
    @post = @group.posts.find params[:id]
  end

  def update
    @post = @group.posts.find params[:id]

    if @post.update post_params
      redirect_to group_path(@group), notice: "post modified ok"
    else
      render :edit
    end
  end

  def destroy
    @post = @group.posts.find params[:id]

    @post.destroy
    redirect_to group_path(@group), alert: "post deleted"
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def find_group
    @group = Group.find params[:group_id]
  end
end
