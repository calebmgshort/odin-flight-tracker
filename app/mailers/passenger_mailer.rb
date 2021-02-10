class PassengerMailer < ApplicationMailer
  default from: 'flightbooker@odin.com'

  def thank_you_email
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: 'Thank you for your booking')
  end

end
