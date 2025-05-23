/datum/gear/hat
	subtype_path = /datum/gear/hat
	slot = ITEM_SLOT_HEAD
	sort_category = "Headwear"
	species_blacklist = list("plasmaman") //Their helmet takes up the head slot

//Hardhats

/datum/gear/hat/hhat_yellow
	display_name = "hardhat, yellow"
	path = /obj/item/clothing/head/hardhat
	allowed_roles = list("Chief Engineer", "Engineer", "Atmospheric Technician")

/datum/gear/hat/hhat_orange
	display_name = "hardhat, orange"
	path = /obj/item/clothing/head/hardhat/orange
	allowed_roles = list("Chief Engineer", "Engineer", "Atmospheric Technician")

/datum/gear/hat/hhat_blue
	display_name = "hardhat, blue"
	path = /obj/item/clothing/head/hardhat/dblue
	allowed_roles = list("Chief Engineer", "Engineer", "Atmospheric Technician")

//Berets, AKA how I lost my will to live again

/datum/gear/hat/beret
	display_name = "beret, red"
	path = /obj/item/clothing/head/beret

/datum/gear/hat/beret/black
	display_name = "beret, black"
	path = /obj/item/clothing/head/beret/black

/datum/gear/hat/beret/departmental
	display_name = "beret, departmental"
	path = /obj/item/clothing/head/beret/grey
	role_replacements = list(
		"Captain" = /obj/item/clothing/head/beret/captain,
		"Head of Personnel" = /obj/item/clothing/head/beret/hop,
		"SolGov Representative" = /obj/item/clothing/head/beret/solgov,

		"Head of Security" = /obj/item/clothing/head/beret/sec/hos,
		"Warden" = /obj/item/clothing/head/beret/sec/warden,
		"Security Officer" = /obj/item/clothing/head/beret/sec/officer,
		"Detective" = /obj/item/clothing/head/beret/sec,
		"Brig Physician" = /obj/item/clothing/head/beret/sec/brig_phys,

		"Chief Engineer" = /obj/item/clothing/head/beret/ce,
		"Station Engineer" = /obj/item/clothing/head/beret/eng,
		"Atmospheric Technician" = /obj/item/clothing/head/beret/atmos,

		"Research Director" = /obj/item/clothing/head/beret/rd,
		"Scientist" = /obj/item/clothing/head/beret/sci,
		"Roboticist" = /obj/item/clothing/head/beret/sci,

		"Chief Medical Officer" = /obj/item/clothing/head/beret/cmo,
		"Medical Doctor" = /obj/item/clothing/head/beret/med,
		"Paramedic" = /obj/item/clothing/head/beret/med,
		"Chemist" = /obj/item/clothing/head/beret/chem,
		"Geneticist" = /obj/item/clothing/head/beret/med,

		"Quartermaster" = /obj/item/clothing/head/beret/qm,
		"Cargo Technician" = /obj/item/clothing/head/beret/cargo,
		"Shaft Miner" = /obj/item/clothing/head/beret/mining,

		"Bartender" = /obj/item/clothing/head/beret/service,
		"Botanist" = /obj/item/clothing/head/beret/service,
		"Chef" = /obj/item/clothing/head/beret/service,
		"Curator" = /obj/item/clothing/head/beret/service,
		"Janitor" = /obj/item/clothing/head/beret/service,
		"Lawyer" = /obj/item/clothing/head/beret/service,
		"Mime" = /obj/item/clothing/head/beret,
		"Clown" = /obj/item/clothing/head/beret/puce
	)

/datum/gear/hat/beret/engineering/hazard
	display_name = "beret, hazard"
	path = /obj/item/clothing/head/beret/eng/hazard
	allowed_roles = list("Station Engineer", "Atmospheric Technician", "Chief Engineer")

//Soft caps

/datum/gear/hat/softcap
	display_name = "cap, recolorable"
	path = /obj/item/clothing/head/soft

/datum/gear/hat/flapcap
	display_name = "flapcap, recolorable"
	path = /obj/item/clothing/head/flap

/datum/gear/hat/utility_black
	display_name = "utility cover, black"
	path = /obj/item/clothing/head/soft/utility_black

/datum/gear/hat/utility_olive
	display_name = "utility cover, olive"
	path = /obj/item/clothing/head/soft/utility_olive

/datum/gear/hat/utility_beige
	display_name = "utility cover, beige"
	path = /obj/item/clothing/head/soft/utility_beige

/datum/gear/hat/utility_navy
	display_name = "utility cover, navy"
	path = /obj/item/clothing/head/soft/utility_navy


//Beanies

/datum/gear/hat/beanie
	display_name = "beanie, white"
	path = /obj/item/clothing/head/beanie

/datum/gear/hat/beanie/black
	display_name = "beanie, black"
	path = /obj/item/clothing/head/beanie/black

/datum/gear/hat/beanie/red
	display_name = "beanie, red"
	path = /obj/item/clothing/head/beanie/red

/datum/gear/hat/beanie/green
	display_name = "beanie, green"
	path = /obj/item/clothing/head/beanie/green

/datum/gear/hat/beanie/purple
	display_name = "beanie, purple"
	path = /obj/item/clothing/head/beanie/purple

/datum/gear/hat/beanie/blue
	display_name = "beanie, blue"
	path = /obj/item/clothing/head/beanie/darkblue

/datum/gear/hat/beanie/orange
	display_name = "beanie, orange"
	path = /obj/item/clothing/head/beanie/orange
//Misc

/datum/gear/hat/that
	display_name = "top hat"
	path = /obj/item/clothing/head/that

/datum/gear/hat/fedora
	display_name = "fedora, black"
	path = /obj/item/clothing/head/fedora

/datum/gear/hat/fedora/white
	display_name = "fedora, white"
	path = /obj/item/clothing/head/fedora/white

/datum/gear/hat/fedora/beige
	display_name = "fedora, beige"
	path = /obj/item/clothing/head/fedora/beige

/datum/gear/hat/flatcap
	display_name = "flatcap"
	path = /obj/item/clothing/head/flatcap

/datum/gear/hat/wig
	display_name = "wig"
	path = /obj/item/clothing/head/wig

/datum/gear/hat/cowboy
	display_name = "cowboy hat"
	path = /obj/item/clothing/head/cowboy

/datum/gear/hat/outlaw
	display_name = "outlaw hat"
	path = /obj/item/clothing/head/outlaw

/datum/gear/hat/catears
	display_name = "cat ears"
	path = /obj/item/clothing/head/kitty

/datum/gear/hat/horse
	display_name = "horse mask"
	path = /obj/item/clothing/mask/horsehead
	slot = ITEM_SLOT_MASK

/datum/gear/hat/piratehat
	display_name = "pirate hat"
	description = "Yarr. Comes with one free pirate speak manual."
	path = /obj/item/clothing/head/pirate

/datum/gear/hat/trapper
	display_name = "trapper hat"
	path = /obj/item/clothing/head/trapper

/datum/gear/hat/flowers
	display_name = "plastic flower, pickable"
	path = /obj/item/clothing/head/plastic_flower
