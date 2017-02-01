require 'rails_helper'

describe MessagesController do

  let(:user){ create(:user) }
  let(:group){ create(:group) }

  before do
    sign_in user
  end

  after do
    sign_out user
  end

end




