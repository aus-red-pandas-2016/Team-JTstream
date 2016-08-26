class UserMailer < ApplicationMailer
  default from: 'dbcmentor@noreply.com'

  def new_appt_email(email)
    # @user = user
    @url  = 'http://example.com/login'
    mail(to: email, subject: 'DBC Mentor: New Scheduled Appointment')
  end
end
