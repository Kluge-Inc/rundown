class LeafletMailer < ActionMailer::Base
  default from: "rundown@example.com"

  def daily(leaflet)
    @leaflet = leaflet
    @postbox = leaflet.postbox
    
    mail(to: @postbox.email, subject: 'Rundown daily')
  end

end
