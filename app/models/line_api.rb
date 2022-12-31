class LineApi

	def puts_dollar
		get_dollar_piece
	end

	def get_dollar_piece
		require 'net/http'

		base_url = "https://openexchangerates.org/api/"
		api_token = Rails.application.credentials.api[:open_exchange]
		url = "#{base_url}latest.json?app_id=#{api_token}"

		uri = URI("#{url}")
		res = Net::HTTP.get(uri)
		result = JSON.parse(res)

		result["rates"]["JPY"]
	end

end