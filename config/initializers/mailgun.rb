ActionMailer::Base.smtp_settings = {
  address:              'smtp.mailgun.org',
  port:                 587,
  domain:               ENV['MAILGUN_DOMAIN'],
  user_name:            ENV['MAILGUN_USERNAME'],
  password:             ENV['MAILGUN_USERNAME'],
  authentication:       :plain,
  enable_starttls_auto: true
}

