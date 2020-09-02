class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    # mail(to: @user.email, subject: 'Deja de hacer filas! Bienvenido a Wait For It')
    mail(to: 'gsalinase91@gmail.com', subject: 'Deja de hacer filas! Bienvenido a Wait For It')
  end
end
