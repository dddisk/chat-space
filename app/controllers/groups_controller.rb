class GroupsController < ApplicationController
  def index
  end
  
  def new
    @group = Group.new
  end

  def create
    Group.create(group_params)
    redirect_to controller: :messages, action: :index
  end

  def edit
  end

  def update
  end

  private
  def group_params
    params.require(:group).permit(:name, { :user_ids => []})
  end
end
