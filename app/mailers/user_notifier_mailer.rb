class UserNotifierMailer < ApplicationMailer
	default :from => 'kiranlhugar@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_friend_request_email(email)
    @email = email
    # render plain: @user.inspect
    mail( :to => @email,
    :subject => 'Friends Request' )
  end
end
