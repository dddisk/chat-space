class GroupsController < ApplicationController
before_action :find_params, only: [:edit, :update]
  def index
    @groups = Group.order(created_at: :asc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      redirect_to new_group_path, alert: " グループ名を入力してください"
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'チャットグループが更新されました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def find_params
    @group = Group.find(params[:id])
  end

end
