require 'rails_helper'

describe MessagesController do

  let(:user){ create(:user) }
  let(:group){ create(:group) }
  let(:message){ create(:message) }
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

    it "assigns @group" do
      expect(assigns(:group)).to match(group)
    end

    it "assigns @groups" do
      expect(assigns(:groups)).to match(groups)
    end

    it "assigns @message" do
      expect(assigns(:message)).to match(message)
    end

  end


end




