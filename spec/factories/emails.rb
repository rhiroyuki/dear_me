FactoryBot.define do
  factory :email do
    to "mail@mail.com"
    body "myString"
    send_date_at "2018-01-06"
  end
end
