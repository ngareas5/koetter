class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.sendMail.subject
  #
  def sendMail(user)
  	@user=user
    @greeting = "Hi #{@user.username} your reset password token is #{@user.reset_password_token}"
    mail to: @user.email
  end
end
