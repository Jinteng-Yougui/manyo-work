FactoryBot.define do
  factory :user do
    name { 'User1' }
    email { 'user1@gmail.com' }
    password { 'password1' }
    password_confirmation { 'password1' }
  end
  factory :admin_user, class: User do
    name { 'yuki@yuki.com' }
    email { 'yuki@yuki.com' }
    password { 'yuki@yuki.com' }
    password_confirmation { 'yuki@yuki.com'}
  end
end
