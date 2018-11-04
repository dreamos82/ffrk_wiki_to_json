require_relative 'parsers/defaultparser'

class SoulBreakSelector
	SOULBREAKS = {
		'default' => '/game/951/wiki/Soul%20Break%20List_Default%20Soul%20Break',
		'unique' => '/game/951/wiki/Soul%20Break%20List_Unique%20Soul%20Break',
		'super' => '/game/951/wiki/Soul%20Break%20List_Super%20Soul%20Break%20(Unique)',
		'burst' => '/game/951/wiki/Soul%20Break%20List_Burst%20Soul%20Break',
		'overstrike' => '/game/951/wiki/Soul%20Break%20List_Overstrike%20Soul%20Break',
		'ultra' => '/game/951/wiki/Soul%20Break%20List_Ultra%20Soul%20Breaks',
		'chain' => '/game/951/wiki/Soul%20Break%20List_Chain%20Soul%20Break',
		'arcane' => '/game/951/wiki/Soul%20Break%20List_Arcane%20Overstrike',
		'glint' => '/game/951/wiki/Soul%20Break%20List_Glint',
		'shared' => '/game/951/wiki/Soul%20Break%20List_Shared%20Soul%20Break'
	}
	def initialize(sbname)
		if(!sbname || !SOULBREAKS[sbname])
			@selected = 'default'
		else
			@selected = sbname
		end
	end

	def get_suffix
		return SOULBREAKS[@selected]
	end

	def get_selected
		return @selected
	end
	
	def get_parser
		return DefaultParser.new
	end
end
