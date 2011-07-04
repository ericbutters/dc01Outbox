class UserMailer < ActionMailer::Base
  
 ActionMailer::Base.delivery_method = :smtp
 ActionMailer::Base.perform_deliveries = true
 ActionMailer::Base.raise_delivery_errors = true
 ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => 'smtp.gmail.com',
  :port => 587,
  :domain => "googlemail.com",
  :user_name => 'yourname@googlemail.com',
  :password => 'yourpasswd',
  :authentication => 'plain',
 }
 default :from => 'yourname@googlemail.com',
         :return_path => 'yourname@googlemail.com'

  def sendme(to,subject,message)
    mail(:to => to,
         :subject => subject,
         :body => message)
  end
end

