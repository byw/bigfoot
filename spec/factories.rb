FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name.gsub('.', '-')}
    password 'password'
    password_confirmation 'password'
    email {Faker::Internet.email}
  end
end

