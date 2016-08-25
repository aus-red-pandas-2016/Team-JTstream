require 'rails_helper' 

describe 'appointment model' do 
  let(:mentor) {User.create!(name:'Tom', email:'tom@tom.tom', password:'tom', type:'Student')}
  let(:student) {User.create!(name:'Jay', email:'jay@jay.jay', password:'jay', type:'Student')}
  let(:time) {DateTime.now}
  
  let(:appointment) { 

    Appointment.create!(user_id: mentor.id, datetime: time, student_id: student.id, mentor_id: mentor.id) }
  
  it 'has a datetime'  do 
    expect(appointment.datetime).to eq(time)
  end

  it 'has a user_id' do 
    expect(appointment.user_id).to eq(mentor.id)
  end

  it 'has a mentor_id' do 
    expect(appointment.mentor_id).to eq(mentor.id)
  end

  it 'has a student_id' do 
    expect(appointment.student_id).to eq(student.id)
  end
end