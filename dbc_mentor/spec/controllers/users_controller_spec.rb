require 'rails_helper'

describe UsersController do
  let!(:user) { User.create!(name: "Jess Bohn", email: "bohn@goggle.com", password_digest: "lamblamb", type: "Mentor")}

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create, { student: { name: "Tom Ho", email: "tom@tom.com", password: "password", type: "Student"} }
        expect(response).to have_http_status 302
      end

      it "creates a new user in the database" do
        expect{ post :create, { student: { name: "Tom Ho", email: "tom@tom.com", password: "password", type: "Student"} } }.to change(User,:count).by(1)
      end

      it "assigns the newly created student as @student" do
        post :create, { student: { name: "Tom Ho", email: "tom@tom.com", password: "password", type: "Student"} }
        expect(assigns(:student)).to eq(User.last)
      end

      it "sets a notice that the user was successfully created" do
        post :create, { student: { name: "Tom Ho", email: "tom@tom.com", password: "password", type: "Student"} }
        expect(flash[:notice]).to eq('User was successfully created.')
      end

      it "logins the new registered user" do
        post :create, { student: { name: "Tom Ho", email: "tom@tom.com", password: "password", type: "Student"} }
        expect(session[:user]).to eq student
      end

      it "redirects to the home page" do
        post :create, { student: { name: "Tom Ho", email: "tom@tom.com", password: "password", type: "Student"} }
        expect(response).to redirect_to "users/index"
      end
    end

    context "when invalid params are passed" do
      it "responds with status code 200" do
        post :create, { user: { name: "Tom", password: "password"} }
        expect(response).to have_http_status 200
      end

      it "does not create a new user in the database" do
        expect{ post :create, { student: { name: "Tom Ho", email: "tom@tom.com", password: "password", type: "Magician"} } }.to_not change(User,:count)
      end

      it "assigns the unsaved user as @user" do
        post :create, { user: { name: "Tom", password: "password"} }
        expect(assigns(:user)).to be_a_new User
      end

      it "renders the :new template" do
        post :create, { user: { name: "Tom", password: "password"} }
        expect(response).to render_template(:new)
      end
    end
  end
end
