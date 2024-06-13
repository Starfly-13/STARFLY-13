//Jumpsuits
/obj/item/clothing/under/gezena
	name = "Eridanite navywear"
	desc = "Made of a slick synthetic material that is both breathable, and resistant to scale and thorn alike."
	icon = 'icons/obj/clothing/faction/gezena/uniforms.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/gezena/uniforms.dmi'
	lefthand_file = 'icons/mob/inhands/faction/gezena/gezena_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/faction/gezena/gezena_righthand.dmi'
	icon_state = "naval"
	item_state = "bluejump"
	supports_variations = DIGITIGRADE_VARIATION
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 40)

/obj/item/clothing/under/gezena/captain
	name = "\improper Eridanite captain's navywear"
	desc = "A refined variation of the basic navywear, sporting sleek silver trim."
	icon_state = "captain"
	item_state = "bluejump"

/obj/item/clothing/under/gezena/marine
	name = "\improper Eridanite marine fatigue"
	desc = "Rough inside and out, these fatigues have seen their fair share."
	icon_state = "marine"
	item_state = "marinejump"

//Unarmored suit

/obj/item/clothing/suit/toggle/gezena
	name = "silkenweave jacket"
	desc = "Refined and sturdy, emblazoned below the neck with the symbol of Epsilon Eridani."
	icon = 'icons/obj/clothing/faction/gezena/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/gezena/suits.dmi'
	lefthand_file = 'icons/mob/inhands/faction/gezena/gezena_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/faction/gezena/gezena_righthand.dmi'
	icon_state = "lightcoat"
	item_state = "bluecloth"
	blood_overlay_type = "coat"
	togglename = "zipper"
	body_parts_covered = CHEST|ARMS
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/exo
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON
	armor = list("melee" = 20, "bullet" = 20, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 0)

//Armored suit

/obj/item/clothing/suit/armor/gezena
	name = "navywear coat"
	desc = "Formal navywear, emblazoned across the back with the Eridanite sigil."
	icon = 'icons/obj/clothing/faction/gezena/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/gezena/suits.dmi'
	lefthand_file = 'icons/mob/inhands/faction/gezena/gezena_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/faction/gezena/gezena_righthand.dmi'
	icon_state = "coat"
	item_state = "bluecloth"
	blood_overlay_type = "coat"
	body_parts_covered = CHEST|ARMS|GROIN|LEGS
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/exo
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON
	armor = list("melee" = 35, "bullet" = 35, "laser" = 20, "energy" = 40, "bomb" = 20, "bio" = 20, "rad" = 0, "fire" = 50, "acid" = 50)
	allowed = list(
					/obj/item/flashlight,
					/obj/item/tank/internals/emergency_oxygen,
					/obj/item/tank/internals/plasmaman,
					/obj/item/toy,
					/obj/item/storage/fancy/cigarettes,
					/obj/item/lighter,
					/obj/item/radio,
					/obj/item/gun/energy/kalix,
					)

/obj/item/clothing/suit/armor/gezena/engi
	name = "engineer navywear coat"
	desc = "Oil and stain resistant, with orange trim signifiying the wearer doesn't mind getting their hands dirty."
	icon_state = "engicoat"
	item_state = "bluecloth"

/obj/item/clothing/suit/armor/gezena/captain
	name = "captain's navywear coat"
	desc = "Sleek, blood-resisting silver lines the inside and out of this coat, with a luxurious, soft internal lining."
	icon_state = "captaincoat"
	item_state = "captaincoat"

/obj/item/clothing/suit/armor/gezena/marine
	name = "\improper Eridanite armored vest"
	desc = "A sturdy and reliable vest, standard-issue among Eridanite marines.."
	icon_state = "marinevest"
	item_state = "marinevest"
	armor = list("melee" = 35, "bullet" = 50, "laser" = 50, "energy" = 50, "bomb" = 40, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50) //the laser gun country should probably have laser armor

/obj/item/clothing/suit/armor/gezena/marinecoat
	name = "plated Eridanite coat"
	desc = "A less practical set of body armor of Eridanite build, often used on missions on colder planets."
	icon_state = "marinecoat"
	item_state = "bluecloth"
	armor = list("melee" = 35, "bullet" = 50, "laser" = 50, "energy" = 50, "bomb" = 40, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50) //same

//Spacesuits

/obj/item/clothing/suit/space/gezena
	name = "\improper Eridanite model E-3 spacesuit"
	desc = " Sturdy, flexible, and reliable, the E-3 spacesuit is commonly found on government-owned vessels from Epsilon Eridani."
	icon = 'icons/obj/clothing/faction/gezena/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/gezena/suits.dmi'
	lefthand_file = 'icons/mob/inhands/faction/gezena/gezena_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/faction/gezena/gezena_righthand.dmi'
	icon_state = "spacesuit"
	item_state = "spacesuit"
	armor = list("melee" = 15, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 15, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)
	w_class = WEIGHT_CLASS_NORMAL
	supports_variations = DIGITIGRADE_VARIATION

/obj/item/clothing/head/helmet/space/gezena
	name = "\improper Eridanite model E-3 helmet"
	desc = "A celebration of the diversity in Epsilon Eridani, the E-3 spacesuit helmet features rubberized grommets fitting for any length of horn, and an internal monitor for life support."
	icon = 'icons/obj/clothing/faction/gezena/head.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/gezena/head.dmi'
	lefthand_file = 'icons/mob/inhands/faction/gezena/gezena_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/faction/gezena/gezena_righthand.dmi'
	icon_state = "spacehelmet"
	item_state = "spacehelm"
	armor = list("melee" = 15, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 15, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)
	w_class = WEIGHT_CLASS_NORMAL

//Hats

/obj/item/clothing/head/gezena
	name = "\improper EAFN Cap"
	desc = "The standard cap of the Epsilon Eridani military, in Navy colors."
	icon = 'icons/obj/clothing/faction/gezena/head.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/gezena/head.dmi'
	lefthand_file = 'icons/mob/inhands/faction/gezena/gezena_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/faction/gezena/gezena_righthand.dmi'
	icon_state = "navalhat"
	item_state = "bluecloth"
	armor = list("melee" = 10, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)

/obj/item/clothing/head/gezena/flap
	name = "\improper EAFN flap cap"
	desc = "The standard cap of the Epsilon Eridani Armed Forces, in Navy colors. Due to the hazards of sunburn and insect-spread diseases, this cap features a flap on its back."
	icon_state = "navalflap"
	item_state = "bluecloth"

/obj/item/clothing/head/gezena/marine
	name = "\improper EAFMC Cap"
	desc = "The standard cap of the Epsilon Eridani Armed Forces, in Marine Corps colors."
	icon_state = "marinehat"
	item_state = "marinecloth"

/obj/item/clothing/head/gezena/marine/flap
	name = "\improper EAFMC flap cap"
	desc = "The standard cap of the Epsilon Eridani Armed Forces, in Marine Corps colors. Due to the hazards of sunburn and insect-spread diseases, this cap features a flap on its back."
	icon_state = "marineflap"
	item_state = "marinecloth"

/obj/item/clothing/head/gezena/marine/lead
	name = "\improper EAFMC Commander Cap"
	desc = "The standard cap of the PGF military, in Marine Corps colors. The silver markings denote it as a commander's cap."
	icon_state = "squadhat"
	item_state = "marinecloth"

/obj/item/clothing/head/gezena/marine/lead/flap
	name = "\improper EAFMC Commander's' flap cap"
	desc = "The standard cap of the Epsilon Eridani Armed Forces, in Marine Corps colors. Due to the hazards of sunburn and insect-spread diseases, this cap features a flap on its back. The silver markings denote it as a commander's cap."
	icon_state = "squadflap"
	item_state = "marinecloth"

/obj/item/clothing/head/gezena/medic
	name = "\improper EAF medic cap"
	desc = "The standard cap of the Epsilon Eridani Armed Forces. The coloring indicates the wearer as a medical officer."
	icon_state = "medichat"
	item_state = "whitecloth"

/obj/item/clothing/head/gezena/medic/flap
	name = "\improper EAF medic flap cap"
	desc = "The standard cap of the Epsilon Eridani Armed Forces. Due to the hazards of sunburn and insect-spread diseases, this cap features a flap on its back."
	icon_state = "medicflap"
	item_state = "whitecloth"

/obj/item/clothing/head/gezena/captain // no captain flap yet(?)
	name = "\improper EAFN captain's cap"
	desc = "The standard cap of the Epsilon Eridani Armed Forces, in Navy colors. The decoration indicates the wearer as a ship's Captain."
	icon_state = "captainhat"
	item_state = "bluecloth"

/obj/item/clothing/head/helmet/gezena
	name = "\improper Eridanite combat helmet"
	desc = "Far more practical for combat than either type of cap, but not nearly as traditional or comfortable. Features small sections of removable plating to make space for the horns of horned races as per Regulation 740, concerning accomodations for nonhuman species."
	icon = 'icons/obj/clothing/faction/gezena/head.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/gezena/head.dmi'
	lefthand_file = 'icons/mob/inhands/faction/gezena/gezena_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/faction/gezena/gezena_righthand.dmi'
	armor = list("melee" = 35, "bullet" = 50, "laser" = 50, "energy" = 50, "bomb" = 40, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50) //the laser gun country should probably have laser armor
	icon_state = "marinehelmet"
	item_state = "marinehelm"

//Gloves

/obj/item/clothing/gloves/gezena
	name = "\improper EAFN Gripper Gloves"
	desc = "the gloves employed by the Epsilon Eridani Armed Forces are designed to ensure the highest possible grip is maintained while also providing protection from blisters in work environments."
	icon = 'icons/obj/clothing/faction/gezena/hands.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/gezena/hands.dmi'
	icon_state = "navalgloves"
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	armor = list("melee" = 5, "bullet" = 5, "laser" = 5, "energy" = 5, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)

/obj/item/clothing/gloves/gezena/marine
	name = "\improper EAFMC Gripper Gloves"
	desc = "The gloves employed by the Epsilon Eridani Armed Forces are designed to ensure the highest possible grip is maintained while also providing protection from blisters in work environments. Carries extra tactile grip on the fingertips for easy use of firearms."
	icon_state = "marinegloves"
	armor = list("melee" = 10, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 75, "acid" = 50)

/obj/item/clothing/gloves/gezena/engi
	name = "\improper EAFN Insulated Gripper Gloves"
	desc = "The gloves employed by the Epsilon Eridani Armed Forces are designed to ensure the highest possible grip is maintained while also providing protection from blisters in work environments. Comes with anti-conductive microfibers interwoven to supply the useer with electrical insulation."
	icon_state = "engigloves"
	siemens_coefficient = 0

/obj/item/clothing/gloves/gezena/captain
	name = "\improper PGFN Captain's Gripper Gloves"
	desc = "As the name suggests, the gloves employed by the Epsilon Eridani Armed Forces are designed to ensure the highest possible grip is maintained while also providing protection from blisters in work environments. Bears the silver standard of an Eridanite captain."
	icon_state = "captaingloves"
	siemens_coefficient = 0

//Boots

/obj/item/clothing/shoes/combat/gezena
	name = "\improper Eridanite steel-toed boots"
	desc = "These boots have steel protection around the toes.. Standard issue to all members of all branches of the Epsilon Eridani Armed Forces."
	icon = 'icons/obj/clothing/faction/gezena/feet.dmi'
	//mob_overlay_icon = 'icons/mob/clothing/faction/gezena/feet.dmi' todo: find out why digi breaks here
	icon_state = "pgfboots"
	item_state = "jackboots"

//Belt

/obj/item/storage/belt/military/gezena
	name = "\improper EAF gear harness"
	desc = "A lightweight harness covered in pouches, supplied to Eridanite footsoldiers. This variant is designed for carrying ammunition."
	icon = 'icons/obj/clothing/faction/gezena/belt.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/gezena/belt.dmi'
	lefthand_file = 'icons/mob/inhands/faction/gezena/gezena_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/faction/gezena/gezena_righthand.dmi'
	icon_state = "pouches"
	item_state = "bluecloth"
	unique_reskin = null

/obj/item/storage/belt/medical/gezena
	name = "\improper EAF Medical gear harness"
	desc = "A lightweight harness covered in pouches, supplied to the ground troops of the EAF. This variant is designed for carrying medical supplies."
	icon = 'icons/obj/clothing/faction/gezena/belt.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/gezena/belt.dmi'
	lefthand_file = 'icons/mob/inhands/faction/gezena/gezena_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/faction/gezena/gezena_righthand.dmi'
	icon_state = "medpouches"
	item_state = "whitecloth"

//Cloaks

/obj/item/clothing/neck/cloak/gezena
	name = "\improper Standard EAF Cloak"
	desc = "The method with which Epsilon Eridani Armed Forces members display their rank to others. Wearing one while on duty is required by uniform code. This variant displays the wearer's rank as a standard non-officer soldier or crewperson."
	icon = 'icons/obj/clothing/faction/gezena/neck.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/gezena/neck.dmi'
	lefthand_file = 'icons/mob/inhands/faction/gezena/gezena_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/faction/gezena/gezena_righthand.dmi'
	icon_state = "cape"
	item_state = "blackcloth"

/obj/item/clothing/neck/cloak/gezena/lead
	name = "EAF Sergeant's Cloak"
	desc = "The method with which Epsilon Eridani Armed Forces members display their rank to others. Wearing one while on duty is required by uniform code. This variant displays the wearer's rank as a squad commander."
	icon_state = "squadcape"
	item_state = "blackcloth"

/obj/item/clothing/neck/cloak/gezena/engi
	name = "EAF Engineer's Cloak"
	desc = "The method with which Epsilon Eridani Armed Forces members display their rank to others. Wearing one while on duty is required by uniform code. This variant displays the wearer's rank as an officer with an engineering specialization."
	icon_state = "engicape"
	item_state = "blackcloth"

/obj/item/clothing/neck/cloak/gezena/med
	name = "EAF Medic's Cloak"
	desc = "The method with which Epsilon Eridani Armed Forces members display their rank to others. Wearing one while on duty is required by uniform code. This variant displays the wearer's rank as an officer with a medical specialization."
	icon_state = "medcape"
	item_state = "whitecloth"

/obj/item/clothing/neck/cloak/gezena/command
	name = "EAF Officer's Cloak"
	desc = "The method with which Epsilon Eridani Armed Forces members display their rank to others. Wearing one while on duty is required by uniform code. This variant displays the wearer's rank as an officer."
	icon_state = "commandcape"
	item_state = "whitecloth"

/obj/item/clothing/neck/cloak/gezena/captain
	name = "EAF Captain's Cloak"
	desc = "The method with which Epsilon Eridani Armed Forces members display their rank to others. Wearing one while on duty is required by uniform code. This variant displays the wearer's rank as a high ranking officer."
	icon_state = "captaincape"
	item_state = "whitecloth"
