require 'rails_helper'

describe SessionsController do
  let!(:user) {User.create(name: "tj", email: "test@test.com", type: "Mentor", password: "password")}

  context "when valid params are passed" do
    let :params do
        { :email => user.email, :password => user.password }
      end

    it "logs in the correct user and sets a session" do
      post :create, params
      expect(response).to have_http_status 302
      expect(session[:id]).to eq(user.id)
      expect(flash[:notice]).to eq("Logged in!")
    end
  end

  context "when invalid params are passed" do
    let :params do
        { :email => "test@test.com", :password => "wrong" }
      end
    it "returns you to the login page" do
      post :create, params
      expect(session[:id]).to_not eq(user.id)
      expect(flash[:alert]).to eq("Invalid email or password")
      expect(response).to render_template("sessions/new", "layouts/application")
    end
  end


    it "logs you out and clears out the session" do
      post :destroy
      expect(session[:id]).to eq nil
      expect(flash[:notice]).to eq("Logged out!")
      expect(response).to redirect_to show_appointments_path
    end
end
