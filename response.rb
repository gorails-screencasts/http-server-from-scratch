class Response
  def initialize(code:, body: "")
    @code = code
    @body = body
  end

  def send(client)
    client.print "HTTP/1.1 #{@code}\r\n"
    client.print "Content-Type: text/html\r\n"
    client.print "Content-Length: #{@body.length}\r\n"
    client.print "\r\n"
    client.print @body if @body.present?

    puts "-> #{@code}"
  end
end
