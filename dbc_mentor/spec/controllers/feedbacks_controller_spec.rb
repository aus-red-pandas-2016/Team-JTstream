require 'rails_helper'

describe "Feedbacks Controller" do
  let!(:mentor) { User.create!(name: "Jess", email: "bohn@goggle.com", password: "password", type: "Mentor") }
  let!(:student) { User.create!(name: "Kimberly", email: "kim@kim.com", password: "password", type: "Student") }
  before(:each) do
    session[:id] = mentor.id
  end

end
