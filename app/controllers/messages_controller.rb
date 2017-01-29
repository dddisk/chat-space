class MessagesController < ApplicationController

  def index
    @groups = Group.order(created_at: :desc)
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = @group.messages
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      redirect_to group_messages_path, alert: "メッセージ送信に失敗しました"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end

end
