require 'rails_helper'

RSpec.describe Email, type: :model do
  it { is_expected.to validate_presence_of :to }
  it { is_expected.to validate_presence_of :send_date_at }
  it { is_expected.to validate_presence_of :body }
end
