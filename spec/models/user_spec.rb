require "rails_helper"

describe "User" do
  describe "#create" do
    let(:user){ create(:user) }
    context "can save" do
      it "is valid with email, password, name, password_confirmation" do
        expect(user).to be_valid
      end
      it "is valid if password_length is qual to 6 characters" do
        user = build(:user, password: "000000", password_confirmation: "000000")
        expect(user).to be_valid
      end
      it "is valid if password_length is over 6 characters" do
        user = build(:user, password: "0000000", password_confirmation: "0000000")
        expect(user).to be_valid
      end
    end
    context "cannot save" do
      it "is invalid if not having uniqe email" do
        another_user = build(:user , email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("Watch out!! it already exists")
      end
      it "is invalid without a password" do
        user.password = ""
        user.password_confirmation = ""
        user.valid?
        expect(user.errors[:password]).to include("You need to fill it")
      end
      it "is invalid without a email" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("You need to fill it")
      end
      it "is invalid if password doesn't match password_confirmation" do
        user.password_confirmation = Faker::Internet.password(6)
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      it "is invalid if password_length is short" do
        user.password = Faker::Internet.password(0, 5)
        user.password_confirmation = user.password
        user.valid?
        expect(user.errors[:password][0]).to include("too short")
      end


      # nameカラムはまだ出来ていないため、仮
      # it "is invalid without a name" do
      #   user = User.new(email: "test1@gmail.com", password: 123)
      #   user.valid?
      #   expect(user.errors[:name]).to include("can't be blank")
      # end

      # it "is invalid if name_length is over 13" do
      #   user = User.new(name: "abcdefghijlk")
      #   user.valid?
      #   expect(user.errors[:name][0]).to include("too long")
      # end
      # it "is invalid if name_length is not unique" do
      #   user = User.create(name: "abcd")
      #   another_user = build(:user, name: "abcd")
      #   another_user.valid?
      #   expect(another_user.errors[:name]).to include("what the hell are you thinking? it already exists")
      # end
    end
  end
end
