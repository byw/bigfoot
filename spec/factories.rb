FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name.gsub('.', '-')}
    password 'password'
    password_confirmation 'password'
    email {Faker::Internet.email}
  end

  factory :category do
    name {Faker::Lorem.words.join(" ")}
  end

  factory :topic do
    title {Faker::Lorem.sentence}
    body {Faker::Lorem.paragraph}
    user
    category
  end

  factory :comment do
    body {Faker::Lorem.paragraph}
    topic
    user
  end
end

