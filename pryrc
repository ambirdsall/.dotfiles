Pry.prompt = [
  proc{|obj, nest_level, _|"\e[1;32m#{RUBY_VERSION}(\e[1;31m#{obj}\e[1;32m)>\e[m "},
  proc{|obj, nest_level, _|"\e[1;30m#{RUBY_VERSION}(\e[1;31m#{obj}\e[1;30m)\e[1;33m*\e[m "}
]
Pry.config.hooks.add_hook(:after_session, :say_goodbye) { puts "Goodbye!" }

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
