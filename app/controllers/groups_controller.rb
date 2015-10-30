class GroupsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find params[:id]
    @posts = @group.posts
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new group_params
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group = current_user.groups.find params[:id]
  end

  def update
    @group = current_user.groups.find params[:id]

    if @group.update group_params
      redirect_to groups_path, notice: "modify group ok"
    else
      render :edit
    end
  end

  def destroy
    @group = current_user.groups.find params[:id]
    @group.destroy
    redirect_to groups_path, alert: "group deleted"
  end

  private
  def group_params
    params.require(:group).permit(:title, :description)
  end
end
