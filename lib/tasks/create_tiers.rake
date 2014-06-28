
namespace :db do
  desc "create tiers"
  task :create_tiers => :environment do

    Tier.delete_all

    #tiers
    Tier.create!(:name => "Clown", :price => 1500, :description => "Access to Exclusive content hosted on website",:code =>"dingleberry", :id => 1, :emails => "sylandkim@inbox.com
    bkdavey@comcast.net
    catherine.elizabeth713@gmail.com
    kellyperron@gmail.com
    hannegaukel@gmail.com
    patriciawilliams@live.ca
    greenwta@gmail.com
    crswant@gmail.com
    jacob.liversedge@gmail.com
    stevesundelius@aol.com
    dangalerosen@gmail.com
    tgmeis@comcast.net
    clwhiteside94061@yahoo.com
    robin.alnas@hotmail.com
    ertaylor85@gmail.com
    lmcgee28@hotmail.com
    kon252002@yahoo.com
    sharoncheaney@yahoo.com
    bianca.pastrana@gmail.com
    kimberlylowes@gmail.com
    kthitchcock@hotmail.com
    rhu11@lawrenceville.org")
    Tier.create!(:name => "Acrobat", :price => 2500, :description => "Access to Private polls + Exclusive content hosted on website",:code =>"chargingrhino", :id => 2, :emails => "bedward@ryerson.ca
    charlie.volanakis@gmail.com
    nmedamk@aol.com
    mary.morley@nissan-usa.com
    tbates05@gmail.com
    allison.m.wilkins@gmail.com
    aneesalake@gmail.com
    ebyrd19@gmail.com
    moulec@gmail.com
    Andrea@asi-usa.com
    smheisel@gmail.com
    ams@houlding.com
    rustyrae@hotmail.com
    jessie.alexander.337@gmail.com
    ckolt12@gmail.com
    lisa_engel1967@hotmail.com
    BrianneMcMillan@hotmail.com
    cassidiporter@aol.com
    dahkemp@yahoo.com
    lauraciaccio@me.com
    goatboys@aol.com
    hannahtammen@gmail.com
    caro.west@hotmail.com
    sawrigh@gmail.com
    rachelmwiley@gmail.com
    jolaine7@hotmail.com
    jamie.lee.reardin@gmail.com
    tammypaulsen@hotmail.com
    lizzybels66@aol.com
    c.fabiano26@gmail.com
    acmazzaro@gmail.com
    gwenbakesthecake@comcast.net
    cmn002@aquinas.edu
    Zachzamolsky@hotmail.com
    celinaruff@hotmail.com
    melanietutino@gmail.com
    dsapp002@cfl.rr.com
    juliannaschiller@gmail.com
    finneykj@yahoo.ca
    RobertEthanHahn@gmail.com
    Jason_Rasmussen@hotmail.com
    alex.jeffries@gmail.com
    adam@dmatthews.com
    scherzfam@comcast.net
    alemahieu12@yahoo.com
    lscribbly@gmail.com
    tdgreen011@aol.com
    843847a8@opayq.com
    klbenning08@gmail.com
    hsiangyee@gmail.com
    vladtheimpaler1399@gmail.com
    bragorbc@yahoo.com
    brendan.parets@gmail.com")
    Tier.create!(:name => "Fire Dancer", :price => 7500, :description => "Access to Live Q&A’s + Private Polls + Exclusive content",:code =>"poopslinger",:id => 3, :emails => "megchem@gmail.com
    letsgetfunky_99@hotmail.com
    mike@truepublicrelations.com
    goofygal1171@msn.com
    annehein@msn.com
    bfreberg@aol.com
    shfrancis@aol.com
    Leomalovegrove@gmail.com
    kdfolks@att.net
    k.matthews@mindspring.com
    kfreberg@freberglaw.com
    sven187@yahoo.com
    lnormand@gmail.com
    lostmypooh@hotmail.com
    aparets@guidepostcapital.com
    Cocopelli4@aol.com
    thanatos101b@gmail.com
    jenni.powell@gmail.com
    komlor@flash.net
    heartis24k@icloud.com
    gerardgonzo@yahoo.com
    akbucci@yahoo.com")
    Tier.create!(:name => "Strong Man", :price => 25000, :description => "Access to Live Q&A’s + Private Polls + Exclusive content + 10 min call",:code =>"bobsyouruncle",:id => 4, :emails => "samanthaapfel@gmail.com
    dan.i.sinensky@gmail.com")
    Tier.create!(:name => "Lion Tamer", :price => 50000, :description => "Access to Live Q&A’s + Private Polls + Exclusive content + 10 min call + exec decision",:code =>"thisissparta",:id => 5,  :emails => "mfreberg@brasfieldgorrie.com")
    
  end
end