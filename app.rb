require_relative 'application/time_calculator'

class App

  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    response.set_header('Content-Type', 'text/plain')

    if request.path == "/time"
      time_response(request, response)
    else
      not_found_response(response)
    end

    response.finish
  end

  private
  
  def time_response(request, response)
    params = request.params

    unless params.key?('format')
      response.status = 400
      response.body = bad_query
      return
    end

    calculator = TimeCalculator.new(params['format'])

    if calculator.valid?
      response.status = 200
      response.body.push(calculator.formatted_time)
    else
      response.status = 400
      response.body.push(calculator.unknown_formats)
    end    
  end

  def bad_path
    ["Unknown path! Plz try correct path :-( \n"]
  end

  def bad_query
    ["Unknown request! Plz try correct request :-( \n"]
  end

  def not_found_response(response)
    response.status = 404
    response.body = bad_path
  end

end

=begin
class App

  def call(env)
    perform_request
    [status, headers, body]
  end

  private

  def perform_request
    sleep rand(2..3)
  end

  def status
    200
  end

  def headers
    {'Content-Type' => 'text/plain'}
  end

  def body
    ["Welcome aboard!\n"]
  end

end
=end