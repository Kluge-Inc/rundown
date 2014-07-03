json.array!(@postboxes) do |postbox|
  json.extract! postbox, :id, :email, :periodity
  json.url postbox_url(postbox, format: :json)
end
