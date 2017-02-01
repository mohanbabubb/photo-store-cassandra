json.extract! itemdetail, :id, :itemattribute, :itemvalue, :created_at, :updated_at
json.url itemdetail_url(itemdetail, format: :json)