require "rails_helper"

describe "User" do
  describe "#create" do
    it "is valid with a name, email, password, ps-confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "is invalid if not having uniqe email" do
      user = create(:user)
      user2 = build(:user)
      user2.valid?
      expect(user2.errors[:email]).to include("what the hell are you thinking? it already exists")
    end
    it "is invalid without a password" do
      user = build(:user, password: "", password_confirmation: "")
      user.valid?
      expect(user.errors[:password]).to include("what the fuck!!! You need to fill it")
    end
    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("what the fuck!!! You need to fill it")
    end
    it "is invalid if password doesn't match password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it "is invalid if password_length is short" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("too short")
    end
    it "is valid if password_length is over 6 characters" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
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
    #   user2 = build(:user, name: "abcd")
    #   user2.valid?
    #   expect(user.errors[:name]).to include("what the hell are you thinking? it already exists")
    # end
  end
end
