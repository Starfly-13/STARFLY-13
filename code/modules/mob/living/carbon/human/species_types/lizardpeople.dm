/datum/species/lizard
	// Reptilian humanoids with scaled skin and tails.
	name = "\improper Sinta'Unathi"
	id = SPECIES_UNATHI
	default_color = "00FF00"
	species_age_max = 175
	species_traits = list(EYECOLOR,LIPS,SCLERA,EMOTE_OVERLAY,UNATHI_COLORS)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_REPTILE
	mutant_bodyparts = list("tail_lizard", "face_markings", "frills", "horns", "spines", "body_markings", "legs")
	mutanttongue = /obj/item/organ/tongue/lizard
	mutant_organs = list(/obj/item/organ/tail/lizard)
	coldmod = 1.5
	heatmod = 0.67
	species_age_min = 22
	species_age_max = 200
	default_features = list("mcolor" = "0F0", "tail_lizard" = "Smooth", "face_markings" = "None", "horns" = "None", "frills" = "None", "spines" = "None", "body_markings" = "None", "legs" = "Normal Legs", "body_size" = "Normal")
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	attack_verb = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/lizard
	skinned_type = /obj/item/stack/sheet/animalhide/lizard
	disliked_food = GRAIN | CLOTH | GROSS
	liked_food = GORE | MEAT
	deathsound = 'sound/voice/lizard/deathsound.ogg'
	wings_icons = list("Dragon")
	species_language_holder = /datum/language_holder/lizard
	digitigrade_customization = DIGITIGRADE_OPTIONAL
	mutanteyes = /obj/item/organ/eyes/lizard
	sclera_color = "#ffffff"

	species_chest = /obj/item/bodypart/chest/lizard
	species_head = /obj/item/bodypart/head/lizard
	species_l_arm = /obj/item/bodypart/l_arm/lizard
	species_r_arm = /obj/item/bodypart/r_arm/lizard
	species_l_leg = /obj/item/bodypart/leg/left/lizard
	species_r_leg = /obj/item/bodypart/leg/right/lizard

	species_robotic_chest = /obj/item/bodypart/chest/robot/lizard
	species_robotic_head = /obj/item/bodypart/head/robot/lizard
	species_robotic_l_arm = /obj/item/bodypart/l_arm/robot/surplus/lizard
	species_robotic_r_arm = /obj/item/bodypart/r_arm/robot/surplus/lizard
	species_robotic_l_leg = /obj/item/bodypart/leg/left/robot/surplus/lizard
	species_robotic_r_leg = /obj/item/bodypart/leg/right/robot/surplus/lizard

	robotic_eyes = /obj/item/organ/eyes/robotic/lizard

	// Lizards are coldblooded and can stand a greater temperature range than humans
	bodytemp_heat_damage_limit = HUMAN_BODYTEMP_HEAT_DAMAGE_LIMIT + 30
	bodytemp_cold_damage_limit = HUMAN_BODYTEMP_COLD_DAMAGE_LIMIT - 10
	max_temp_comfortable = HUMAN_BODYTEMP_NORMAL + 25
	min_temp_comfortable = HUMAN_BODYTEMP_NORMAL - 3
	loreblurb = "The Sinta'Unathi are a cold-blooded reptilian species originating from the harsh mainland of the planet Moghes, in the Uuoea-Esa system. A warrior culture with emphasis on honor, family, and loyalty to one's clan, the divided Sinta'Unathi find themselves as powerful a force as any other species despite their less than hospitable homeworld."

	ass_image = 'icons/ass/asslizard.png'
	var/datum/action/innate/liz_lighter/internal_lighter

/* datum/species/lizard/on_species_loss(mob/living/carbon/C)
	if(internal_lighter)
		internal_lighter.Remove(C)
	..() */

	var/datum/action/innate/liztackle/liztackle
	/// # Inherit tackling variables #
	/// See: [/datum/component/tackler/var/stamina_cost]
	var/tackle_stam_cost = 15
	/// See: [/datum/component/tackler/var/base_knockdown]
	var/base_knockdown = 0.3 SECONDS
	/// See: [/datum/component/tackler/var/range]
	var/tackle_range = 5
	/// See: [/datum/component/tackler/var/min_distance]
	var/min_distance = 1
	/// See: [/datum/component/tackler/var/speed]
	var/tackle_speed = 1
	/// See: [/datum/component/tackler/var/skill_mod]
	var/skill_mod = 3

/datum/species/lizard/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	if(ishuman(C))
		liztackle = new
		liztackle.Grant(C)


/datum/species/lizard/on_species_loss(mob/living/carbon/human/C, datum/species/new_species, pref_load)
	. = ..()

	C.base_pixel_x += 8
	C.pixel_x = C.base_pixel_x
	C.stop_updating_hands()

	if(liztackle)
		liztackle.Remove(C)

	qdel(C.GetComponent(/datum/component/tackler))

/datum/action/innate/liztackle
	name = "Pounce"
	desc = "Ready yourself to pounce."
	check_flags = AB_CHECK_CONSCIOUS
	button_icon_state = "tackle"
	icon_icon = 'icons/obj/clothing/gloves.dmi'
	background_icon_state = "bg_alien"

/datum/action/innate/liztackle/Activate()
	var/mob/living/carbon/human/H = owner
	var/datum/species/lizard/liz = H.dna.species
	if(H.GetComponent(/datum/component/tackler))
		qdel(H.GetComponent(/datum/component/tackler))
		to_chat(H, "<span class='notice'>You relax, no longer ready to pounce.</span>")
		return
	H.AddComponent(/datum/component/tackler, stamina_cost= liz.tackle_stam_cost, base_knockdown= liz.base_knockdown, range= liz.tackle_range, speed= liz.tackle_speed, skill_mod= liz.skill_mod, min_distance= liz.min_distance)
	H.visible_message("<span class='notice'>[H] gets ready to pounce!</span>", \
		"<span class='notice'>You ready yourself to pounce!</span>", null, COMBAT_MESSAGE_RANGE)


	/*	internal_lighter = new
		internal_lighter.Grant(C)


/datum/action/innate/liz_lighter
	name = "Ignite"
	desc = "(Requires you to drink welding fuel beforehand)"
	check_flags = AB_CHECK_CONSCIOUS
	button_icon_state = "fire"
	icon_icon = 'icons/effects/fire.dmi'
	background_icon_state = "bg_alien"

/datum/action/innate/liz_lighter/Activate()
	var/mob/living/carbon/human/H = owner
	var/obj/item/lighter/liz/N = new(H)
	if(H.put_in_hands(N))
		to_chat(H, "<span class='notice'>You ignite a small flame in your mouth.</span>")
		H.reagents.del_reagent(/datum/reagent/fuel,4)
	else
		qdel(N)
		to_chat(H, "<span class='warning'>You don't have any free hands.</span>")

/datum/action/innate/liz_lighter/IsAvailable()
	if(..())
		var/mob/living/carbon/human/H = owner
		if(H.reagents && H.reagents.has_reagent(/datum/reagent/fuel,4))
			return TRUE
		return FALSE

*/

/// Lizards are cold blooded and do not stabilize body temperature naturally
/datum/species/lizard/natural_bodytemperature_stabilization(datum/gas_mixture/environment, mob/living/carbon/human/H)
	return 0

/datum/species/lizard/random_name(gender,unique,lastname)
	if(unique)
		return random_unique_lizard_name(gender)

	var/randname = lizard_name(gender)

	if(lastname)
		randname += " [lastname]"

	return randname

/*
Lizard subspecies: ASHWALKERS
*/
/datum/species/lizard/ashwalker
	name = "Rksh'Unathi"
	id = SPECIES_ASHWALKER
	species_age_min = 18
	species_age_max = 300
	examine_limb_id = SPECIES_UNATHI
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS, NO_UNDERWEAR)
	inherent_traits = list(TRAIT_CHUNKYFINGERS,TRAIT_NOBREATH)
	species_language_holder = /datum/language_holder/lizard/ash
	digitigrade_customization = DIGITIGRADE_FORCED
	loreblurb = "The Rksh'Unathi are a mysterious reptilian species scattered across numerous planets, but only where the Necropolis' tendrils have scarred the land. While they are genetically related to the other species of Unathi, it is unclear how they came to be."


/*
Lizard subspecies: YEOSA'UNATHI
*/
/datum/species/lizard/yeosa
	name = "Yeosa'Unathi"
	id = SPECIES_YEOSA
	species_age_min = 22
	species_age_max = 200
	examine_limb_id = SPECIES_UNATHI
	inherent_traits = list(TRAIT_ALCOHOL_TOLERANCE)
	species_language_holder = /datum/language_holder/yeosa
	coldmod = 1.75
	heatmod = 0.7
	burnmod = 1.1
	siemens_coeff = 1.25
	oxymod = 0.2
	exotic_bloodtype = "L"
	blush_color = COLOR_BLUSH_TEAL
	grad_color="#fffec4"
	sclera_color="#fffec4"


	bodytemp_heat_damage_limit = HUMAN_BODYTEMP_HEAT_DAMAGE_LIMIT + 30
	bodytemp_cold_damage_limit = HUMAN_BODYTEMP_COLD_DAMAGE_LIMIT - 10
	max_temp_comfortable = HUMAN_BODYTEMP_NORMAL + 20
	min_temp_comfortable = HUMAN_BODYTEMP_NORMAL - 1
	loreblurb = "The Yeosa'Unathi are a cold-blooded reptilian species originating from the depths of the ocean on the planet Moghes, in the Uuoea-Esa system. Most Yeosa'Unathi will seldom step on the surface except to sunbathe - this can leave the impression of laziness and lethargy on those who interact with them. However, their culture largely mirrors that of the Sinta, and they are equally proud. "


//WS Edit Start - Kobold
//Ashwalker subspecies: KOBOLD
/datum/species/lizard/ashwalker/kobold
	name = "Kobold"
	id = SPECIES_KOBOLD
	examine_limb_id = SPECIES_UNATHI
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS, NO_UNDERWEAR)
	inherent_traits = list(TRAIT_CHUNKYFINGERS,TRAIT_NOBREATH)
	species_language_holder = /datum/language_holder/lizard/ash

/datum/species/lizard/ashwalker/kobold/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	. = ..() //call everything from species/on_species_gain()
	C.dna.add_mutation(DWARFISM)
//WS Edit End - Kobold


//WS Edit Start - Kobold
//Ashwalker subspecies: KOBOLD
/datum/species/lizard/ashwalker/kobold
	name = "Kobold"
	id = SPECIES_KOBOLD
	examine_limb_id = SPECIES_UNATHI
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS, NO_UNDERWEAR)
	inherent_traits = list(TRAIT_CHUNKYFINGERS,TRAIT_NOBREATH)
	species_language_holder = /datum/language_holder/lizard/ash

/datum/species/lizard/ashwalker/kobold/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	. = ..() //call everything from species/on_species_gain()
	C.dna.add_mutation(DWARFISM)
//WS Edit End - Kobold
