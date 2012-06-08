# encoding: utf-8
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
  end
end

def make_users
  admin = User.create!(first_name: "first",
  					   last_name:  "last",
  					   nickname:   "阿勳", 
               email:    "example@railstutorial.org",
               password: "password",
               password_confirmation: "password",
  					   confirmed_at: Time.now)
  admin.add_role :admin
  99.times do |n|
    first_name  = Faker::Name.first_name
    last_name  = Faker::Name.last_name
    nickname = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(first_name: first_name,
    			       last_name: last_name,
                 email:    email,
                 password: password,
                 password_confirmation: password,
    			 confirmed_at: Time.now)
  end
end