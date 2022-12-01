require "logger"

# color {{{2

# Method
# Type: NilClass < Object
# Returns: String
#
# Args:
# Argument: String
#
# Description:
# The search term gets wrapped by the color
#
def blue(term)
  "\e[34m#{term}\e[0m"
end

def red(term)
  "\e[31m#{term}\e[0m"
end

# }}}

# logger

module Logging
  def logger_output(choice_of_output)
    Logger.new(choice_of_output,
    level: Logger::INFO,
    progname: "Lyrics-App",
    datetime_format: "%Y-%m-%d %H:%M:%S",
    formatter: proc do |severity, datetime, progname, msg|
      "[#{blue(progname)}][#{datetime}], #{severity}: #{msg}\n"
    end
    )
  end
end
