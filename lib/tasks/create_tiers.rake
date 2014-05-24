
namespace :db do
  desc "create tiers"
  task :create_tiers => :environment do

    Tier.delete_all

    #tiers
    Tier.create!(:name => "Clown", :price => 1500, :description => "Access to Exclusive content hosted on website",:code =>"dingleberry", :id => 1)
    Tier.create!(:name => "Acrobat", :price => 2500, :description => "Access to Private polls + Exclusive content hosted on website",:code =>"chargingrhino", :id => 2)
    Tier.create!(:name => "Fire Dancer", :price => 7500, :description => "Access to Live Q&A’s + Private Polls + Exclusive content",:code =>"poopslinger",:id => 3)
  end
end