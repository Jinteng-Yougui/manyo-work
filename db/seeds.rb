# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  User.create(
  name: 'yuki@kondo.com',
  email: 'yuki@kondo.com',
  password: 'yuki@kondo.com',
  admin: 'true')

  15.times do |user|
    User.create!(
      name: "Dpro#{n+1}",
      email: "dpro#{n+1}@dpro.com",
      password: "Dpro#{n+1}"
  end

  priority_array = ["未着手","着手中", "完了"]
  importance_array = ["高", "中", "低"]
  15.times do |task|
    Task.create!(
      title: "Manyo#{n+1}",
      content: "step#{n+1}"
      deadline: "#{today+1}"
      priority: "shuffled_priority_array.pop"
      importance: "shuffled_importance_array.pop"
      label:
    )
  end

  15.times do |label|
    Label.create!(
      label_name: "#{課題+1}"
    )
  end