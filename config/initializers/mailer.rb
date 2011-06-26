ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
:enable_starttls_auto => true,
:address => 'smtp.gmail.com',
:port => 587,
:domain => "googlemail.com",
:user_name => 'dakuit00t@googlemail.com',
:password => 'hallo123',
:authentication => 'plain',
}
