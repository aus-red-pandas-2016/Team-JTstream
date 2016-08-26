class AppointmentsController < ApplicationController
  def new
  end

  def create
    date_format = params[:date].split("-").rotate(2).map{|num| num.to_i}
    time_format_array = params[:time].split("")

    if time_format_array.length == 3
      time_format = [(time_format_array.delete_at(-1) + time_format_array.delete_at(-1)).to_i * 10, time_format_array[0].to_i].reverse
    elsif time_format_array.length == 4
      time_format = [(time_format_array.delete_at(-1) + time_format_array.delete_at(-1)).to_i * 10, (time_format_array[0]+time_format_array[1]).to_i].reverse
    end

    date = DateTime.new(date_format[0], date_format[1], date_format[2], time_format[0], time_format[1])
    @appointment = Appointment.create(user_id: session[:id], datetime: date)
    @appointment.active = true
    @appointment.save
    redirect_to show_appointments_path
  end

  def index
    @appointments = Appointment.where(active: true)
    @dates = @appointments.map{|appointment| appointment.datetime.to_date}.uniq.sort
  end

  def show
    @appointment = Appointment.find(params[:id])
    @mentor = User.find(params[:user_id])
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @mentor = @appointment.user

  end

  def update
    binding.pry
    @appointment = Appointment.find(params[:id])
    @appointment.context = params[:context]
    @appointment.student_id = session[:id]
    if params[:cancel]
      @appointment.student_id = nil
      @appointment.active = true
    else
      @appointment.active = false
    end
    @appointment.save
    redirect_to show_appointments_path

  end

  def destroy

    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to user_path(session[:id])

  end

end
