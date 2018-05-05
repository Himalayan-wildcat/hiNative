require "rails_helper"

RSpec.describe User, type: :model do
  describe "#create" do
    let(:user){ create(:user) }
    context "can save" do
      it "is valid with email, password, name, password_confirmation" do
        expect(user).to be_valid
      end

      it "is valid if password_length is equal to 6 characters" do
        user.password = Faker::Internet.password(6, 6)
        user.password_confirmation = user.password
        expect(user).to be_valid
      end

      it "is valid if password_length is equal to 7 characters" do
        user.password = Faker::Internet.password(7, 7)
        user.password_confirmation = user.password
        expect(user).to be_valid
      end

      it "is valid if name_length is equal to 12" do
        user.name = Faker::Internet.user_name(12..12)
        expect(user).to be_valid
      end

      it "is valid if name_length is equal to 11" do
        user.name = Faker::Internet.user_name(11..11)
        expect(user).to be_valid
      end

    end
    context "cannot save" do
      it "is invalid if not having uniqe email" do
        another_user = build(:user , email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("already exists. Watch out!!")
      end

      it "is invalid without a password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("is blank. You need to fill it.")
      end

      it "is invalid without a email" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("is blank. You need to fill it.")
      end

      it "is invalid if password doesn't match password_confirmation" do
        user.password_confirmation = Faker::Internet.password(6)
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "is invalid if password_length is equal to 5" do
        user.password = Faker::Internet.password(1, 5)
        user.password_confirmation = user.password
        user.valid?
        expect(user.errors[:password][0]).to include("too short")
      end

      it "is invalid without a name" do
        user.name = nil
        user.valid?
        expect(user.errors[:name]).to include("is blank. You need to fill it.")
      end

      it "is invalid if name_length is equal to 13" do
        user.name = Faker::Internet.user_name(13..13)
        user.valid?
        expect(user.errors[:name][0]).to include("too long")
      end

      it "is invalid if name_length is not unique" do
        another_user = build(:user)
        another_user = build(:user, name: user.name)
        another_user.valid?
        expect(another_user.errors[:name]).to include("already exists. Watch out!!")
      end

    end
  end
end
