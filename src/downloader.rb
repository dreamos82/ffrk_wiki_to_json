require 'net/http'
require 'nokogiri'
require 'json'
require 'optparse'

require_relative 'sb_options'

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
	return sbitems
end

def save_file(filename, json_output) 
	f = File.new(filename, 'w')
	f.write(json_output)
	f.close
end

options = {}
optparse = OptionParser.new do|opts|
	opts.banner = "Usage: downloader.rb [options]"
	opts.on( '-t', '--type SBTYPE', 'SBTYPE is one of: default,shared,unique, ultra, burst, overstrike, arcane, glint, super') do |sbname|
		options[:sbname] = sbname
	end
	opts.on( '-o', '--output FILENAME', 'Save output to file FILENAME') do |filename|
		options[:filename] = filename
	end
	opts.on( '-h', '--help', 'Display this screen' ) do
   		 puts opts
    		exit
  	end
end
optparse.parse!

sbselector = SoulBreakSelector.new(options[:sbname])
if(options[:filename]) 
	filename = options[:filename]
else
	filename = sbselector.get_selected + '.json'
end
puts sbselector.get_suffix
uri = URI.parse($WIKI_PREFIX + sbselector.get_suffix)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
output = http.get(uri.request_uri)

document = Nokogiri::HTML(output.body)

sbtable = document.at('#content_block_5')

sbitems = parse_table(sbtable)

json_output = JSON.pretty_generate(sbitems)
save_file(filename, json_output)
