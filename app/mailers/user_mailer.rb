class UserMailer < ActionMailer::Base
  default :from => "from@example.com"
  def user_link(user)
    @user = user
    mail(:to => @user.email)
  end
  def send_password_reset_mail(user)
    @user = user
    mail(:to=> user.email, :subject=> 'Password Reset')
  end 
 
end
