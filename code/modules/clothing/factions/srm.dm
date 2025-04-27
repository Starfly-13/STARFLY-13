//////////////
//Jumpsuits//
/////////////

/obj/item/clothing/under/suit/roumain
	name = "survivalist's worksuit"
	desc = "A simple, hard-wearing suit designed for exploring the wilderness."
	icon_state = "rouma_work"
	item_state = "rouma_work"
	can_adjust = FALSE
	icon = 'icons/obj/clothing/faction/srm/uniforms.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/srm/uniforms.dmi'
	supports_variations = KEPORI_VARIATION

//////////////////
//Armored suits//
/////////////////

/obj/item/clothing/suit/armor/roumain
	name = "tough duster"
	desc = "A coat made from hard leather. Meant to withstand long hunts in harsh wilderness."
	icon_state = "armor_rouma"
	item_state = "rouma_coat"
	body_parts_covered = CHEST|GROIN
	cold_protection = CHEST|GROIN|ARMS
	heat_protection = CHEST|GROIN|ARMS
	icon = 'icons/obj/clothing/faction/srm/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/srm/suits.dmi'
	supports_variations = KEPORI_VARIATION

/obj/item/clothing/suit/armor/roumain/shadow
	name = "beige hardleather duster"
	desc = "A coat made from hard leather. The leather is treated to be a lighter color."
	icon_state = "armor_rouma_shadow"
	item_state = "rouma_shadow_coat"
	supports_variations = KEPORI_VARIATION

/obj/item/clothing/suit/toggle/labcoat/roumain_med
	name = "grey hardleather duster"
	desc = "A coat made from hard leather and dyed grey."
	icon = 'icons/obj/clothing/faction/srm/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/srm/suits.dmi'
	icon_state = "rouma_med_coat"
	supports_variations = KEPORI_VARIATION

/obj/item/clothing/suit/hazardvest/roumain
	name = "hard leather vest"
	desc = "A vest made of hard leather. It's pretty sturdy, and could be used as basic armor."
	icon = 'icons/obj/clothing/faction/srm/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/srm/suits.dmi'
	icon_state = "armor_rouma_machinist"
	item_state = "rouma_coat"
	armor = list("melee" = 15, "bullet" = 0, "laser" = 5, "energy" = 5, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armor/roumain/flamebearer
	name = "fancy hardleather coat"
	desc = "An elegant, trimmed coat in a style popular among missionaries on the frontier. Often found with a holy book in one of its pockets."
	icon_state = "armor_rouma_flamebearer"
	supports_variations = KEPORI_VARIATION

/obj/item/clothing/suit/armor/roumain/colligne
	name = "armored hardleather duster."
	desc = "A hard leather coat treated with bullet-resistant materials, and lined with the dark fur of Adhoman wolves."
	icon_state = "armor_rouma_colligne"
	item_state = "rouma_coat"
	body_parts_covered = CHEST|GROIN
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	supports_variations = KEPORI_VARIATION
	armor = list("melee" = 15, "bullet" = 5, "laser" = 5, "energy" = 5, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armor/roumain/montagne
	name = "saint-roumain montagne coat"
	desc = "A stylish red coat to indicate that you are, in fact, a Hunter Montagne. Made of extra hard exotic leather, treated with bullet-resistant materials, and lined with the fur of some unidentifiable creature."
	icon_state = "armor_rouma_montagne"
	item_state = "rouma_montagne_coat"
	body_parts_covered = CHEST|GROIN
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35, "energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	supports_variations = KEPORI_VARIATION

///////////////
//Spacesuits//
//////////////

/obj/item/clothing/head/helmet/space/hardsuit/solgov/roumain
	name = "\improper roumain hardsuit helmet"
	desc = "An armored helmet with an unusual design that recalls both pre-industrial Solarian armor and iconography depicting the Ashen Huntsman. Though hand-made, it is surprisingly quite spaceworthy."
	icon = 'icons/obj/clothing/faction/srm/head.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/srm/head.dmi'
	icon_state = "hardsuit0-roumain"
	item_state = "hardsuit0-roumain"
	hardsuit_type = "roumain"
	worn_y_offset = 4
	supports_variations = KEPORI_VARIATION

/obj/item/clothing/suit/space/hardsuit/solgov/roumain
	name = "\improper roumain hardsuit"
	desc = "A hand-crafted suit of armor either modified from a set of normal plate armor or designed to resemble one. A powered exoskeleton has been cleverly integrated into the design and, surprisingly, it is completely vacuum-proof. Suits like this are a testament to what the master craftsmen of Hunter's Pride are capable of."
	icon = 'icons/obj/clothing/faction/srm/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/srm/suits.dmi'
	icon_state = "hardsuit-roumain"
	item_state = "hardsuit-roumain"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/solgov/roumain
	slowdown = 0.5
	supports_variations = KEPORI_VARIATION

/////////
//Hats//
////////

/obj/item/clothing/head/cowboy/sec/roumain
	name = "red-banded cowboy hat"
	desc = "A fancy hat with a red band and a nice feather. The way it covers your eyes makes you feel like a badass."
	icon_state = "rouma_hat"
	icon = 'icons/obj/clothing/faction/srm/head.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/srm/head.dmi'
	supports_variations = KEPORI_VARIATION

/obj/item/clothing/head/cowboy/sec/roumain/shadow
	name = "beige cowboy hat"
	desc = "A beige cowboy hat. The way it covers your eyes makes you feel badass, but this color totally shows dirt."
	icon_state = "rouma_shadow_hat"
	supports_variations = KEPORI_VARIATION

/obj/item/clothing/head/cowboy/sec/roumain/machinist
	name = "machinist's hat"
	desc = "A small, humble leather top hat. It gives you the gnawing urge to create classical gizmos and goobers, or alternatively repair any breaches within your vessel."
	icon_state = "rouma_machinist_hat"

/obj/item/clothing/head/cowboy/sec/roumain/med
	name = "red-banded hat"
	desc = "A very wide-brimmed, round hat treated with oil and wax. Somehow manages to look stylish and creepy at the same time."
	icon_state = "rouma_med_hat"
	supports_variations = KEPORI_VARIATION

/obj/item/clothing/head/cowboy/sec/roumain/flamebearer
	name = "flamebearer's hat"
	desc = "A wide-brimmed, pointed hat with charred leather, granting it an ash-grey appearance. The design honors the one the Ashen Huntsman himself wore, according to legend."
	icon_state = "rouma_flamebearer_hat"
	supports_variations = KEPORI_VARIATION

/obj/item/clothing/head/cowboy/sec/roumain/colligne
	name = "colligne's hat"
	desc = "A fancy, pointy leather hat with a large feather plume to signal that you are, in fact... A Hunter Colligne. You still have some ways to go before you gain the title of Montagne."
	icon_state = "rouma_colligne_hat"
	supports_variations = KEPORI_VARIATION

/obj/item/clothing/head/cowboy/sec/roumain/montagne
	name = "montagne's hat"
	desc = "A very fancy hat with a large feather plume to signal that you are, in fact, a Hunter Montagne. The exotic fur lining is impeccably soft."
	icon_state = "rouma_montagne_hat"
	supports_variations = KEPORI_VARIATION

///////////////
//Accessories//
///////////////

//These are stored in clothing/accessories.dmi instead of a factional variant due to accessory code being dogwater
//Please transfer them over to a factional file if accessory code is ever fixed

/obj/item/clothing/accessory/waistcoat/roumain
	name = "red waistcoat"
	desc = "A warm, red wool waistcoat that is occasionally seen on the frontier. Popular with those working in colder environments."
	icon_state = "rouma_waistcoat"
	icon = 'icons/obj/clothing/accessories.dmi'
	mob_overlay_icon = 'icons/mob/clothing/accessories.dmi'
	minimize_when_attached = TRUE
