require 'rails_helper' 

describe AppointmentsController do 
  let(:mentor) {User.create!(name:'Tom', email:'tom@tom.tom', password:'tom', type:'Student')}
  let(:student) {User.create!(name:'Jay', email:'jay@jay.jay', password:'jay', type:'Student')}
  let(:time) {DateTime.now}
  let(:appointment) { Appointment.create!(user_id: mentor.id, datetime: time, student_id: student.id, mentor_id: mentor.id) }

  describe "GET #new" do 
    it 'responds with status code 200' do 
      get :new, {user_id: student.id}
      expect(response).to have_http_status 200
    end
  end

  describe "POST #create" do 
    context "when valid params are passed in" do
      it "responds with status code 302" do
        post :create, { user_id: 1, date: "8-26-2016", time: '900' }, id: 1
        
        expect(response).to have_http_status 302
      end

      it "creates a new game in the database" do
        mentor
        expect {post(:create, { user_id: 1, date: "8-26-2016", time: '900' }, id: 1)}.to change(Appointment, :count).by(1)
      end

    end
  end

end