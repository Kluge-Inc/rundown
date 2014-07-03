namespace 'leaflets:deliver' do
  desc "Deliver daily leaflets"
  task daily: :environment do
    deliver_with_periodity(:daily)
  end

  desc "Deliver leaflets scheduled three times a day"
  task three_times_a_day: :environment do
    deliver_with_periodity(:three_times_a_day)
  end

  desc "Deliver weekly leaflets"
  task weekly: :environment do
    deliver_with_periodity(:weekly)
  end
  
  
  private

  ##
  # Deliver all leaflets for specified periodity
  #
  # @param periodity [Symbol] leaflet periodity
  #
  def deliver_with_periodity(periodity)

    # Find suitable leaflets
    leaflets = Leaflet.with_periodity(periodity).populating
    
    puts "[INFO] no leaflets found, skipping" unless leaflets.any?

    leaflets.each do |leaflet|
      
      unless leaflet.entries.any?
        puts "[INFO] no entries found for leaflet #{leaflet.id} in postbox #{leaflet.postbox.id}, skipping"
        next 
      end

      puts "[INFO] leaflet #{leaflet.id} in postbox #{leaflet.postbox.id} scheduled for delivery"

      # Deliver leaflet through mailer
      if LeafletMailer.daily(leaflet).deliver 
        puts "[OK] leaflet delivered"
        leaflet.update(status: :delivered)
      else
        puts "[ERROR] delivery failed"
        
        # Move leaflet to sending queue
        leaflet.update(status: :sending)
      end
    end

  end

end
