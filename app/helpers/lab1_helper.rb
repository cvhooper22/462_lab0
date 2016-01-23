module Lab1Helper
	def retrieve_headers (request)
		 http_headers = request.env.select { |key, val| k.match("^HTTP.*")}
	end
end