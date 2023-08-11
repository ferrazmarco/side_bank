Devise.setup do |config|
  config.authentication_keys = [:document_number]

  require 'devise/orm/active_record'

  config.navigational_formats = [:json]
end
