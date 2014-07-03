class CreateFeedEntries < ActiveRecord::Migration
  def change
    create_table :feed_entries do |t|
      t.belongs_to :feed, index: true
      t.string :title
      t.string :url
      t.datetime :published_at
      t.string :image_url
      t.text :summary
      t.string :original_id

      t.timestamps
    end
  end
end
