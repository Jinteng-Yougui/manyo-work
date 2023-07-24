FactoryBot.define do
  factory :user do
    name { 'iseki@dic.xom' }
    email { 'iseki@dic.xom' }
    password { 'iseki@dic.xom' }
    password_confirmation { 'iseki@dic.xom'}
    admin { 'false' }
  end
  factory :admin_user, class: User do
    name { 'yuki@yuki.com' }
    email { 'yuki@yuki.com' }
    password { 'yuki@yuki.com' }
    password_confirmation { 'yuki@yuki.com' }
    admin { 'true' }
  end
end
