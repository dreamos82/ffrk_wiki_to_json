require 'nokogiri'
require 'net/http'

class Parser
	def get_details(url)
		uri = URI.parse('https://ffrkstrategy.gamematome.jp' + url)
		httpreq =Net::HTTP.new(uri.host, uri.port)
		httpreq.use_ssl = true
		output = httpreq.get(uri.request_uri)
		document= Nokogiri::HTML(output.body)
		sbtable = document.at('#content_block_7')
		detailelement = Hash.new
		sbtable.search('tr').each do |tr|
			cells = tr.search('th, td')
			detailelement[cells[0].text.strip] = cells[1].text.strip
		end
		return detailelement
	end
	
	def parse
		raise NotImplementedError, 'You must implement the parse method'
	end
end
