require 'nokogiri'
require 'net/http'

require_relative 'defaultparser'

class BurstParser < DefaultParser

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
		sbburstabilities = document.at('#content_block_12')
		burstabilitiesarray = []
		sbburstabilities.search('tr').each do |tr|
			cells = tr.search('td')
			if(cells.size == 3)
				burstabilityElement = {'name' => cells[1].text.strip, 'effect' => cells[2].text.strip}
				puts burstabilityElement['name']
				burstabilitiesarray.push(burstabilityElement)
			end
		end
		detailelement['burstabilities'] = burstabilitiesarray
		return detailelement
	end
end
