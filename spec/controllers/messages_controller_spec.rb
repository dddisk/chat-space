require 'rails_helper'

describe MessagesController do

  let(:user){ create(:user) }
  let(:group){ create(:group) }
  let(:message){ build(:message) }
  let(:groups)   { create_list(:group, 5, user_ids: user.id) }
  let(:messages) { create_list(:message, 5, user_id: user.id, group_id: group.id) }

  before do
    sign_in user
  end

  after do
    sign_out user
  end

  describe 'GET #index' do
    before do
      get :index , group_id: group.id
    end

    it "renders the index template" do
      expect(response).to render_template :index
    end

  end

  describe 'Post #create' do
    context 'success to save' do
      it "save success" do
        expect {
          post :create, group_id: group.id, message: attributes_for(:message)
        }.to change(Message, :count).by(1)
      end

      it "redirect to :index" do
        post :create, group_id: group.id, message: attributes_for(:message)
        expect(response).to redirect_to group_messages_path
        expect(flash[:notice]).not_to be_empty
      end
    end
    context 'fail to save' do
      it "can not save in the database" do
        expect{
        post :create, group_id: group.id, message: attributes_for(:message, body: nil)
        }.not_to change(Message, :count)
      end

      it "redirects to messages#index" do
        post :create, group_id: group.id, message: attributes_for(:message, body: nil)
        expect(response).to redirect_to group_messages_path
      end
    end
  end
end




