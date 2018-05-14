require "rails_helper"

RSpec.describe Chat, type: :model do
  describe "#create" do
    let(:chat){ build(:chat) }
    context "can save" do
      it "is valid with a message and corresponding user_id exists" do
        user = create(:user)
        chat.user_id = user.id
        expect(chat).to be_valid
      end
    end

    context "can not save" do
      it "is invalid without a user_id" do
        chat.valid?
        expect(chat.errors[:user_id]).to include("is blank. You need to fill it.")
      end

      it "is invalid without a existing user_id" do
        chat.user_id = 1
        chat.valid?
        expect(chat.errors[:user]).to include("must exist")
      end

      it "is invalid without a text" do
        user = create(:user)
        chat.user_id = user.id
        chat.text = nil
        chat.valid?
        expect(chat.errors[:text][0]).to include("is blank.")
      end
    end
  end
end
