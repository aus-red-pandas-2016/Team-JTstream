class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    fb_params = params[:feedback]
    @feedback = Feedback.new(mentor_id: fb_params[:mentor_id], student_id: fb_params[:student_id], written_by: fb_params[:written_by], rating: fb_params[:rating], content: fb_params[:content])
    if @feedback.save
      flash[:notice] = "Feedback successfully submitted!"
      redirect_to root_path
    else
      flash.now[:alert] = "All fields must be filled out"
      return render "new"
    end
  end

end
