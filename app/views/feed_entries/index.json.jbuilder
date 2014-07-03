json.array!(@feed_entries) do |feed_entry|
  json.extract! feed_entry, :id, :feed_id, :title, :url, :published_at, :image_url, :summary, :original_id
  json.url feed_entry_url(feed_entry, format: :json)
end
