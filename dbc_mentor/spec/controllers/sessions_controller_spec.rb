require 'rails_helper'

describe SessionsController do
  let!(:user) {User.create(name: "tj", email: "test@test.com", user_type: "Mentor", password: "password")}

  context "when valid params are passed" do
    let :params do
        { :email => user.email, :password => user.password }
      end

    it "logs in the coorect user and sets a session" do
      post :create, params
      expect(response).to have_http_status 302
      expect(session[:user_id]).to eq(user.id)
      expect(flash[:notice]).to eq("Logged in!")
    end
  end

  context "when invalid params are passed" do
    let :params do
        { :email => "test@test.com", :password => "wrong" }
      end
    it "returns you to the login page" do
      post :create, params
      expect(session[:user_id]).to_not eq(user.id)
      expect(flash[:alert]).to eq("Invalid email or password")
    end
  end

  context "when you click the logout button" do
    it "logs you out and clears out the session" do

    end
  end

end
