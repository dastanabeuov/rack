#if not install gem rack: gem install rack
require 'rack'

app = Proc.new do |env|
	[
		200,
		{'COntent-Type' => 'text/plain'},
		["Welcome aboard!!!\n"]
	]
end

Rack::Handler::WEBrick.run app