class Feed < ActiveRecord::Base
  # Contains many entries
  has_many :entries, class_name: 'FeedEntry', dependent: :destroy

  # Can be subscribed to by users 
  has_many :subscriptions
  has_many :postboxes, through: :subscriptions

  # Fetch latest entries after feed creation
  after_create :fetch

  ##
  # Get new entries from feed URL, create entries
  #
  # [todo] - integrate Feedjira update method to parse faster
  def fetch
    feed = Feedjira::Feed.fetch_and_parse(self.url)
    
    self.update!(title: feed.title) if self.title.nil?

    feed.entries.each do |entry|
      unless self.entries.exists? :original_id => entry.id
        self.entries.create!(
          :title         => entry.title,
          :summary      => entry.summary,
          :url          => entry.url,
          :published_at => entry.published,
          :original_id  => entry.id
        )
      end
    end
  end

  ##
  # Update all existing feeds
  #
  # [todo] - send owning user as a param
  #
  def self.fetch_all
    Feed.all.each do |feed|
      feed.fetch
    end
  end

  ##
  # Return feed subscribers
  #
  def subscribers 
    return self.postboxes
  end 

end
