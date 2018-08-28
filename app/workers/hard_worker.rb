class HardWorker
  include Sidekiq::Worker

  def perform(email)
  	puts email
    UserNotifierMailer.send_friend_request_email(email).deliver
  end
end
