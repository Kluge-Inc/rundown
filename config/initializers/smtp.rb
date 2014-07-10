# Load SMTP credentials
MAIL_CONFIG = YAML.load_file(Rails.root.join("config/smtp_credentials.yml"))[Rails.env]

# Sent delivery method to :smtp, :sendmail or :test
Rundown::Application.configure do
  config.action_mailer.delivery_method = Rails.env.production? ? :smtp : :file
  config.action_mailer.file_settings = { location: Rails.root.join('tmp/mails') }
  config.action_mailer.smtp_settings = {
    address:              '<server_address>',
    port:                 587,
    domain:               '<domain>',
    user_name:            MAIL_CONFIG['smtp_username'],
    password:             MAIL_CONFIG['smtp_password'],
    enable_starttls_auto: true
  }
end