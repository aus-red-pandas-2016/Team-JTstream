require 'rails_helper'

describe "Feedback" do
  let!(:mentor) { User.create!(name: "Jess", email: "bohn@goggle.com", password: "password", type: "Mentor") }
  let!(:student) { User.create!(name: "Kimberly", email: "kim@kim.com", password: "password", type: "Student") }
  let!(:feedback) { Feedback.create!(mentor_id: mentor.id, student_id: student.id, written_by: "student", content: "That session was awesome", rating: 4) }
  let!(:feedback2) { Feedback.create!(mentor_id: mentor.id, student_id: student.id, written_by: "mentor", content: "That session was awesome", rating: 4) }

  it "has a student id" do
    expect(feedback.student_id).to eq student.id
  end

  it "has a mentor id" do
    expect(feedback.mentor_id).to eq mentor.id
  end

  it "has an appointment id"

  it "has content" do
    expect(feedback.content).to_not be nil
  end

  describe "written by" do
    it "was written by the student" do
      expect(feedback.written_by).to eq "student"
    end

    it "was written by the mentor" do
      expect(feedback2.written_by).to eq "mentor"
    end
  end

  it "has rating" do
    expect(feedback.rating).to_not be nil
  end

  it "has a rating of only 1-5" do
    expect(feedback.rating).to be_between(1, 5)
  end

end
