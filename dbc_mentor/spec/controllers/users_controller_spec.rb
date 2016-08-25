require 'rails_helper'

describe UsersController do
  let!(:user) { User.create!(name: "Jess Bohn", email: "bohn@goggle.com", password_digest: "lamblamb", type: "Mentor")}

  describe "GET #new" do
    it "responds with status code 200" do
      get:new
      expect(response).to have_http_status 200
    end

    it "assigns a new user to @user" do
      get:new
      expect(assigns(:user)).to be_a_new User
    end

    it "renders the :new template" do
      get:new
      expect(response).to render_template(:new)
    end
  end
end
