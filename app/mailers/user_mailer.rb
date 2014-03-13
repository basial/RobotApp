class UserMailer < ActionMailer::Base
  default from: "notifications@example.com"

  def welcome_mail(email_address)
    @email = email_address
    mail(to: email_address, subject: 'Hello')
  end

  def credits_mail(email_address, credits)
    @email = email_address
    @credits = credits
    mail(to: email_address, subject: 'New credits bitch')
  end
end
