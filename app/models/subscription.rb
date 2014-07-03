class Subscription < ActiveRecord::Base
  belongs_to :postbox
  belongs_to :feed
end
