require "socket"
require "active_support/all"
require_relative "request"
require_relative "response"

port = ENV.fetch("PORT", 2000).to_i
server = TCPServer.new port

puts "Listening on port #{port}..."

def render(path)
  full_path = File.join(__dir__, "views", path)
  if File.exists?(full_path)
    Response.new(code: 200, body: File.binread(full_path))
  else
    Response.new(code: 404)
  end
end

def route(request)
  if request.path == "/"
    render "index.html"
  else
    render request.path
  end
end

loop do
  Thread.start(server.accept) do |client|
    request = Request.new client.readpartial(2048)
    response = route(request)
    response.send(client)
    client.close
  end
end
