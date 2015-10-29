class PostsController < ApplicationController
  def new
    @group = Group.find params[:group_id]
    @post = @group.posts.new
  end

  def create
    @group = Group.find params[:group_id]
    @post = @group.posts.new post_params   # <----- important!!!
    if @post.save
      redirect_to group_path(@group), notice: "Create post ok"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
