class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = 'チャットグループが作成されました。'
      redirect_to :root
    else
      flash[:alert] = "グループ名を入力してください。"
      redirect_to new_group_path
    end
  end

  def edit
  end

  def update
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
