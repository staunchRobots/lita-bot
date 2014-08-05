Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = ENV["STAUNCHBOT_NAME"]

  # The locale code for the language to use.
  config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :debug

  config.robot.alias = ENV["STAUNCHBOT_ALIAS"]
  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  config.robot.admins = ["50014_337877@chat.hipchat.com"]
  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  config.robot.adapter          = :hipchat
  config.adapter.debug          = false
  config.adapter.jid            = ENV['STAUNCHBOT_JID']
  config.adapter.password       = ENV['STAUNCHBOT_PASS']
  config.adapter.rooms          = [
    "50014_[sr]_general_staunchness@conf.hipchat.com",
    "50014_sr_-_off_topic@conf.hipchat.com",
    "50014_sr_-_bot_lab@conf.hipchat.com",
    "50014_alive_project@conf.hipchat.com"
    ]

  ## Example: Set options for the Redis connection.
  # config.redis.host = "127.0.0.1"
  # config.redis.port = 1234
  # Heroku:
  config.redis.url = ENV["REDISTOGO_URL"]
  config.http.port = ENV["PORT"]

  # Lita Forecast
  config.handlers.forecast.api_key         = ENV['STAUNCHBOT_FORECAST_APIKEY']
  config.handlers.hipchat_extensions.token = ENV['STAUNCHBOT_HIPCHAT_TOKEN']

  ## Example: Set configuration for any loaded handlers. See the handler's
  ## documentation for options.
  # config.handlers.some_handler.some_config_key = "value"
end
