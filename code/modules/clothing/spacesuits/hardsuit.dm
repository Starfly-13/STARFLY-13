	//Baseline hardsuits
/obj/item/clothing/head/helmet/space/hardsuit
	name = "hardsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low-pressure environment. Has radiation shielding."
	icon_state = "hardsuit0-engineering"
	item_state = "eng_helm"
	max_integrity = 300
	armor = list("melee" = 10, "bullet" = 5, "laser" = 10, "energy" = 20, "bomb" = 10, "bio" = 100, "rad" = 75, "fire" = 50, "acid" = 75)
	light_system = MOVABLE_LIGHT_DIRECTIONAL
	light_range = 4
	light_power = 1
	light_on = FALSE
	var/basestate = "hardsuit"
	var/on = FALSE
	var/obj/item/clothing/suit/space/hardsuit/suit
	var/hardsuit_type = "engineering" //Determines used sprites: hardsuit[on]-[type]
	actions_types = list(/datum/action/item_action/toggle_helmet)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH	| PEPPERPROOF
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF | SEALS_EYES
	var/rad_count = 0
	var/rad_record = 0
	var/grace_count = 0
	var/datum/looping_sound/geiger/soundloop

/obj/item/clothing/head/helmet/space/hardsuit/Initialize()
	. = ..()
	soundloop = new(list(), FALSE, TRUE)
	soundloop.volume = 5
	START_PROCESSING(SSobj, src)

/obj/item/clothing/head/helmet/space/hardsuit/Destroy()
	. = ..()
	if(!QDELETED(suit))
		qdel(suit)
	suit = null
	QDEL_NULL(soundloop)
	STOP_PROCESSING(SSobj, src)

/obj/item/clothing/head/helmet/space/hardsuit/attack_self(mob/user)
	on = !on
	icon_state = "[basestate][on]-[hardsuit_type]"
	user.update_inv_head()	//so our mob-overlays update

	set_light_on(on)

	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/space/hardsuit/dropped(mob/user)
	..()
	if(suit)
		suit.RemoveHelmet()
		soundloop.stop(user)

/obj/item/clothing/head/helmet/space/hardsuit/item_action_slot_check(slot)
	if(slot == ITEM_SLOT_HEAD)
		return 1

/obj/item/clothing/head/helmet/space/hardsuit/equipped(mob/user, slot)
	..()
	if(slot != ITEM_SLOT_HEAD)
		if(suit)
			suit.RemoveHelmet()
			soundloop.stop(user)
		else
			qdel(src)
	else
		soundloop.start(user)

/obj/item/clothing/head/helmet/space/hardsuit/proc/display_visor_message(msg)
	var/mob/wearer = loc
	if(msg && ishuman(wearer))
		wearer.show_message("[icon2html(src, wearer)]<b><span class='robot'>[msg]</span></b>", MSG_VISUAL)

/obj/item/clothing/head/helmet/space/hardsuit/rad_act(severity)
	. = ..()
	rad_count += severity

/obj/item/clothing/head/helmet/space/hardsuit/process()
	if(!rad_count)
		grace_count++
		if(grace_count == 2)
			soundloop.last_radiation = 0
		return

	grace_count = 0
	rad_record -= rad_record/5
	rad_record += rad_count/5
	rad_count = 0

	soundloop.last_radiation = rad_record

/obj/item/clothing/head/helmet/space/hardsuit/emp_act(severity)
	. = ..()
	display_visor_message("[severity > 1 ? "Light" : "Strong"] electromagnetic pulse detected!")


/obj/item/clothing/suit/space/hardsuit
	name = "hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has radiation shielding."
	icon_state = "hardsuit-engineering"
	item_state = "eng_hardsuit"
	max_integrity = 300
	armor = list("melee" = 10, "bullet" = 5, "laser" = 10, "energy" = 20, "bomb" = 10, "bio" = 100, "rad" = 75, "fire" = 50, "acid" = 75)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/t_scanner, /obj/item/construction/rcd, /obj/item/pipe_dispenser)
	siemens_coefficient = 0
	var/obj/item/clothing/head/helmet/space/hardsuit/helmet
	actions_types = list(/datum/action/item_action/toggle_helmet)
	var/helmettype = /obj/item/clothing/head/helmet/space/hardsuit
	var/obj/item/tank/jetpack/suit/jetpack = null
	var/hardsuit_type
	pocket_storage_component_path = FALSE
	greyscale_colors = list(list(11, 19), list(22, 12), list(16, 9))
	greyscale_icon_state = "hardsuit"

/obj/item/clothing/suit/space/hardsuit/Initialize()
	if(jetpack && ispath(jetpack))
		jetpack = new jetpack(src)
	. = ..()

/obj/item/clothing/suit/space/hardsuit/attack_self(mob/user)
	user.changeNext_move(CLICK_CD_MELEE)
	..()

/obj/item/clothing/suit/space/hardsuit/examine(mob/user)
	. = ..()
	if(!helmet && helmettype)
		. += "<span class='notice'> The helmet on [src] seems to be malfunctioning. It's light bulb needs to be replaced.</span>"

/obj/item/clothing/suit/space/hardsuit/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/tank/jetpack/suit))
		if(jetpack)
			to_chat(user, "<span class='warning'>[src] already has a jetpack installed.</span>")
			return
		if(src == user.get_item_by_slot(ITEM_SLOT_OCLOTHING)) //Make sure the player is not wearing the suit before applying the upgrade.
			to_chat(user, "<span class='warning'>You cannot install the upgrade to [src] while wearing it.</span>")
			return

		if(user.transferItemToLoc(I, src))
			jetpack = I
			to_chat(user, "<span class='notice'>You successfully install the jetpack into [src].</span>")
			return
	else if(I.tool_behaviour == TOOL_SCREWDRIVER)
		if(!jetpack)
			to_chat(user, "<span class='warning'>[src] has no jetpack installed.</span>")
			return
		if(src == user.get_item_by_slot(ITEM_SLOT_OCLOTHING))
			to_chat(user, "<span class='warning'>You cannot remove the jetpack from [src] while wearing it.</span>")
			return

		jetpack.turn_off(user)
		jetpack.forceMove(drop_location())
		jetpack = null
		to_chat(user, "<span class='notice'>You successfully remove the jetpack from [src].</span>")
		return
	else if(istype(I, /obj/item/light) && helmettype)
		if(src == user.get_item_by_slot(ITEM_SLOT_OCLOTHING))
			to_chat(user, "<span class='warning'>You cannot replace the bulb in the helmet of [src] while wearing it.</span>")
			return
		if(helmet)
			to_chat(user, "<span class='warning'>The helmet of [src] does not require a new bulb.</span>")
			return
		var/obj/item/light/L = I
		if(L.status)
			to_chat(user, "<span class='warning'>This bulb is too damaged to use as a replacement!</span>")
			return
		if(do_after(user, 50, src))
			qdel(I)
			helmet = new helmettype(src)
			to_chat(user, "<span class='notice'>You have successfully repaired [src]'s helmet.</span>")
			new /obj/item/light/bulb/broken(drop_location())
	return ..()

/obj/item/clothing/suit/space/hardsuit/equipped(mob/user, slot)
	..()
	if(jetpack)
		if(slot == ITEM_SLOT_OCLOTHING)
			for(var/X in jetpack.actions)
				var/datum/action/A = X
				A.Grant(user)

/obj/item/clothing/suit/space/hardsuit/dropped(mob/user)
	..()
	if(jetpack)
		for(var/X in jetpack.actions)
			var/datum/action/A = X
			A.Remove(user)

/obj/item/clothing/suit/space/hardsuit/item_action_slot_check(slot)
	if(slot == ITEM_SLOT_OCLOTHING) //we only give the mob the ability to toggle the helmet if he's wearing the hardsuit.
		return 1

	//Engineering
/obj/item/clothing/head/helmet/space/hardsuit/engine
	name = "engineering hardsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low-pressure environment. Has radiation shielding."
	icon_state = "hardsuit0-engineering"
	item_state = "eng_helm"
	armor = list("melee" = 30, "bullet" = 5, "laser" = 10, "energy" = 20, "bomb" = 10, "bio" = 100, "rad" = 75, "fire" = 100, "acid" = 75)
	hardsuit_type = "engineering"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/space/hardsuit/engine
	name = "engineering hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has radiation shielding."
	icon_state = "hardsuit-engineering"
	item_state = "eng_hardsuit"
	armor = list("melee" = 30, "bullet" = 5, "laser" = 10, "energy" = 20, "bomb" = 10, "bio" = 100, "rad" = 75, "fire" = 100, "acid" = 75)
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/engine
	resistance_flags = FIRE_PROOF

	//Atmospherics
/obj/item/clothing/head/helmet/space/hardsuit/engine/atmos
	name = "atmospherics hardsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low-pressure environment. Has thermal shielding."
	icon_state = "hardsuit0-atmospherics"
	item_state = "atmo_helm"
	hardsuit_type = "atmospherics"
	armor = list("melee" = 30, "bullet" = 5, "laser" = 10, "energy" = 20, "bomb" = 10, "bio" = 100, "rad" = 25, "fire" = 100, "acid" = 75)
	heat_protection = HEAD												//Uncomment to enable firesuit protection
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/suit/space/hardsuit/engine/atmos
	name = "atmospherics hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has thermal shielding."
	icon_state = "hardsuit-atmospherics"
	item_state = "atmo_hardsuit"
	armor = list("melee" = 30, "bullet" = 5, "laser" = 10, "energy" = 20, "bomb" = 10, "bio" = 100, "rad" = 25, "fire" = 100, "acid" = 75)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS					//Uncomment to enable firesuit protection
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/engine/atmos


	//Chief Engineer's hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/engine/elite
	name = "advanced hardsuit helmet"
	desc = "An advanced helmet designed for work in a hazardous, low pressure environment. Shines with a high polish."
	icon_state = "hardsuit0-white"
	item_state = "ce_helm"
	hardsuit_type = "white"
	armor = list("melee" = 40, "bullet" = 5, "laser" = 10, "energy" = 20, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 90)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/suit/space/hardsuit/engine/elite
	icon_state = "hardsuit-white"
	name = "advanced hardsuit"
	desc = "An advanced suit that protects against hazardous, low pressure environments. Shines with a high polish."
	item_state = "ce_hardsuit"
	armor = list("melee" = 40, "bullet" = 5, "laser" = 10, "energy" = 20, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 90)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/engine/elite
	jetpack = /obj/item/tank/jetpack/suit

	//Mining hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/mining
	name = "frontier hardsuit helmet"
	desc = "A mass-produced, brandless helmet designed for work in hazardous, low pressure environments. Carries limited protection against a number of threats and dual floodlights."
	icon_state = "hardsuit0-mining"
	item_state = "mining_helm"
	hardsuit_type = "mining"
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF
	heat_protection = HEAD
	armor = list("melee" = 30, "bullet" = 5, "laser" = 10, "energy" = 20, "bomb" = 50, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 75)
	light_range = 7
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/resonator, /obj/item/mining_scanner, /obj/item/t_scanner/adv_mining_scanner, /obj/item/gun/energy/kinetic_accelerator)

/obj/item/clothing/head/helmet/space/hardsuit/mining/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/space/hardsuit/mining
	name = "frontier hardsuit"
	desc = "A widely-produced suit design, possessing limited shielding against a robust variety of threats, and patch points for further reinforcement."
	icon_state = "hardsuit-mining"
	item_state = "mining_hardsuit"
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF
	armor = list("melee" = 30, "bullet" = 5, "laser" = 10, "energy" = 20, "bomb" = 50, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 75)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/storage/bag/ore, /obj/item/pickaxe)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/mining
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	custom_price = 2000
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION

/obj/item/clothing/suit/space/hardsuit/mining/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

	//Heavy Mining Hardsuit, bought from Cargo.
/obj/item/clothing/suit/space/hardsuit/mining/heavy
	name = "heavy mining hardsuit"
	desc = "A heavy frontier operations hardsuit, generally carried by purpose-built mining vessels travelling to highly dangerous locales. Possesses enhanced chemical and enviromental resistance, thick armor plating, and attach points for field reinforcement."
	icon_state = "hardsuit-hvymining"
	item_state = "hvymining_hardsuit"
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list("melee" = 35, "bullet" = 15, "laser" = 25, "energy" = 25, "bomb" = 55, "bio" = 100, "rad" = 85, "fire" = 85, "acid" = 100)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/storage/bag/ore, /obj/item/pickaxe)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/mining/heavy
	custom_price = 4500

/obj/item/clothing/head/helmet/space/hardsuit/mining/heavy
	name = "heavy mining helmet"
	desc = "The helmet for a heavy frontier operations hardsuit. Though somewhat cramped, it offers advanced braincase protection against a variety of dangers common to far frontier orebreaking work."
	icon_state = "hardsuit0-hvymining"
	item_state = "hvymining_helm"
	hardsuit_type = "hvymining"
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list("melee" = 35, "bullet" = 15, "laser" = 15, "energy" = 20, "bomb" = 55, "bio" = 100, "rad" = 75, "fire" = 85, "acid" = 100)
	light_range = 10

	//Syndicate hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/syndi
	name = "blood-red hardsuit helmet"
	desc = "A dual-mode advanced hardsuit designed for special combat operations. It is in EVA mode. Produced by the Gorlex Marauders."
	alt_desc = "A dual-mode advanced hardsuit designed for special combat operations. It is in combat mode. Produced by the Gorlex Marauders."
	icon_state = "hardsuit1-syndi"
	item_state = "syndie_helm"
	hardsuit_type = "syndi"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)
	on = TRUE
	var/obj/item/clothing/suit/space/hardsuit/syndi/linkedsuit = null
	actions_types = list(/datum/action/item_action/toggle_helmet_mode)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDEEARS
	visor_flags = STOPSPRESSUREDAMAGE
	var/full_retraction = FALSE //whether or not our full face is revealed or not during combat mode

/obj/item/clothing/head/helmet/space/hardsuit/syndi/update_icon_state()
	icon_state = "hardsuit[on]-[hardsuit_type]"
	return ..()

/obj/item/clothing/head/helmet/space/hardsuit/syndi/Initialize()
	. = ..()
	if(istype(loc, /obj/item/clothing/suit/space/hardsuit/syndi))
		linkedsuit = loc

/obj/item/clothing/head/helmet/space/hardsuit/syndi/attack_self(mob/user) //Toggle Helmet
	if(!isturf(user.loc))
		to_chat(user, "<span class='warning'>You cannot toggle your helmet while in this [user.loc]!</span>" )
		return
	on = !on
	if(on || force)
		to_chat(user, "<span class='notice'>You switch your hardsuit to EVA mode, sacrificing speed for space protection.</span>")
		name = initial(name)
		desc = initial(desc)
		set_light_on(TRUE)
		clothing_flags |= visor_flags
		cold_protection |= HEAD
		if(full_retraction)
			flags_cover |= HEADCOVERSEYES | HEADCOVERSMOUTH
		else
			flags_cover |= HEADCOVERSMOUTH
		flags_inv |= visor_flags_inv
	else
		to_chat(user, "<span class='notice'>You switch your hardsuit to combat mode, sacrificing space protection for improved speed.</span>")
		name += " (combat)"
		desc = alt_desc
		set_light_on(FALSE)
		clothing_flags &= ~visor_flags
		cold_protection &= ~HEAD
		if(full_retraction)
			flags_cover &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
		else
			flags_cover &= ~(HEADCOVERSMOUTH)
		flags_inv &= ~visor_flags_inv
	update_appearance()
	playsound(src.loc, 'sound/mecha/mechmove03.ogg', 50, TRUE)
	toggle_hardsuit_mode(user)
	user.update_inv_head()
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/space/hardsuit/syndi/proc/toggle_hardsuit_mode(mob/user) //Helmet Toggles Suit Mode
	if(linkedsuit)
		if(on)
			linkedsuit.name = initial(linkedsuit.name)
			linkedsuit.desc = initial(linkedsuit.desc)
			linkedsuit.clothing_flags |= STOPSPRESSUREDAMAGE
			linkedsuit.cold_protection |= CHEST | GROIN | LEGS | FEET | ARMS | HANDS
		else
			linkedsuit.name += " (combat)"
			linkedsuit.desc = linkedsuit.alt_desc
			linkedsuit.clothing_flags &= ~STOPSPRESSUREDAMAGE
			linkedsuit.cold_protection &= ~(CHEST | GROIN | LEGS | FEET | ARMS | HANDS)
			if(linkedsuit.lightweight)
				linkedsuit.flags_inv &= ~(HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT)

		linkedsuit.icon_state = "hardsuit[on]-[hardsuit_type]"
		linkedsuit.update_appearance()
		user.update_inv_wear_suit()
		user.update_inv_w_uniform()
		user.update_equipment_speed_mods()


/obj/item/clothing/suit/space/hardsuit/syndi
	name = "blood-red hardsuit"
	desc = "A dual-mode advanced hardsuit designed for special combat operations. It is in EVA mode. Produced by the Gorlex Marauders."
	alt_desc = "A dual-mode advanced hardsuit designed for special combat operations. It is in combat mode. Produced by the Gorlex Marauders."
	icon_state = "hardsuit1-syndi"
	item_state = "syndie_hardsuit"
	hardsuit_type = "syndi"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)
	allowed = list(/obj/item/gun, /obj/item/ammo_box,/obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi
	jetpack = /obj/item/tank/jetpack/suit
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION
	slowdown = 0.5
	var/lightweight = 0 //used for flags when toggling

//Ramzi Syndie suit
/obj/item/clothing/head/helmet/space/hardsuit/syndi/ramzi
	name = "rust-red hardsuit helmet"
	desc = "A beat-up standardized dual-mode helmet derived from more advanced special operations helmets, its red rusted into a dirty brown. It is in EVA mode. Manufactured by Ramzi Clique."
	alt_desc = "A beat-up standardized dual-mode helmet derived from more advanced special operations helmets, its red rusted into a dirty brown. It is in combat mode. Manufactured by Ramzi Clique."
	icon_state = "hardsuit1-ramzi"
	item_state = "hardsuit1-ramzi"
	hardsuit_type = "ramzi"
	armor = list("melee" = 35, "bullet" = 25, "laser" = 20,"energy" = 40, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)

/obj/item/clothing/suit/space/hardsuit/syndi/ramzi
	name = "rust-red hardsuit"
	desc = "A beat-up standardized dual-mode hardsuit derived from more advanced special operations hardsuits, its red rusted into a dirty brown. It is in EVA mode. Manufactured by Ramzi Clique."
	alt_desc = "A beat-up standardized dual-mode hardsuit derived from more advanced special operations hardsuits, its red rusted into a dirty brown. It is in combat mode. Manufactured by Ramzi Clique."
	icon_state = "hardsuit1-ramzi"
	item_state = "hardsuit1-ramzi"
	hardsuit_type = "ramzi"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/ramzi
	jetpack = null
	armor = list("melee" = 35, "bullet" = 25, "laser" = 20,"energy" = 40, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)
	slowdown = 0.7
	jetpack = null

//Elite Syndie suit
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite
	name = "elite syndicate hardsuit helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. It is in EVA mode. Property of Gorlex Marauders."
	alt_desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. It is in combat mode. Property of Gorlex Marauders."
	icon_state = "hardsuit0-syndielite"
	hardsuit_type = "syndielite"
	armor = list("melee" = 60, "bullet" = 60, "laser" = 50, "energy" = 60, "bomb" = 55, "bio" = 100, "rad" = 70, "fire" = 100, "acid" = 100)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	full_retraction = TRUE

/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/debug

/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/debug/Initialize()
	. = ..()
	soundloop.volume = 0

/obj/item/clothing/suit/space/hardsuit/syndi/elite
	name = "elite syndicate hardsuit"
	desc = "An elite version of the syndicate hardsuit, with improved armour and fireproofing. It is in travel mode."
	alt_desc = "An elite version of the syndicate hardsuit, with improved armour and fireproofing. It is in combat mode."
	icon_state = "hardsuit0-syndielite"
	item_state = "elitesyndie_hardsuit"
	hardsuit_type = "syndielite"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite
	armor = list("melee" = 60, "bullet" = 60, "laser" = 50, "energy" = 60, "bomb" = 55, "bio" = 100, "rad" = 70, "fire" = 100, "acid" = 100)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION

/obj/item/clothing/suit/space/hardsuit/syndi/elite/debug
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/debug

//Cybersun Hardsuit
/obj/item/clothing/suit/space/hardsuit/syndi/cybersun
	name = "neutron-star combat hardsuit"
	desc = "Designed with fighting Nanotrasen weapons in mind, the Cybersun combat hardsuit trades ballistic and blunt protection for top grade laser protection. It is in EVA mode. Produced by Cybersun Industries."
	alt_desc = "Designed with fighting Nanotrasen weapons in mind, the Cybersun combat hardsuit trades ballistic and blunt protection for top grade laser protection. It is in combat mode. Produced by Cybersun Industries."
	icon_state = "hardsuit1-cybersun"
	hardsuit_type = "cybersun"
	armor = list("melee" = 25, "bullet" = 25, "laser" = 50, "energy" = 50, "bomb" = 25, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 60)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/cybersun
	supports_variations = VOX_VARIATION

/obj/item/clothing/head/helmet/space/hardsuit/syndi/cybersun
	name = "neutron-star combat hardsuit helmet"
	desc = "Designed with fighting Nanotrasen weapons in mind, the Cybersun combat hardsuit trades ballistic and blunt protection for top grade laser protection. It is in EVA mode. Produced by Cybersun Industries."
	alt_desc = "Designed with fighting Nanotrasen weapons in mind, the Cybersun combat hardsuit trades ballistic and blunt protection for top grade laser protection. It is in combat mode. Produced by Cybersun Industries."
	icon_state = "hardsuit1-cybersun"
	hardsuit_type = "cybersun"
	armor = list("melee" = 25, "bullet" = 25, "laser" = 50, "energy" = 50, "bomb" = 25, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 60)

//Cybersun Medical Techinician Hardsuit
/obj/item/clothing/suit/space/hardsuit/syndi/cybersun/paramed
	name = "cybersun medical technician hardsuit"
	desc = "A stripped down version of the neutron-star hardsuit for use by medical technicians. It is in EVA mode. Produced by Cybersun Industries."
	alt_desc = "A stripped down version of the neutron-star hardsuit for use by medical technicians. It is in combat mode. Produced by Cybersun Industries."
	icon_state = "hardsuit1-cyberparamed"
	hardsuit_type = "cyberparamed"
	armor = list("melee" = 25, "bullet" = 25, "laser" = 35, "energy" = 40, "bomb" = 10, "bio" = 100, "rad" = 65, "fire" = 75, "acid" = 40)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/cybersun/paramed
	supports_variations = VOX_VARIATION
	jetpack = null

/obj/item/clothing/head/helmet/space/hardsuit/syndi/cybersun/paramed
	name = "cybersun medical technician hardsuit helmet"
	desc = "A stripped down version of the neutron-star hardsuit for use by medical technicians. It is in EVA mode. Produced by Cybersun Industries."
	alt_desc = "A stripped down version of the neutron-star hardsuit for use by medical technicians. It is in combat mode. Produced by Cybersun Industries"
	icon_state = "hardsuit1-cyberparamed"
	hardsuit_type = "cyberparamed"
	armor = list("melee" = 25, "bullet" = 25, "laser" = 35, "energy" = 40, "bomb" = 10, "bio" = 100, "rad" = 65, "fire" = 75, "acid" = 40)

//Pointman Hardsuit
/obj/item/clothing/suit/space/hardsuit/syndi/inteq
	name = "pointman hardsuit"
	desc = "One of Inteq's strudiest and finest combat armors. It is in EVA mode. Retrofitted by the IRMG."
	alt_desc = "One of Inteq's strudiest and finest combat armors. It is in combat mode. Retrofitted by the IRMG."
	icon_state = "hardsuit1-pointman"
	hardsuit_type = "pointman"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/inteq
	supports_variations = VOX_VARIATION


/obj/item/clothing/head/helmet/space/hardsuit/syndi/inteq
	name = "pointman hardsuit helmet"
	desc = "One of Inteq's strudiest and finest combat armors. It is in EVA mode. Retrofitted by the IRMG."
	alt_desc = "One of Inteq's strudiest and finest combat armors. It is in combat mode. Retrofitted by the IRMG."
	icon_state = "hardsuit1-pointman"
	hardsuit_type = "pointman"
	full_retraction = TRUE

	//Wizard hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/wizard
	name = "gem-encrusted hardsuit helmet"
	desc = "A bizarre gem-encrusted helmet that radiates magical energies."
	icon_state = "hardsuit0-wiz"
	item_state = "wiz_helm"
	hardsuit_type = "wiz"
	resistance_flags = FIRE_PROOF | ACID_PROOF //No longer shall our kind be foiled by lone chemists with spray bottles!
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 50, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 100)
	heat_protection = HEAD												//Uncomment to enable firesuit protection
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/suit/space/hardsuit/wizard
	name = "gem-encrusted hardsuit"
	desc = "A bizarre gem-encrusted suit that radiates magical energies."
	icon_state = "hardsuit-wiz"
	item_state = "wiz_hardsuit"
	w_class = WEIGHT_CLASS_NORMAL
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 50, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 100)
	allowed = list(/obj/item/teleportation_scroll, /obj/item/tank/internals)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS					//Uncomment to enable firesuit protection
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/wizard

	//Medical hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/medical
	name = "medical hardsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Built with lightweight materials for extra comfort, but does not protect the eyes from intense light."
	icon_state = "hardsuit0-medical"
	item_state = "medical_helm"
	hardsuit_type = "medical"
	flash_protect = FLASH_PROTECTION_NONE
	armor = list("melee" = 30, "bullet" = 5, "laser" = 10, "energy" = 20, "bomb" = 10, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 75)
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL | SCAN_REAGENTS | SNUG_FIT | BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS //WS Port - Cit Internals

/obj/item/clothing/suit/space/hardsuit/medical
	name = "medical hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Built with lightweight materials for easier movement."
	icon_state = "hardsuit-medical"
	item_state = "medical_hardsuit"
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/storage/firstaid, /obj/item/healthanalyzer, /obj/item/stack/medical)
	armor = list("melee" = 30, "bullet" = 5, "laser" = 10, "energy" = 20, "bomb" = 10, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 75)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/medical
	slowdown = 0.5
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION

/obj/item/clothing/head/helmet/space/hardsuit/medical/cmo
	name = "chief medical officer's hardsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Built with lightweight materials for extra comfort and protects the eyes from intense light."
	flash_protect = 2

/obj/item/clothing/suit/space/hardsuit/medical/cmo
	name = "chief medical officer's hardsuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/medical/cmo

	//Research Director hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/rd
	name = "prototype hardsuit helmet"
	desc = "A prototype helmet designed for research in a hazardous, low pressure environment. Scientific data flashes across the visor."
	icon_state = "hardsuit0-rd"
	hardsuit_type = "rd"
	resistance_flags = ACID_PROOF | FIRE_PROOF
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	armor = list("melee" = 30, "bullet" = 5, "laser" = 10, "energy" = 20, "bomb" = 100, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 80)
	var/explosion_detection_dist = 21
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL | SCAN_REAGENTS | SNUG_FIT | BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS //WS Port - Cit Internals
	actions_types = list(/datum/action/item_action/toggle_helmet_light, /datum/action/item_action/toggle_research_scanner)

/obj/item/clothing/head/helmet/space/hardsuit/rd/Initialize()
	. = ..()
	RegisterSignal(SSdcs, COMSIG_GLOB_EXPLOSION, PROC_REF(sense_explosion))

/obj/item/clothing/head/helmet/space/hardsuit/rd/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_BASIC]
		DHUD.add_hud_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/rd/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_BASIC]
		DHUD.remove_hud_from(user)

/obj/item/clothing/head/helmet/space/hardsuit/rd/proc/sense_explosion(datum/source, turf/epicenter, devastation_range, heavy_impact_range,
		light_impact_range, took, orig_dev_range, orig_heavy_range, orig_light_range)
	var/turf/T = get_turf(src)
	if(T.z != epicenter.z)
		return
	if(get_dist(epicenter, T) > explosion_detection_dist)
		return
	display_visor_message("Explosion detected! Epicenter: [devastation_range], Outer: [heavy_impact_range], Shock: [light_impact_range]")

/obj/item/clothing/suit/space/hardsuit/rd
	name = "prototype hardsuit"
	desc = "A prototype suit that protects against hazardous, low pressure environments. Fitted with extensive plating for handling explosives and dangerous research materials."
	icon_state = "hardsuit-rd"
	item_state = "hardsuit-rd"
	resistance_flags = ACID_PROOF | FIRE_PROOF
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT //Same as an emergency firesuit. Not ideal for extended exposure.
	allowed = list(/obj/item/flashlight,
		/obj/item/tank/internals,
		/obj/item/gun/energy/wormhole_projector,
		/obj/item/hand_tele,
		/obj/item/aicard)
	armor = list("melee" = 30, "bullet" = 5, "laser" = 10, "energy" = 20, "bomb" = 100, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 80)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/rd
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION

	//Security hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/security
	name = "security hardsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Has an additional layer of armor."
	icon_state = "hardsuit0-sec"
	item_state = "sec_helm"
	hardsuit_type = "sec"
	armor = list("melee" = 35, "bullet" = 15, "laser" = 30,"energy" = 40, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)


/obj/item/clothing/suit/space/hardsuit/security
	icon_state = "hardsuit-sec"
	name = "security hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has an additional layer of armor."
	item_state = "sec_hardsuit"
	armor = list("melee" = 35, "bullet" = 15, "laser" = 30, "energy" = 40, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/security
	slowdown = 0.5
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION

/obj/item/clothing/suit/space/hardsuit/security/Initialize()
	. = ..()
	allowed = GLOB.security_hardsuit_allowed

	//Head of Security hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/security/hos
	name = "head of security's hardsuit helmet"
	desc = "A special bulky helmet designed for work in a hazardous, low pressure environment. Has an additional layer of armor."
	icon_state = "hardsuit0-hos"
	hardsuit_type = "hos"
	armor = list("melee" = 45, "bullet" = 25, "laser" = 30, "energy" = 40, "bomb" = 25, "bio" = 100, "rad" = 50, "fire" = 95, "acid" = 95)


/obj/item/clothing/suit/space/hardsuit/security/hos
	icon_state = "hardsuit-hos"
	name = "head of security's hardsuit"
	desc = "A special bulky suit that protects against hazardous, low pressure environments. Has an additional layer of armor."
	armor = list("melee" = 45, "bullet" = 25, "laser" = 30, "energy" = 40, "bomb" = 25, "bio" = 100, "rad" = 50, "fire" = 95, "acid" = 95)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/security/hos
	jetpack = /obj/item/tank/jetpack/suit
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION

	//SWAT MKII
/obj/item/clothing/head/helmet/space/hardsuit/swat
	name = "\improper MK.II SWAT Helmet"
	icon_state = "swat2helm"
	item_state = "swat2helm"
	desc = "A tactical SWAT helmet MK.II."
	armor = list("melee" = 40, "bullet" = 50, "laser" = 50, "energy" = 60, "bomb" = 50, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR //we want to see the mask //this makes the hardsuit not fireproof you genius
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	actions_types = list()

/obj/item/clothing/head/helmet/space/hardsuit/swat/attack_self()

/obj/item/clothing/suit/space/hardsuit/swat
	name = "\improper MK.II SWAT Suit"
	desc = "A MK.II SWAT suit with streamlined joints and armor made out of superior materials, insulated against intense heat if worn with the complementary gas mask. The most advanced tactical armor available."
	icon_state = "swat2"
	item_state = "swat2"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 50, "energy" = 60, "bomb" = 50, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT //this needed to be added a long fucking time ago
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/swat

/obj/item/clothing/suit/space/hardsuit/swat/Initialize()
	. = ..()
	allowed = GLOB.security_hardsuit_allowed

	//Captain
/obj/item/clothing/head/helmet/space/hardsuit/swat/captain
	name = "captain's SWAT helmet"
	icon_state = "capspace"
	item_state = "capspacehelmet"
	desc = "A tactical MK.II SWAT helmet boasting better protection and a reasonable fashion sense."

/obj/item/clothing/suit/space/hardsuit/swat/captain
	name = "captain's SWAT suit"
	desc = "A MK.II SWAT suit with streamlined joints and armor made out of superior materials, insulated against intense heat with the complementary gas mask. The most advanced tactical armor available. Usually reserved for heavy hitter corporate security, this one has a regal finish in Nanotrasen company colors. Better not let the assistants get a hold of it."
	icon_state = "caparmor"
	item_state = "capspacesuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/swat/captain

	//Old Prototype
/obj/item/clothing/head/helmet/space/hardsuit/ancient
	name = "prototype RIG hardsuit helmet"
	desc = "Early prototype RIG hardsuit helmet, designed to quickly shift over a user's head. Design constraints of the helmet mean it has no inbuilt cameras, thus it restricts the users visability."
	icon_state = "hardsuit0-ancient"
	item_state = "anc_helm"
	armor = list("melee" = 30, "bullet" = 5, "laser" = 5, "energy" = 15, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 75)
	hardsuit_type = "ancient"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/space/hardsuit/ancient
	name = "prototype RIG hardsuit"
	desc = "Prototype powered RIG hardsuit. Provides excellent protection from the elements of space while being comfortable to move around in, thanks to the powered locomotives. Remains very bulky however."
	icon_state = "hardsuit-ancient"
	item_state = "anc_hardsuit"
	armor = list("melee" = 30, "bullet" = 5, "laser" = 5, "energy" = 15, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 75)
	slowdown = 3
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ancient
	resistance_flags = FIRE_PROOF
	var/footstep = 1
	var/mob/listeningTo

/obj/item/clothing/suit/space/hardsuit/ancient/proc/on_mob_move()
	var/mob/living/carbon/human/H = loc
	if(!istype(H) || H.wear_suit != src)
		return
	if(footstep > 1)
		playsound(src, 'sound/effects/servostep.ogg', 100, TRUE)
		footstep = 0
	else
		footstep++

/obj/item/clothing/suit/space/hardsuit/ancient/equipped(mob/user, slot)
	. = ..()
	if(slot != ITEM_SLOT_OCLOTHING)
		if(listeningTo)
			UnregisterSignal(listeningTo, COMSIG_MOVABLE_MOVED)
		return
	if(listeningTo == user)
		return
	if(listeningTo)
		UnregisterSignal(listeningTo, COMSIG_MOVABLE_MOVED)
	RegisterSignal(user, COMSIG_MOVABLE_MOVED, PROC_REF(on_mob_move))
	listeningTo = user

/obj/item/clothing/suit/space/hardsuit/ancient/dropped()
	. = ..()
	if(listeningTo)
		UnregisterSignal(listeningTo, COMSIG_MOVABLE_MOVED)

/obj/item/clothing/suit/space/hardsuit/ancient/Destroy()
	listeningTo = null
	return ..()

/////////////SHIELDED//////////////////////////////////

/obj/item/clothing/suit/space/hardsuit/shielded
	name = "shielded hardsuit"
	desc = "A hardsuit with built in energy shielding. Will rapidly recharge when not under fire."
	icon_state = "hardsuit-hos"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/security/hos
	allowed = null
	armor = list("melee" = 30, "bullet" = 15, "laser" = 30, "energy" = 40, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	var/current_charges = 3
	var/max_charges = 3 //How many charges total the shielding has
	var/recharge_delay = 200 //How long after we've been shot before we can start recharging. 20 seconds here
	var/recharge_cooldown = 0 //Time since we've last been shot
	var/recharge_rate = 1 //How quickly the shield recharges once it starts charging
	var/shield_state = "shield-old"
	var/shield_on = "shield-old"

/obj/item/clothing/suit/space/hardsuit/shielded/Initialize()
	. = ..()
	if(!allowed)
		allowed = GLOB.advanced_hardsuit_allowed

/obj/item/clothing/suit/space/hardsuit/shielded/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	recharge_cooldown = world.time + recharge_delay
	if(current_charges > 0)
		var/datum/effect_system/spark_spread/s = new
		s.set_up(2, 1, src)
		s.start()
		owner.visible_message("<span class='danger'>[owner]'s shields deflect [attack_text] in a shower of sparks!</span>")
		current_charges--
		if(recharge_rate)
			START_PROCESSING(SSobj, src)
		if(current_charges <= 0)
			owner.visible_message("<span class='warning'>[owner]'s shield overloads!</span>")
			shield_state = "broken"
			owner.update_inv_wear_suit()
		return 1
	return 0


/obj/item/clothing/suit/space/hardsuit/shielded/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/suit/space/hardsuit/shielded/process()
	if(world.time > recharge_cooldown && current_charges < max_charges)
		current_charges = clamp((current_charges + recharge_rate), 0, max_charges)
		playsound(loc, 'sound/magic/charge.ogg', 50, TRUE)
		if(current_charges == max_charges)
			playsound(loc, 'sound/machines/ding.ogg', 50, TRUE)
			STOP_PROCESSING(SSobj, src)
		shield_state = "[shield_on]"
		if(ishuman(loc))
			var/mob/living/carbon/human/C = loc
			C.update_inv_wear_suit()

/obj/item/clothing/suit/space/hardsuit/shielded/worn_overlays(isinhands)
	. = ..()
	if(!isinhands)
		. += mutable_appearance('icons/effects/effects.dmi', shield_state, MOB_LAYER + 0.01)

/obj/item/clothing/head/helmet/space/hardsuit/shielded
	resistance_flags = FIRE_PROOF | ACID_PROOF

///////////////Capture the Flag////////////////////

/obj/item/clothing/suit/space/hardsuit/shielded/ctf
	name = "white shielded hardsuit"
	desc = "Standard issue hardsuit for playing capture the flag."
	icon_state = "ert_medical"
	item_state = "ert_medical"
	hardsuit_type = "ert_medical"
	// Adding TRAIT_NODROP is done when the CTF spawner equips people
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/shielded/ctf
	armor = list("melee" = 0, "bullet" = 30, "laser" = 30, "energy" = 40, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 95, "acid" = 95)
	slowdown = 0
	max_charges = 5

/obj/item/clothing/suit/space/hardsuit/shielded/ctf/red
	name = "red shielded hardsuit"
	icon_state = "ert_security"
	item_state = "ert_security"
	hardsuit_type = "ert_security"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/shielded/ctf/red
	shield_state = "shield-red"
	shield_on = "shield-red"

/obj/item/clothing/suit/space/hardsuit/shielded/ctf/blue
	name = "blue shielded hardsuit"
	desc = "Standard issue hardsuit for playing capture the flag."
	icon_state = "ert_command"
	item_state = "ert_command"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/shielded/ctf/blue



/obj/item/clothing/head/helmet/space/hardsuit/shielded/ctf
	name = "shielded hardsuit helmet"
	desc = "Standard issue hardsuit helmet for playing capture the flag."
	icon_state = "hardsuit0-ert_medical"
	item_state = "hardsuit0-ert_medical"
	hardsuit_type = "ert_medical"
	armor = list("melee" = 0, "bullet" = 30, "laser" = 30, "energy" = 40, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 95, "acid" = 95)


/obj/item/clothing/head/helmet/space/hardsuit/shielded/ctf/red
	icon_state = "hardsuit0-ert_security"
	item_state = "hardsuit0-ert_security"
	hardsuit_type = "ert_security"

/obj/item/clothing/head/helmet/space/hardsuit/shielded/ctf/blue
	name = "shielded hardsuit helmet"
	desc = "Standard issue hardsuit helmet for playing capture the flag."
	icon_state = "hardsuit0-ert_commander"
	item_state = "hardsuit0-ert_commander"
	hardsuit_type = "ert_commander"





//////Syndicate Version

/obj/item/clothing/suit/space/hardsuit/shielded/syndi
	name = "blood-red hardsuit"
	desc = "An advanced hardsuit with built in energy shielding."
	icon_state = "hardsuit1-syndi"
	item_state = "syndie_hardsuit"
	hardsuit_type = "syndi"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 100)
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/shielded/syndi
	slowdown = 0.5
	shield_state = "shield-red"
	shield_on = "shield-red"
	jetpack = /obj/item/tank/jetpack/suit

/obj/item/clothing/suit/space/hardsuit/shielded/syndi/multitool_act(mob/living/user, obj/item/I)
	. = ..()
	if(shield_state == "broken")
		to_chat(user, "<span class='warning'>You can't interface with the hardsuit's software if the shield's broken!</span>")
		return

	if(shield_state == "shield-red")
		shield_state = "shield-old"
		shield_on = "shield-old"
		to_chat(user, "<span class='warning'>You roll back the hardsuit's software, changing the shield's color!</span>")

	else
		shield_state = "shield-red"
		shield_on = "shield-red"
		to_chat(user, "<span class='warning'>You update the hardsuit's hardware, changing back the shield's color to red.</span>")
	user.update_inv_wear_suit()

/obj/item/clothing/head/helmet/space/hardsuit/shielded/syndi
	name = "blood-red hardsuit helmet"
	desc = "An advanced hardsuit helmet with built in energy shielding."
	icon_state = "hardsuit1-syndi"
	item_state = "syndie_helm"
	hardsuit_type = "syndi"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 100)

///SWAT version
/obj/item/clothing/suit/space/hardsuit/shielded/swat
	name = "death commando spacesuit"
	desc = "An advanced hardsuit favored by commandos for use in special operations."
	icon_state = "deathsquad"
	item_state = "swat_suit"
	hardsuit_type = "syndi"
	max_charges = 4
	current_charges = 4
	recharge_delay = 15
	armor = list("melee" = 80, "bullet" = 80, "laser" = 50, "energy" = 60, "bomb" = 100, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)
	strip_delay = 130
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/shielded/swat
	dog_fashion = /datum/dog_fashion/back/deathsquad

/obj/item/clothing/head/helmet/space/hardsuit/shielded/swat
	name = "death commando helmet"
	desc = "A tactical helmet with built in energy shielding."
	icon_state = "deathsquad"
	item_state = "deathsquad"
	hardsuit_type = "syndi"
	armor = list("melee" = 80, "bullet" = 80, "laser" = 50, "energy" = 60, "bomb" = 100, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)
	strip_delay = 130
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	actions_types = list()

///////////////Shiptest Additions////////////////////

//Softsuit helmet light framework
/obj/item/clothing/head/helmet/space/light
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	var/on = FALSE
	light_color = "#FFCC66"
	light_power = 0.8
	light_system = MOVABLE_LIGHT_DIRECTIONAL
	light_range = 4
	light_power = 1
	light_on = FALSE
	on = FALSE

/obj/item/clothing/head/helmet/space/light/attack_self(mob/living/user)
	toggle_helmet_light(user)

/obj/item/clothing/head/helmet/space/light/proc/toggle_helmet_light(mob/living/user)
	on = !on
	if(on)
		turn_on(user)
	else
		turn_off(user)
	update_appearance()

/obj/item/clothing/head/helmet/space/light/update_icon_state()
	if(on)
		icon_state = "[initial(icon_state)]-on"
		item_state = "[initial(icon_state)]-on"
	else
		icon_state = "[initial(icon_state)]"
		item_state = "[initial(icon_state)]"
	return ..()

/obj/item/clothing/head/helmet/space/light/proc/turn_on(mob/user)
	set_light_on(TRUE)

/obj/item/clothing/head/helmet/space/light/proc/turn_off(mob/user)
	set_light_on(FALSE)

////Independents

	//Security
/obj/item/clothing/head/helmet/space/hardsuit/security/independent
	name = "security hardsuit helmet"
	desc = "An obsolete, surplus helmet designed for work in hazardous, low pressure environments. Well-armored, if somewhat claustrophobic."
	icon_state = "hardsuit0-independent-sec"
	item_state = "independent_sec_helm"
	hardsuit_type = "independent-sec"
	armor = list("melee" = 35, "bullet" = 25, "laser" = 20,"energy" = 40, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)
	supports_variations = VOX_VARIATION | SNOUTED_VARIATION

/obj/item/clothing/suit/space/hardsuit/security/independent
	icon_state = "hardsuit-independent-sec"
	name = "security hardsuit"
	desc = "An obsolete, surplus suit that protects against hazardous, low pressure environments. Though bulky, it has significant armor protection for its age. <br> Dating from well before the war, old surplus suits such as this can be found in the service of various local police and private security organizations across known space."
	icon_state = "hardsuit-independent-sec"
	item_state = "independent_sec_hardsuit"
	hardsuit_type = "independent-sec"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/security/independent
	armor = list("melee" = 35, "bullet" = 25, "laser" = 20, "energy" = 40, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)
	supports_variations = VOX_VARIATION | DIGITIGRADE_VARIATION

	//Mining
/obj/item/clothing/head/helmet/space/hardsuit/mining/independent
	name = "mining hardsuit helmet"
	desc = "An inexpensive helmet designed for work in hazardous, low pressure environments. Its open cage design provides excellent visibility."
	icon_state = "hardsuit0-independent-mining"
	item_state = "independent_mining_helm"
	hardsuit_type = "independent-mining"
	armor = list("melee" = 30, "bullet" = 10, "laser" = 5, "energy" = 20, "bomb" = 50, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 75)

/obj/item/clothing/suit/space/hardsuit/mining/independent
	name = "mining hardsuit"
	desc = "An inexpensive, widespread suit designed for work in hazardous, low pressure environments. Equipped with extra plating against blunt impacts and other common threats as well as a powerful shoulder-mounted floodlight. <br> Suits like this are a common sight among miners on the frontier, frequently equipped with additional improvised plating."
	icon_state = "hardsuit0-independent-mining"
	item_state = "independent_mining_hardsuit"
	hardsuit_type = "independent-mining"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/mining/independent
	armor = list("melee" = 30, "bullet" = 10, "laser" = 5, "energy" = 20, "bomb" = 50, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 75)

	//Engineer Softsuit
/obj/item/clothing/suit/space/engineer
	name = "engineering space suit"
	icon_state = "space-independent-eng"
	item_state = "space-independent-eng"
	desc = "A civilian space suit designed for construction and salvage in hazardous, low-pressure environments. Has shielding against radiation and heat and abundant storage.<br>Though they lack the physical protection of more expensive hardsuits, this type of suit is extremely common wherever construction and salvage work must be done in open space."
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 20, "bomb" = 0, "bio" = 100, "rad" = 75, "fire" = 100, "acid" = 75)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/exo/large
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/helmet/space/light/engineer
	name = "engineering space helmet"
	icon_state = "space-independent-eng"
	item_state = "space-independent-eng"
	desc = "A space helmet designed for construction and salvage in hazardous, low-pressure environments, with an integral hard hat and UV-shielded visor. Has shielding against radiation and heat."
	armor = list("melee" = 15, "bullet" = 5, "laser" = 20, "energy" = 10, "bomb" = 20, "bio" = 100, "rad" = 75, "fire" = 100, "acid" = 75)
	resistance_flags = FIRE_PROOF
	light_color = "#FFCC66"
	light_power = 0.8
	light_system = MOVABLE_LIGHT_DIRECTIONAL
	light_range = 4
	light_power = 1
	light_on = FALSE
	on = FALSE

	//Pilot Softsuit
/obj/item/clothing/suit/space/pilot
	name = "pilot space suit"
	icon_state = "space-pilot"
	item_state = "space-pilot"
	desc = "A lightweight, unarmored space suit designed for exosuit and shuttle pilots. Special attachment points make mounting and dismounting from exosuits much easier."
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL | FAST_EMBARK
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/exo/large

/obj/item/clothing/head/helmet/space/pilot
	name = "pilot helmet"
	icon_state = "space-pilot-plain0"
	item_state = "space-pilot-plain"
	desc = "A specialized space helmet designed for exosuit and shuttle pilots. Offers limited impact protection."
	var/skin = "plain"
	var/blurb = " Its simple design is quite ancient."
	up = FALSE
	actions_types = list(/datum/action/item_action/toggle_helmet)
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 50, "fire" = 80, "acid" = 70)
	visor_flags_inv = HIDEMASK
	visor_flags = STOPSPRESSUREDAMAGE | ALLOWINTERNALS

/obj/item/clothing/head/helmet/space/pilot/update_icon_state()
	icon_state = "space-pilot-[skin][up]"
	return ..()

/obj/item/clothing/head/helmet/space/pilot/New()
	..()
	switch(skin)
		if("plain")
			blurb = " Its simple design is quite ancient."
		if("shark")
			blurb = " It bears a classic shark mouth decoration on both cheeks."
		if("checker")
			blurb = " A bold checker stripe runs over the top of the helmet."
		if("ace")
			blurb = " A large ace of spades decorates the back of the helmet."
		if("mobius")
			blurb = " There is an unusual blue ribbon painted on the back. Something about it is strangely inspiring."
		if("viper")
			blurb = " It bears a menacing orange \"V\" on the brow. Somebody has scratched \"Speed is life\" inside the helmet."
		if("luke")
			blurb = " Strange red trefoils are painted on either side of the helmet. Wearing it gives you a headache."
		if("corvid")
			blurb = " It is sloppily painted with thin teal and red paint. There are some dark stains on the lining..."

	desc = "A specialized space helmet designed for exosuit and shuttle pilots. Offers limited impact protection.[blurb]"
	update_icon_state()

/obj/item/clothing/head/helmet/space/pilot/random/New()
	skin = pick(40;"plain", 20;"shark", 20;"checker", 20;"ace", 5;"mobius", 5;"viper", 5;"luke", 5;"corvid",)
	..()

/obj/item/clothing/head/helmet/space/pilot/attack_self(mob/user) //pilot helmet toggle
	if(!isturf(user.loc))
		to_chat(user, "<span class='warning'>You cannot toggle your helmet while in this [user.loc]!</span>" )
		return
	up = !up
	if(!up || force)
		to_chat(user, "<span class='notice'>You close your helmet's visor and breathing mask.</span>")
		gas_transfer_coefficient = initial(gas_transfer_coefficient)
		permeability_coefficient = initial(permeability_coefficient)
		clothing_flags |= visor_flags
		flags_cover |= HEADCOVERSEYES | HEADCOVERSMOUTH
		flags_inv |= visor_flags_inv
		cold_protection |= HEAD
	else
		to_chat(user, "<span class='notice'>You open your helmet's visor and breathing mask.</span>")
		gas_transfer_coefficient = null
		permeability_coefficient = null
		clothing_flags &= ~visor_flags
		flags_cover &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
		flags_inv &= ~visor_flags_inv
		cold_protection &= ~HEAD
	update_appearance()
	playsound(src.loc, 'sound/mecha/mechmove03.ogg', 50, TRUE)
	user.update_inv_head()
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

//Inteq Hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/security/independent/inteq
	name = "inteq hardsuit helmet"
	desc = "A somewhat boxy, monocular visored helmet designed for hazardous, low pressure environments. It has the letters 'IRMG' imprinted onto the earpad."
	icon_state = "hardsuit0-inteq"
	item_state = "hardsuit-inteq"
	hardsuit_type = "inteq"

/obj/item/clothing/suit/space/hardsuit/security/independent/inteq
	name = "inteq hardsuit"
	desc = "A heavy-duty looking suit that protects against hazardous, low pressure environments. It's bulk provides ample protection, if not a bit cumbersome to wear."
	icon_state = "hardsuit-inteq"
	item_state = "hardsuit-inteq"
	hardsuit_type = "inteq"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/security/independent/inteq
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION

/obj/item/clothing/head/helmet/space/hardsuit/solgov
	name = "\improper SolGov hardsuit helmet"
	desc = "An armored spaceproof helmet, its visor is reminiscent of knights of yore."
	icon_state = "hardsuit0-solgov"
	item_state = "hardsuit0-solgov"
	hardsuit_type = "solgov"
	armor = list("melee" = 50, "bullet" = 45, "laser" = 40, "energy" = 30, "bomb" = 60, "bio" = 100, "rad" = 60, "fire" = 90, "acid" = 75)

/obj/item/clothing/suit/space/hardsuit/solgov
	icon_state = "hardsuit_solgov"
	name = "\improper SolGov hardsuit"
	desc = "An armored spaceproof suit. A powered exoskeleton keeps the suit light and mobile."
	item_state = "hardsuit_solgov"
	armor = list("melee" = 50, "bullet" = 45, "laser" = 40, "energy" = 30, "bomb" = 60, "bio" = 100, "rad" = 60, "fire" = 90, "acid" = 75) //intentionally the fucking strong, this is master chief-tier armor //is this really what you call the strong?? is this the best solgov has to offer??????
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/solgov
	allowed = list(/obj/item/gun, /obj/item/ammo_box,/obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	slowdown = 0.5
	supports_variations = DIGITIGRADE_VARIATION

/obj/item/clothing/head/helmet/space/hardsuit/quixote
	name = "\improper Quixote mobility hardsuit helmet"
	desc = "The integrated helmet of a Quixote mobility hardsuit."
	icon_state = "hardsuit0-quixote"
	item_state = "quixote-helm"
	max_integrity = 300
	armor = list("melee" = 50, "bullet" = 40, "laser" = 40, "energy" = 25, "bomb" = 50, "bio" = 100, "rad" = 60, "fire" = 50, "acid" = 100)
	hardsuit_type = "quixote"
	max_heat_protection_temperature = 20000

/obj/item/clothing/suit/space/hardsuit/quixote
	name = "\improper Quixote mobility hardsuit"
	desc = "The Quixote mobility suit is the magnum opus of Phorsman equipment, combining durable composite armor with high mobility thrusters."
	icon_state = "quixotesuit"
	item_state = "quixotesuit"
	max_integrity = 300
	armor = list("melee" = 50, "bullet" = 40, "laser" = 40, "energy" = 25, "bomb" = 50, "bio" = 100, "rad" = 60, "fire" = 50, "acid" = 100)
	allowed = list(/obj/item/gun, /obj/item/flashlight, /obj/item/tank/internals, /obj/item/ammo_box)
	actions_types = list(/datum/action/item_action/toggle_helmet)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/quixote
	jetpack = /obj/item/tank/jetpack/suit
	slowdown = 0.3
	max_heat_protection_temperature = 20000
	var/datum/action/innate/quixotejump/jump

/obj/item/clothing/suit/space/hardsuit/quixote/Initialize()
	. = ..()
	jump = new(src)

/obj/item/clothing/suit/space/hardsuit/quixote/Destroy()
	QDEL_NULL(jump)
	return ..()

/obj/item/clothing/suit/space/hardsuit/quixote/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_OCLOTHING)
		jump.Grant(user)
		user.update_icons()
	else //If it is equipped in any slot except for our outer clothing, we can't dash
		jump.Remove(user)
		user.update_icons()

/obj/item/clothing/suit/space/hardsuit/quixote/dropped(mob/user)
	. = ..()
	jump.Remove(user)
	user.update_icons()

/obj/item/clothing/suit/space/hardsuit/quixote/ui_action_click(mob/user, action)
	if(action == /datum/action/innate/quixotejump)
		jump.Activate()
	else
		return ..()

/obj/item/clothing/head/helmet/space/hardsuit/quixote/dimensional
	name = "\improper Quixote metaspacial hardsuit helmet"
	desc = "The integrated helmet of a Quixote metaspace navigation hardsuit."
	armor = list("melee" = 50, "bullet" = 40, "laser" = 40, "energy" = 35, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)

/obj/item/clothing/suit/space/hardsuit/quixote/dimensional
	name = "\improper Quixote metaspacial hardsuit"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 40, "energy" = 35, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)
	desc = "The Quixote metaspacial mobility suit is the magnum opus of dimensional navigation equipment, combining durable composite armor with high mobility thrusters and defensive plating rated for all manner of exotic particles."
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/quixote/dimensional
