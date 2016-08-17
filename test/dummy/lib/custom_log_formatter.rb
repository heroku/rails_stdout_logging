class CustomLogFormatter
  def call(severity, timestamp, progname, msg)
    "[CustomLogFormatter] [#{Process.pid}] [#{severity}] [#{timestamp}] #{msg}\n"
  end
end