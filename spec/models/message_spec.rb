require 'rails_helper'
describe Message do
  describe '#create' do
    it "can not save caught in validation" do
      message = build(:message, body: "")
      message.valid?
      expect(message.errors[:body]).to include("を入力してください。")
    end
    it "saved without caught in validation" do
      message = build(:message)
      message.valid?
      expect(message).to be_valid
    end
  end
end
