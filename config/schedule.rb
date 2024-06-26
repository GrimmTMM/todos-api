set :output, '~/Projects/todos-api/log/cron_out.log'
env :path, '~/Projects/todos-api'

every 1.minutes do
  runner "CheckDeadlinesJob.perform_now"
end