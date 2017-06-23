FactoryGirl.define do
  factory :event do
    title        'test event'
    description  'test description'
    date_time    Time.now
    address      'Right here right now'
    user_id      1
  end
end