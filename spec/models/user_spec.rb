require "rails_helper"

describe "User" do
  describe "#create" do
    it "is invalid without a password" do
      user = User.new(email: "test1@gmail.com")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = User.new(password: 123)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # it "is invalid without a name" do
    #   user = User.new(email: "test1@gmail.com", password: 123)
    #   user.valid?
    #   expect(user.errors[:name]).to include("can't be blank")
    # end
  end
end
