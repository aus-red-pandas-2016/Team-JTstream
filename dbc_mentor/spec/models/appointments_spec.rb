require 'rails_helper' 

describe 'appointment model' do 
  let(:mentor) {User.create!(name:'Tom', email:'tom@tom.tom', password:'tom', type:'Mentor')}
  let(:student) {User.create!(name:'Jay', email:'jay@jay.jay', password:'jay', type:'Student')}
  #let(:ap)
  it 'has a datetime'  do 
    expect
  end
end