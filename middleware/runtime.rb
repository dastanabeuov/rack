class Runtime

	def initialize(app)
		@app = app
	end

	def call(env)
		start = Time.now
		status, headers, body = @app.call(env)
		headers['DASTAN-Runtime'] = "%fs" % (Time.now - start)

		[status, headers, body]
	end

end