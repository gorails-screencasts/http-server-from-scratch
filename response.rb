class Response
  def initialize(code:, body: "", headers: {})
    @code = code
    @body = body
    @headers = headers
  end

  def send(client)
    client.print "HTTP/1.1 #{@code}\r\n"
    @headers.each do |name, value|
      client.print "#{name}: #{value}\r\n"
    end
    client.print "\r\n"
    client.print @body if @body.present?

    puts "-> #{@code}"
  end
end
