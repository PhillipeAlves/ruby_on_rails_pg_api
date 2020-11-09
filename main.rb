require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?
require_relative 'db/database_config'
require_relative 'models/my_table'

# ===( REWIND )=== #

def json_body(request)
  body = OpenStruct.new(JSON.parse(request.body.read))
  request.body.rewind
  body
end

# -----( API )----- #

# ===( CREATE )=== #

post '/api/data' do
  data = My_table.new
  data.content = json_body(request).content
  data.save
  status 201
  json({ status: 201, message: 'Data created successfully.' })
end

# ===( READ )=== #

get '/api/data' do
  data = My_table.all
  json({ status: 200, data: data })
end

# ===( UPDATE )=== #

patch '/api/data' do
  body = json_body(request)
  id = body.id
  data = My_table.find(id)
  data.content = body.content
  data.save
  json({ status: 200, message: "Data updated successfully.", id: id })
end

# ===( DELETE )=== #

delete '/api/data' do
  id = json_body(request).id
  data = My_table.find(id)
  data.delete
  json({ status: 200, message: "Data deleted successfully.", id: id })
end

