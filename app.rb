require_relative 'application/time_calculator'

class App

  TIME_PATH = "/time"
  FORMAT_QUERY_BEGIN = "format"

  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    response.set_header('Content-Type', 'text/plain')

    if request.path == TIME_PATH
      time_response(request, response)
    else
      not_found_response(response)
    end

    response.finish
  end

  private
  
  def time_response(request, response)
    params = request.params

    unless has_format_params?(params)
      response.status = 400
      response.body = bad_query
      return
    end

    calculator = TimeCalculator.new(params['format'])
    response.body.push(calculator.form_time_string)

    response.body[0][0..6] == "Unknown" ? response.status = 200 : response.status = 400
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

  def has_format_params?(params)
    params.keys.include?(FORMAT_QUERY_BEGIN) && params['format']
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