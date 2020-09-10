class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url  = 'wait-for-it.herokuapp.com/'
    mail(to: 'gsalinase91@gmail.com', subject: 'Deja de hacer filas! Bienvenido a Wait For It')
  end

  def is_time
    @url = 'wait-for-it.herokuapp.com/'
    mail(to: 'gsalinase91@gmail.com', subject: 'Te han llamado, Es tu turno')
  end
end
