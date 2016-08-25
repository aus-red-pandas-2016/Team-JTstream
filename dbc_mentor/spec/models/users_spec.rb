require 'rails_helper'

describe "user model" do
  let(:user) { User.create!(name:"jay", email:"jay@gmail.com", password: "1234", type: "Student") }
  let(:saved_user) { User.find_by(name:"jay") }

  let(:user2) { User.create!(name:"jess", email:"jess@gmail.com", password: "1234", type: "Mentor") }
  let(:saved_user2) { User.find_by(name:"jess") }

  it "has a name" do
    expect(user.name).to eq saved_user.name
  end

  it "has an email" do
    expect(user.email).to eq saved_user.email
  end

  it "has a secure password" do
    expect(user.password).to_not eq saved_user.password
  end

  it "has a user type" do
    expect(user.type).to eq saved_user.type
  end

  it "can find a student user" do
    expect(User.find_by(type: "Student")).to eq saved_user
  end

  it "can find a mentor user" do
    expect(User.find_by(type: "Mentor")).to eq saved_user2
  end

end