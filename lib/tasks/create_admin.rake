namespace :db do
  desc "add admin"
  task :create_admin => :environment do


    User.create!(:email => "brianjoseff123@gmail.com",
                 :password => "09090909",
                 :admin => true)
  end
end