/datum/faction
	var/name
	/// Primarly to be used for backend stuff.
	var/short_name
	var/parent_faction
	/// List of prefixes that ships of this faction uses
	var/list/prefixes
	/// list of factions that are "allowed" with this faction, used for factional cargo
	var/list/allowed_factions = list()
	/// Theme color for this faction, currently only used for the wiki
	var/color = "#ffffff"
	/// Whether or not this faction should be able to use prefixes that aren't their own (see: Frontiersmen using Indie prefixes)
	var/check_prefix = TRUE

/datum/faction/New()
	if(!short_name)
		short_name = uppertext(copytext_char(name, 3))

	//All subtypes of this faction, all subtypes of specifically allowed factions, and SPECIFICALLY the parent faction (no subtypes) are allowed.
	//Try not to nest factions too deeply, yeah?
	allowed_factions += src
	allowed_factions = typecacheof(allowed_factions)
	allowed_factions[parent_faction] = TRUE

/// Easy way to check if something is "allowed", checks to see if it matches the name or faction typepath because factions are a fucking mess
/datum/faction/proc/allowed_faction(value_to_check)
	//do we have the same faction even if one is a define?
	if(value_to_check == name)
		return TRUE
	return is_type_in_typecache(value_to_check, allowed_factions)

/datum/faction/syndicate
	name = FACTION_SYNDICATE
	parent_faction = /datum/faction/syndicate
	prefixes = PREFIX_SYNDICATE
	color = "#B22C20"

/datum/faction/syndicate/ngr
	name = FACTION_NGR
	short_name = "NGR"
	prefixes = PREFIX_NGR

/datum/faction/syndicate/cybersun
	name = FACTION_CYBERSUN
	prefixes = PREFIX_CYBERSUN

/datum/faction/syndicate/hardliners
	name = FACTION_HARDLINERS
	prefixes = PREFIX_HARDLINERS
	color = "#B22C20"

/datum/faction/syndicate/roseus
	name = FACTION_ROSEUS
	prefixes = PREFIX_ROSEUS
	color = "#9D20B2"

/datum/faction/syndicate/suns
	name = FACTION_SUNS
	short_name = "SUNS"
	prefixes = PREFIX_SUNS

/datum/faction/syndicate/scarborough
	name = "Scarborough Arms"
	prefixes = PREFIX_INDEPENDENT

/datum/faction/solgov
	name = FACTION_SOLGOV
	parent_faction = /datum/faction/solgov
	prefixes = PREFIX_SOLGOV
	color = "#444e5f"

/datum/faction/srm
	name = FACTION_SRM
	short_name = "SRM"
	parent_faction = /datum/faction/srm
	prefixes = PREFIX_SRM
	color = "#6B3500"

/datum/faction/inteq
	name = FACTION_INTEQ
	short_name = "INTEQ"
	parent_faction = /datum/faction/inteq
	prefixes = PREFIX_INTEQ
	color = "#7E6641"

/datum/faction/clip
	name = FACTION_CLIP
	short_name = "CLIP"
	parent_faction = /datum/faction/clip
	prefixes = PREFIX_CLIP
	color = "#3F90DF"

/datum/faction/nt
	name = FACTION_NT
	short_name = "NT"
	parent_faction = /datum/faction/nt
	prefixes = PREFIX_NT
	color = "#283674"

/datum/faction/nt/ns_logi
	name = FACTION_NS_LOGI
	prefixes = PREFIX_NS_LOGI

/datum/faction/nt/vigilitas
	name = FACTION_VIGILITAS
	prefixes = PREFIX_VIGILITAS

/datum/faction/arknet
	name = FACTION_ARKNET
	prefixes = PREFIX_ARKNET
	color = "#9E0B41"

/datum/faction/hephaestus
	name = FACTION_HEPHAESTUS
	prefixes = PREFIX_HEPHAESTUS
	color = "#ABCF19"

/datum/faction/frontier
	name = FACTION_FRONTIER
	prefixes = PREFIX_FRONTIER
	color = "#80735D"
	check_prefix = FALSE
	parent_faction = /datum/faction/frontier

/datum/faction/pgf
	name = FACTION_PGF
	short_name = "ERIDANI"
	parent_faction = /datum/faction/pgf
	prefixes = PREFIX_PGF
	color = "#359829"

/datum/faction/independent
	name = FACTION_INDEPENDENT
	short_name = "IND"
	parent_faction =  /datum/faction/independent
	prefixes = PREFIX_INDEPENDENT
	color = "#A0A0A0"
