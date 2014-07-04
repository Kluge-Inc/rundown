class Leaflet < ActiveRecord::Base
  has_and_belongs_to_many :entries, :join_table => 'enties_in_leaflets', :class_name => 'FeedEntry'
  belongs_to :postbox

  # Orders itself from newest to oldest by default
  default_scope { order('created_at DESC') }

  # Sets default values on object init
  after_initialize :default_values

  # Has several statuses available
  enum status: [
    :populating,  # active leaflet open for new entries
    :pending,     # sending in progress
    :delivered    # leaflet successfuly delivered
  ]

  ##
  # Return all leaflets by parent postbox periodity
  #
  def self.with_periodity(periodity)
    joins(:postbox).where(postboxes: { periodity: Postbox.periodities[periodity] } )
  end


  private

  def default_values
    self.status ||= :populating
  end

end
