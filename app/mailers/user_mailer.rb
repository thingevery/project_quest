class UserMailer < ActionMailer::Base
  #default from: "projectquest@pqmfg.com"
  default from: "projectquestapp@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    #@greeting = "Hi"
    @user = user
    #mail to: user.email, subject: "Password Reset"
    mail to: user.email, subject: 'Welcome to Project Quest!'
  end

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/Login'
    email_with_name = "#{@user.username} <#{@user.email}>"
    #mail(to: @user.email, subject: 'Welcome to Project Quest!')
    mail to: email_with_name, subject: 'Welcome to Project Quest!'
         
         # To change the default mailer view for the action, 
         # pass the following:
         #template_path: 'notifications', template_name: 'another'
         # This will cause it to look in 'app/views/notifications'
         # for a view called 'another'.
         # Note: you can also pass an array of paths to 'template_path'
         # and they will be searched in order.
  end 

end
