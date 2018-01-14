namespace :emails do
  desc "Send emails scheduled to today using SendDailyEmailsJob"
  task send_todays_emails: :environment do
    puts "Queued today's emails job" if SendDailyEmailsJob.perform_later
  end
end
