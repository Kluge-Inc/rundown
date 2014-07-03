class FeedEntry < ActiveRecord::Base
  belongs_to :feed
  has_and_belongs_to_many :leaflets, :join_table => "enties_in_leaflets"

  # Distribute new records after creation
  after_create :distribute_to_feed_postboxes

  # Orders itself from newest to oldest by default
  default_scope { order('published_at DESC') }

  ##
  # Enhance entry content through additional readability parsing
  #
  def enhance
    require 'open-uri'

    source = open(self.url).read
    return Readability::Document.new(source).content
  end

  ##
  # Distribute entry for all users subscribed to entries' feed
  #
  def distribute_to_feed_postboxes
    self.feed.postboxes.each do |postbox|
      self.distribute_to(postbox)
    end
  end

  ##
  # Distribute entry to the pending leaflet for specified user
  #
  def distribute_to(postbox)
    leaflet = postbox.find_or_create_active_leaflet
    leaflet.entries << self unless leaflet.entries.exists? self
  end

end
