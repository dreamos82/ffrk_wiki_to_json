require 'net/http'
require 'nokogiri'
require 'json'

$WIKI_PREFIX= 'https://ffrkstrategy.gamematome.jp'
def get_details(url)
	uri = URI.parse($WIKI_PREFIX + url)
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

def parse_table(sbtable)
end

uri = URI.parse('https://ffrkstrategy.gamematome.jp/game/951/wiki/Soul%20Break%20List_Default%20Soul%20Break')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
output = http.get(uri.request_uri)

document = Nokogiri::HTML(output.body)

sbtable = document.at('#content_block_5')

sbitems = []

sbtable.search('tr').each do |tr|
	cells = tr.search('th, td')
	elements = cells[1].child
	
	if(!elements.attribute('href').nil?)
		cur_item = get_details(elements.attribute('href'))
		cur_item["name"] = cells[1].text.strip
		cur_item["hero"] = cells[2].text.strip
		cur_item["realm"] = cells[3].text.strip
		sbitems.push(cur_item)
	end
end

json_output = JSON.pretty_generate(sbitems)

f = File.new('output.json', 'w')
f.write(json_output)
f.close
