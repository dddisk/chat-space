class MessagesController < ApplicationController

  def index
    @groups = Group.order(created_at: :asc)
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = @group.messages.includes(:user)
    respond_to do |format|
        format.html
        format.json {
          message_array = []
          @messages.each do |message|
            message_array << {
              body: message.body,
              name: message.user.name,
              image_url: message.image.url,
              created_at: message.created_at.strftime("%Y/%m/%d %H:%M:%S")
            }
          end
          render json: {
            message: message_array
          }
        }
    end
  end

  def create
    @message = Message.new(message_params)
    @message.body = '画像を送信しました。' if message_params[:image] && @message.body.empty?
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: "メッセージ送信に成功しました"}
        format.json { render json: {
          body: @message.body,
          name: @message.user.name,
          image: @message.image.url,
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
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

end
