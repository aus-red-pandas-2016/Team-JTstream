require 'rails_helper'

describe FeedbacksController do
  let!(:mentor) { User.create!(name: "Jess", email: "bohn@goggle.com", password: "password", type: "Mentor") }
  let!(:student) { User.create!(name: "Kimberly", email: "kim@kim.com", password: "password", type: "Student") }
  let!(:feedback) { Feedback.create!(mentor_id: mentor.id, student_id: student.id, written_by: "student", content: "That session was awesome", rating: 4) }
  let!(:feedback2) { Feedback.create!(mentor_id: mentor.id, student_id: student.id, written_by: "mentor", content: "That session was awesome", rating: 4) }
  before(:each) do
    session[:id] = mentor.id
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "assigns a new feedback to @feedback" do
      get :new
      expect(assigns(:feedback)).to be_a_new Feedback
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are entered" do
      it "responds with status code of 302" do
        post :create, { feedback: {content: "That session was awesome", rating: 4 },  mentor_id: mentor.id, student_id: student.id, written_by: "mentor", appointment_id: 2 }
        expect(response).to have_http_status 302
      end

      it "creates a new feedback in the database" do
        expect{ post :create, { feedback: {content: "That session was awesome", rating: 4 },  mentor_id: mentor.id, student_id: student.id, written_by: "mentor", appointment_id: 2 } }.to change(Feedback,:count).by(1)
      end

      it "checks the current_user and sets them to the appropriate id type" do

      end

      it "assigns the newly created feedback as @feedback" do
        post :create, { feedback: {content: "That session was awesome", rating: 4 },  mentor_id: mentor.id, student_id: student.id, written_by: "mentor", appointment_id: 2 }
        expect(assigns(:feedback)).to eq Feedback.last
      end

      it "sets a notice that the feedback was successfully created/submitted" do
        post :create, { feedback: {content: "That session was awesome", rating: 4 },  mentor_id: mentor.id, student_id: student.id, written_by: "mentor", appointment_id: 2 }
        expect(flash[:notice]).to eq('Feedback successfully submitted!')
      end

      it "redirects to the homepage" do
        post :create, { feedback: {content: "That session was awesome", rating: 4 },  mentor_id: mentor.id, student_id: student.id, written_by: "mentor", appointment_id: 2 }
        expect(response).to redirect_to root_path
      end
    end

    context "when invalid params are entered" do
      it "responds with status code 200" do
        post :create, { feedback: { mentor_id: mentor.id, student_id: student.id, written_by: "mentor", rating: 2 } }
        expect(response).to have_http_status 200
      end

      it "does not create a new feedback in the database" do
        expect{ post :create, { feedback: { mentor_id: mentor.id, written_by: "mentor", rating: 2 } } }.to_not change(Feedback,:count)
      end

      it "assigns the unsaved feedback as @feedback" do
        post :create, { feedback: { mentor_id: mentor.id, student_id: student.id, written_by: "mentor", rating: 2 } }
        expect(assigns(:feedback)).to be_a_new Feedback
      end

      it "renders the :new template" do
        post :create, { feedback: { mentor_id: mentor.id, student_id: student.id, written_by: "mentor", rating: 2 } }
        expect(response).to render_template(:new)
      end

      it "has the errors on the page" do
        post :create, { feedback: { mentor_id: mentor.id, student_id: student.id, written_by: "mentor", rating: 2 } }
        expect(flash[:alert]).to eq("All fields must be filled out")
      end
    end
  end
end
