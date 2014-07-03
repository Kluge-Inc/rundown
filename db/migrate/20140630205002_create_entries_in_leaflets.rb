class CreateEntriesInLeaflets < ActiveRecord::Migration
  def change
    create_table :enties_in_leaflets, id: false do |t|
      t.belongs_to :feed_entry
      t.belongs_to :leaflet
    end
  end
end
