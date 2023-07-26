# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  # User.create(
  # name: 'yuki@kondo.com',
  # email: 'yuki@kondo.com',
  # password: 'yuki@kondo.com',
  # admin: 'true')

  15.times do |user|
    User.create!(
      name: "Dpro#{user+1}",
      email: "dpro#{user+1}@dpro.com",
      password: "Dpro#{user+1}"
    )
  end

  15.times do |label|
    Label.create!(
      label_name: "#{label+1}"
    )
  end
    
  priority_array = ["未着手", "着手中", "完了"]
  importance_array = ["高", "中", "低"]
  15.times do |task|
    Task.create!(
      user_id: 1,
      title: "Manyo#{task+1}",
      content: "step#{task+1}",
      deadline: "8/1/2023",
      priority: priority_array.pop,
      importance: 1
    )
  end
