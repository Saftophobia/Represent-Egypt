namespace :db do
  desc "Fill database with an admin"
  task populate: :environment do
    admin = User.create!(
                 email: "admin@admin.com",
                 password: "adminadmin",
                 password_confirmation: "adminadmin")
    admin.toggle!(:admin)
  end
end