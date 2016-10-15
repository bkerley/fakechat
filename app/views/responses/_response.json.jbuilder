json.extract! response, :id, :body, :created_at, :updated_at
json.url response_url(response, format: :json)