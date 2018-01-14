require 'rails_helper'

describe "rake emails:send_todays_emails", type: :task do
  it "preloads the Rails environment" do
    expect(task.prerequisites).to include "environment"
  end

  it "logs to stdout" do
    expect { task.execute }.to output("Queued today's emails job\n").to_stdout
  end
end
