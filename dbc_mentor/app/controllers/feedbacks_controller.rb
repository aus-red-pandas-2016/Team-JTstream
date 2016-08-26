class FeedbacksController < ApplicationController

  def new

    @feedback = Feedback.new
    @stuff = params
  end

  def create
    fb_params = params[:feedback]
    @feedback = Feedback.new(mentor_id: params[:mentor_id], student_id: params[:student_id], written_by: params[:written_by], rating: fb_params[:rating], content: fb_params[:content], appointment_id: params[:appointment_id])
    if @feedback.save
      flash[:notice] = "Feedback successfully submitted!"
      redirect_to root_path
    else
      flash.now[:alert] = "All fields must be filled out"
      return render "new"
    end
  end

  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    redirect_to user_path(session[:id])
  end

end
