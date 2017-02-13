class MessagesController < ApplicationController

  def index
    @groups = Group.order(created_at: :asc)
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = @group.messages.order("created_at asc")
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: "メッセージ送信に成功しました"}
        format.json { render json: {
          body: @message.body,
          name: @message.user.name,
          created_at: @message.created_at.strftime("%Y/%m/%d %H:%M:%S")
        }
      }
      end
    else
      redirect_to group_messages_path, alert: "メッセージ送信に失敗しました"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end

end
