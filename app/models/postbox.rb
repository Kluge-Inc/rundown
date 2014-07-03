class Postbox < ActiveRecord::Base

  # Relates to owning user
  belongs_to :user
  validates :user, presence: true

  # Contains many leaflets issued
  has_many :leaflets

  # Each postbox is subscribed to different feeds 
  has_many :subscriptions
  has_many :feeds, through: :subscriptions

  # Has different issue periodity
  enum periodity: [:daily, :three_times_a_day, :weekly]

  ##
  # Return owner of the postbox
  #
  def owner
    return self.user
  end

  ##
  # Find or create leaflet ready for population
  #
  # [todo] - test we have single leaflet active at any time
  def find_or_create_active_leaflet
    leaflet = self.leaflets.populating.first
    
    if leaflet.nil?
      return self.leaflets.create
    else
      return leaflet
    end
  end

end
