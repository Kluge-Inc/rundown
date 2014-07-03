namespace 'feeds:fetch' do

  desc "Fetch all feeds"
  task all: :environment do
    puts "[INFO] Currently storing #{FeedEntry.count} entries in total, fetching all feeds now"
    
    if Feed.fetch_all
      puts "[OK] Storing #{FeedEntry.count} entries after update"
    end
  end

end
