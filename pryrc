Pry.config.prompt_name = RUBY_VERSION

Pry.config.hooks.add_hook(:after_session, :say_goodbye) { puts "\nGoodbye!" }

def bye
  exit
end

def discreetly
  if defined?(Rails) && Rails.env
    old_level = ActiveRecord::Base.logger.level
    ActiveRecord::Base.logger.level = 1

    yield

    ActiveRecord::Base.logger.level = old_level
  end
end
