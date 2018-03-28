FactoryBot.define do
  factory :email do
    to "mail@mail.com"
    body "myString"
    send_date_at "2018-01-06"

    trait :confirmed do
      confirmed_at Time.current
    end
  end
end
