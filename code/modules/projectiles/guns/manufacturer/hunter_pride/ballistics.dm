///Hunters Pride Weapons

///Revolvers

/obj/item/gun/ballistic/revolver/montagne
	name = "\improper HP Montagne"
	desc = "An ornate break-open revolver chambered in .44."
	icon = 'icons/obj/guns/manufacturer/hunterspride/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/hunterspride/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/hunterspride/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/hunterspride/onmob.dmi'

	icon_state = "montagne"
	item_state = "hp_generic"
	manufacturer = MANUFACTURER_HUNTERSPRIDE
	spread_unwielded = 15
	recoil = 0

	default_ammo_type = /obj/item/ammo_box/magazine/internal/cylinder/rev44/montagne
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/cylinder/rev44/montagne,
	)

/obj/item/gun/ballistic/revolver/montagne/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/ammo_hud/revolver)

EMPTY_GUN_HELPER(revolver/montagne)

/obj/item/gun/ballistic/revolver/ashhand
	name = "HP Ashhand"
	desc = "A massive, long-barreled revolver often used as protection against big game. Can only be reloaded one cartridge at a time due to its reinforced frame. Uses .45-70 ammo."
	icon = 'icons/obj/guns/manufacturer/hunterspride/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/hunterspride/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/hunterspride/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/hunterspride/onmob.dmi'

	icon_state = "ashhand"
	item_state = "ashhand"
	default_ammo_type = /obj/item/ammo_box/magazine/internal/cylinder/rev4570
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/cylinder/rev4570,
	)
	fire_sound = 'sound/weapons/gun/revolver/shot_hunting.ogg'
	rack_sound = 'sound/weapons/gun/revolver/viper_prime.ogg'
	manufacturer = MANUFACTURER_HUNTERSPRIDE
	gate_loaded = TRUE
	fire_delay = 0.6 SECONDS
	wield_slowdown = HEAVY_REVOLVER_SLOWDOWN
	spread_unwielded = 20
	spread = 6
	recoil = 2
	recoil_unwielded = 4

/obj/item/gun/ballistic/revolver/ashhand/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/ammo_hud/revolver)

/obj/item/gun/ballistic/revolver/firebrand
	name = "\improper HP Firebrand"
	desc = "An archaic precursor to revolver-type firearms, this gun was rendered completely obsolete millennia ago. While fast to fire, it is extremely inaccurate. Uses .357 ammo."
	icon_state = "pepperbox"
	item_state = "hp_generic_fresh"
	icon = 'icons/obj/guns/manufacturer/hunterspride/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/hunterspride/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/hunterspride/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/hunterspride/onmob.dmi'

	default_ammo_type = /obj/item/ammo_box/magazine/internal/cylinder/pepperbox
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/cylinder/pepperbox,
	)
	spread = 20
	manufacturer = MANUFACTURER_HUNTERSPRIDE
	spread_unwielded = 50
	fire_delay = 0 SECONDS
	gate_offset = 4
	semi_auto = TRUE
	safety_wording = "safety"

EMPTY_GUN_HELPER(revolver/firebrand)

/obj/item/gun/ballistic/revolver/shadow
	name = "\improper HP Shadow"
	desc = "A mid-size revolver. Despite the antiquated design, it is cheap, reliable, and stylish, making it a favorite among fast-drawing spacers and the officers of various militaries, as well as small-time police units. Chambered in .44."
	fire_sound = 'sound/weapons/gun/revolver/cattleman.ogg'
	icon = 'icons/obj/guns/manufacturer/hunterspride/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/hunterspride/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/hunterspride/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/hunterspride/onmob.dmi'
	icon_state = "shadow"
	item_state = "shadow"

	default_ammo_type = /obj/item/ammo_box/magazine/internal/cylinder/rev44
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/cylinder/rev44,
	)
	manufacturer = MANUFACTURER_HUNTERSPRIDE
	obj_flags = UNIQUE_RENAME
	gate_loaded = TRUE
	unique_reskin = list(\
		"Shadow" = "shadow",
		"Cattleman" = "shadow_cattleman",
		"General" = "shadow_general",
		"Sheriff" = "shadow_sheriff",
		"Cobra" = "shadow_cobra",
		"Hired Gun" = "shadow_hiredgun",
		"Buntline" = "shadow_buntline",
		"Cavalry" = "shadow_cavalry",
		"Lanchester Special" = "shadow_lanchester"
		)

	recoil = 0 //weaker than normal revolver, no recoil
	spread_unwielded = 10

/obj/item/gun/ballistic/revolver/shadow/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/ammo_hud/revolver)

/obj/item/gun/ballistic/revolver/shadow/reskin_obj(mob/M)
	. = ..()
	if(current_skin)
		item_state = unique_reskin[current_skin]

EMPTY_GUN_HELPER(revolver/shadow)

/obj/item/gun/ballistic/revolver/detective
	name = "\improper HP Detective Special"
	desc = "A small law enforcement firearm. Originally commissioned by Nanotrasen for their Private Investigation division, it has become extremely popular among independent civilians as a cheap, compact sidearm. Uses .38 Special rounds."
	fire_sound = 'sound/weapons/gun/revolver/shot_light.ogg'
	icon_state = "detective"
	item_state = "hp_generic"
	icon = 'icons/obj/guns/manufacturer/hunterspride/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/hunterspride/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/hunterspride/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/hunterspride/onmob.dmi'

	default_ammo_type = /obj/item/ammo_box/magazine/internal/cylinder/rev38
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/cylinder/rev38,
	)
	obj_flags = UNIQUE_RENAME
	semi_auto = TRUE //double action
	safety_wording = "safety"
	unique_reskin = list("Default" = "detective",
		"Stainless Steel" = "detective_stainless",
		"Gold Trim" = "detective_gold",
		"Leopard Spots" = "detective_leopard",
		"The Peacemaker" = "detective_peacemaker",
		"Black Panther" = "detective_panther"
		)
	w_class = WEIGHT_CLASS_SMALL
	manufacturer = MANUFACTURER_HUNTERSPRIDE

	recoil = 0 //weaker than normal revolver, no recoil
	fire_delay = 0.2 SECONDS

EMPTY_GUN_HELPER(revolver/detective)

/obj/item/gun/ballistic/revolver/detective/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/ammo_hud/revolver) //note that the hud at the moment only supports 6 round revolvers, 7 or 5 isn't supported rn
//...why...?
/obj/item/gun/ballistic/revolver/detective/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0, burst_firing = FALSE, spread_override = 0, iteration = 0)
	if(magazine.caliber != initial(magazine.caliber))
		if(prob(100 - (magazine.ammo_count() * 5)))	//minimum probability of 70, maximum of 95
			playsound(user, fire_sound, fire_sound_volume, vary_fire_sound)
			to_chat(user, "<span class='userdanger'>[src] blows up in your face!</span>")
			user.take_bodypart_damage(0,20)
			explosion(src, 0, 0, 1, 1)
			user.dropItemToGround(src)
			return 0
	..()

/obj/item/gun/ballistic/revolver/detective/screwdriver_act(mob/living/user, obj/item/I)
	if(..())
		return TRUE
	if(magazine.caliber == "38")
		to_chat(user, "<span class='notice'>You begin to reinforce the barrel of [src]...</span>")
		if(magazine.ammo_count())
			afterattack(user, user)	//you know the drill
			user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='userdanger'>[src] goes off in your face!</span>")
			return TRUE
		if(I.use_tool(src, user, 30))
			if(magazine.ammo_count())
				to_chat(user, "<span class='warning'>You can't modify it!</span>")
				return TRUE
			magazine.caliber = ".357"
			fire_sound = 'sound/weapons/gun/revolver/shot.ogg'
			desc = "The barrel and chamber assembly seems to have been modified."
			to_chat(user, "<span class='notice'>You reinforce the barrel of [src]. Now it will fire .357 rounds.</span>")
	else
		to_chat(user, "<span class='notice'>You begin to revert the modifications to [src]...</span>")
		if(magazine.ammo_count())
			afterattack(user, user)	//and again
			user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='userdanger'>[src] goes off in your face!</span>")
			return TRUE
		if(I.use_tool(src, user, 30))
			if(magazine.ammo_count())
				to_chat(user, "<span class='warning'>You can't modify it!</span>")
				return
			magazine.caliber = ".38"
			fire_sound = 'sound/weapons/gun/revolver/shot.ogg'
			desc = initial(desc)
			to_chat(user, "<span class='notice'>You remove the modifications on [src]. Now it will fire .38 rounds.</span>")
	return TRUE

///pistols

/obj/item/gun/ballistic/automatic/pistol/candor
	name = "\improper Candor"
	desc = "A classic semi-automatic handgun, widely popular throughout the Frontier. An engraving on the slide marks it as a product of Hunter's Pride. Chambered in .45."
	icon_state = "candor"
	item_state = "hp_generic"
	icon = 'icons/obj/guns/manufacturer/hunterspride/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/hunterspride/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/hunterspride/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/hunterspride/onmob.dmi'

	default_ammo_type = /obj/item/ammo_box/magazine/m45
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/m45,
	)
	fire_sound = 'sound/weapons/gun/pistol/candor.ogg'
	rack_sound = 'sound/weapons/gun/pistol/candor_cocked.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/candor_cocked.ogg'
	manufacturer = MANUFACTURER_HUNTERSPRIDE
	load_sound = 'sound/weapons/gun/pistol/candor_reload.ogg'
	load_empty_sound = 'sound/weapons/gun/pistol/candor_reload.ogg'
	eject_sound = 'sound/weapons/gun/pistol/candor_unload.ogg'
	eject_empty_sound = 'sound/weapons/gun/pistol/candor_unload.ogg'
	show_magazine_on_sprite = TRUE

NO_MAG_GUN_HELPER(automatic/pistol/candor)

/obj/item/gun/ballistic/automatic/pistol/candor/factory
	desc = "A classic semi-automatic handgun, widely popular throughout the Frontier. An engraving on the slide marks it as a product of 'Hunter's Pride Arms and Ammunition'. This example has been kept in especially good shape, and may as well be fresh out of the workshop. Chambered in .45."
	item_state = "hp_generic_fresh"

NO_MAG_GUN_HELPER(automatic/pistol/candor/factory)

/obj/item/gun/ballistic/automatic/pistol/candor/factory/update_overlays()
	. = ..()
	. += "[initial(icon_state)]_factory"

/obj/item/gun/ballistic/automatic/pistol/candor/phenex
	name = "\improper HP Phenex"
	desc = "A uniquely modified version of the Candor, famously created by Hunter's Pride. This finish was released as a part of a limited-time promotion in 2563. Chambered in .45."
	icon_state = "phenex"
	item_state = "hp_phenex"

/// SMG ///

/obj/item/gun/ballistic/automatic/smg/firestorm //weapon designed by Apogee-dev
	name = "HP Firestorm"
	desc = "An unconventional submachinegun that was quickly discontinued due to questionable sales, making it a rare and valuable find for collectors. Chambered in .45."
	icon = 'icons/obj/guns/manufacturer/hunterspride/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/hunterspride/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/hunterspride/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/hunterspride/onmob.dmi'

	icon_state = "firestorm"
	item_state = "firestorm"
	default_ammo_type = /obj/item/ammo_box/magazine/c45_firestorm_mag
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/c45_firestorm_mag,
	)
	unique_mag_sprites_for_variants = TRUE
	burst_size = 1
	actions_types = list()
	fire_delay = 0.13 SECONDS
	bolt_type = BOLT_TYPE_OPEN
	rack_sound = 'sound/weapons/gun/smg/uzi_cocked.ogg'
	fire_sound = 'sound/weapons/gun/smg/firestorm.ogg'


	manufacturer = MANUFACTURER_HUNTERSPRIDE
	wield_slowdown = SMG_SLOWDOWN

/obj/item/gun/ballistic/automatic/smg/firestorm/pan //spawns with pan magazine, can take sticks instead of just drums, not sure where this would be used, maybe erts?
	default_ammo_type = /obj/item/ammo_box/magazine/c45_firestorm_mag/pan

///Shotguns

/////////////////////////////
// DOUBLE BARRELED SHOTGUN //
/////////////////////////////

/obj/item/gun/ballistic/shotgun/doublebarrel
	name = "double-barreled shotgun"
	desc = "A classic break action shotgun, hand-made in a Hunter's Pride workshop. Both barrels can be fired in quick succession or even simultaneously. Guns like this have been popular with hunters, sporters, and criminals for millennia. Chambered in 12g."
	sawn_desc = "A break action shotgun cut down to the size of a sidearm. While the recoil is even harsher, it offers a lot of power in a very small package. Chambered in 12g."

	icon = 'icons/obj/guns/manufacturer/hunterspride/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/hunterspride/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/hunterspride/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/hunterspride/onmob.dmi'

	base_icon_state = "dshotgun"

	icon_state = "dshotgun"
	item_state = "dshotgun"

	rack_sound = 'sound/weapons/gun/shotgun/dbshotgun_break.ogg'
	bolt_drop_sound = 'sound/weapons/gun/shotgun/dbshotgun_close.ogg'

	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM
	force = 10
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BACK
	default_ammo_type = /obj/item/ammo_box/magazine/internal/shot/dual
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/shot/dual,
	)

	obj_flags = UNIQUE_RENAME
	unique_reskin = list("Default" = "dshotgun",
						"Stainless Steel" = "dshotgun_white",
						"Stained Green" = "dshotgun_green"
						)
	semi_auto = TRUE
	can_be_sawn_off = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT
	pb_knockback = 3 // it's a super shotgun!
	manufacturer = MANUFACTURER_HUNTERSPRIDE
	bolt_wording = "barrel"

	burst_delay = 0.05 SECONDS
	burst_size = 2
	gun_firemodes = list(FIREMODE_SEMIAUTO, FIREMODE_BURST)
	default_firemode = FIREMODE_SEMIAUTO

/obj/item/gun/ballistic/shotgun/doublebarrel/unique_action(mob/living/user)
	if (bolt_locked == FALSE)
		to_chat(user, "<span class='notice'>You snap open the [bolt_wording] of \the [src].</span>")
		playsound(src, rack_sound, rack_sound_volume, rack_sound_vary)
		chambered = null
		var/num_unloaded = 0
		for(var/obj/item/ammo_casing/casing_bullet in get_ammo_list(FALSE, TRUE))
			casing_bullet.forceMove(drop_location())
			var/angle_of_movement =(rand(-3000, 3000) / 100) + dir2angle(turn(user.dir, 180))
			casing_bullet.AddComponent(/datum/component/movable_physics, _horizontal_velocity = rand(450, 550) / 100, _vertical_velocity = rand(400, 450) / 100, _horizontal_friction = rand(20, 24) / 100, _z_gravity = PHYSICS_GRAV_STANDARD, _z_floor = 0, _angle_of_movement = angle_of_movement, _bounce_sound = casing_bullet.bounce_sfx_override)

			num_unloaded++
			SSblackbox.record_feedback("tally", "station_mess_created", 1, casing_bullet.name)
		if (num_unloaded)
			playsound(user, eject_sound, eject_sound_volume, eject_sound_vary)
			update_appearance()
		bolt_locked = TRUE
		update_appearance()
		return
	drop_bolt(user)

/obj/item/gun/ballistic/shotgun/doublebarrel/drop_bolt(mob/user = null)
	playsound(src, bolt_drop_sound, bolt_drop_sound_volume, FALSE)
	if (user)
		to_chat(user, "<span class='notice'>You snap the [bolt_wording] of \the [src] closed.</span>")
	chamber_round()
	bolt_locked = FALSE
	update_appearance()

/obj/item/gun/ballistic/shotgun/doublebarrel/can_shoot()
	if (bolt_locked)
		return FALSE
	return ..()

/obj/item/gun/ballistic/shotgun/doublebarrel/attackby(obj/item/A, mob/user, params)
	if (!bolt_locked)
		to_chat(user, "<span class='notice'>The [bolt_wording] is shut closed!</span>")
		return
	return ..()

/obj/item/gun/ballistic/shotgun/doublebarrel/update_icon_state()
	. = ..()
	if(current_skin)
		icon_state = "[unique_reskin[current_skin]][sawn_off ? "_sawn" : ""][bolt_locked ? "_open" : ""]"
	else
		icon_state = "[base_icon_state || initial(icon_state)][sawn_off ? "_sawn" : ""][bolt_locked ? "_open" : ""]"


/obj/item/gun/ballistic/shotgun/doublebarrel/AltClick(mob/user)
	. = ..()
	if(unique_reskin && !current_skin && user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY) && (!bolt_locked))
		reskin_obj(user)

/obj/item/gun/ballistic/shotgun/doublebarrel/sawoff(forced = FALSE)
	. = ..()
	if(.)
		weapon_weight = WEAPON_MEDIUM
		wield_slowdown = wield_slowdown-0.1
		wield_delay = 0.3 SECONDS //OP? maybe

		spread = 8
		spread_unwielded = 15
		recoil = 3 //or not
		recoil_unwielded = 5
		item_state = "dshotgun_sawn"
		mob_overlay_state = item_state

EMPTY_GUN_HELPER(shotgun/doublebarrel)

// sawn off beforehand
/obj/item/gun/ballistic/shotgun/doublebarrel/presawn
	name = "sawn-off double-barreled shotgun"
	desc = "A break action shotgun cut down to the size of a sidearm. While the recoil is even harsher, it offers a lot of power in a very small package. Chambered in 12g."
	sawn_off = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT

	wield_slowdown = 0.15
	wield_delay = 0.3 SECONDS //OP? maybe

	spread = 8
	spread_unwielded = 15
	recoil = 3 //or not
	recoil_unwielded = 5
	item_state = "dshotgun_sawn"
	default_ammo_type = /obj/item/ammo_box/magazine/internal/shot/dual/lethal
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/shot/dual/lethal,
	)

EMPTY_GUN_HELPER(shotgun/doublebarrel/presawn)

/obj/item/gun/ballistic/shotgun/doublebarrel/roumain
	name = "HP antique double-barreled shotgun"
	desc = "A special-edition shotgun hand-made by Hunter's Pride with a high-quality walnut stock inlaid with brass scrollwork. A weapon of such elegant build is a rare find outside of the grips of collectors. Otherwise functionally identical to a common double-barreled shotgun. Chambered in 12g."
	sawn_desc = "A special-edition Hunter's Pride shotgun, cut down to the size of a sidearm by some barbarian. The brass inlay on the stock and engravings on the barrel have been obliterated in the process, destroying any value beyond its use as a crude sidearm."
	base_icon_state = "dshotgun_srm"
	icon_state = "dshotgun_srm"
	item_state = "dshotgun_srm"
	unique_reskin = null

/obj/item/gun/ballistic/shotgun/doublebarrel/roumain/sawoff(forced = FALSE)
	. = ..()
	if(.)
		item_state = "dshotgun_srm_sawn"

// BRIMSTONE //

/obj/item/gun/ballistic/shotgun/brimstone
	name = "HP Brimstone"
	desc = "A simple and sturdy pump-action shotgun sporting a 5-round capacity, manufactured by Hunter's Pride. Found widely throughout the Frontier in the hands of hunters, pirates, police, and countless others. Chambered in 12g."
	sawn_desc = "A stockless and shortened pump-action shotgun. The worsened recoil and accuracy make it a poor sidearm anywhere beyond punching distance."
	fire_sound = 'sound/weapons/gun/shotgun/brimstone.ogg'
	icon = 'icons/obj/guns/manufacturer/hunterspride/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/hunterspride/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/hunterspride/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/hunterspride/onmob.dmi'

	icon_state = "brimstone"
	item_state = "brimstone"

	gun_firemodes = list(FIREMODE_FULLAUTO)
	default_firemode = FIREMODE_FULLAUTO

	default_ammo_type = /obj/item/ammo_box/magazine/internal/shot/lethal
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/shot/lethal,
	)
	manufacturer = MANUFACTURER_HUNTERSPRIDE
	fire_delay = 0.05 SECONDS //slamfire
	rack_delay = 0.2 SECONDS

	can_be_sawn_off = TRUE


/obj/item/gun/ballistic/shotgun/brimstone/sawoff(forced = FALSE)
	. = ..()
	if(.)
		weapon_weight = WEAPON_MEDIUM
		wield_slowdown = wield_slowdown-0.1
		wield_delay = 0.3 SECONDS //OP? maybe

		spread = 18
		spread_unwielded = 25
		recoil = 5 //your punishment for sawing off an short shotgun
		recoil_unwielded = 8
		item_state = "illestren_factory_sawn" // i couldnt care about making another sprite, looks close enough
		mob_overlay_state = item_state

EMPTY_GUN_HELPER(shotgun/brimstone)

// HELLFIRE //

/obj/item/gun/ballistic/shotgun/hellfire
	name = "HP Hellfire"
	desc = "A hefty pump-action riot shotgun with a seven-round tube, manufactured by Hunter's Pride. Especially popular among the Frontier's police forces. Chambered in 12g."
	icon = 'icons/obj/guns/manufacturer/hunterspride/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/hunterspride/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/hunterspride/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/hunterspride/onmob.dmi'
	icon_state = "hellfire"
	item_state = "hellfire"

	default_ammo_type = /obj/item/ammo_box/magazine/internal/shot/riot
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/shot/riot,
	)
	sawn_desc = "Come with me if you want to live."
	can_be_sawn_off = TRUE
	rack_sound = 'sound/weapons/gun/shotgun/rack_alt.ogg'
	fire_delay = 0.1 SECONDS

/obj/item/gun/ballistic/shotgun/hellfire/sawoff(forced = FALSE)
	. = ..()
	if(.)
		var/obj/item/ammo_box/magazine/internal/tube = magazine
		tube.max_ammo = 5 //this makes the gun so much worse

		weapon_weight = WEAPON_MEDIUM
		wield_slowdown = wield_slowdown-0.1
		wield_delay = 0.3 SECONDS //OP? maybe

		spread = 8
		spread_unwielded = 15
		recoil = 3 //or not
		recoil_unwielded = 5
		item_state = "dshotgun_sawn" // ditto
		mob_overlay_state = item_state

EMPTY_GUN_HELPER(shotgun/hellfire)

/obj/item/gun/ballistic/shotgun/flamingarrow/conflagration
	name = "HP Conflagration"
	base_icon_state = "conflagration"
	icon_state = "conflagration"
	item_state = "conflagration"
	fire_sound = 'sound/weapons/gun/shotgun/shot.ogg'
	desc = "A lightweight lever-action shotgun with a 5 round ammunition capacity. The lever action allows it to be cycled quickly and acurrately. In theory, you could ever operate it one-handed. Chambered in 12g."
	sawn_desc = "A lever action shotgun that's been sawed down for portability. The recoil makes it mostly useless outside of point-blank range, but it hits hard for its size and, more importantly, can be flipped around stylishly."
	default_ammo_type = /obj/item/ammo_box/magazine/internal/shot/winchester/conflagration
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/shot/winchester/conflagration,
	)

/obj/item/gun/ballistic/shotgun/flamingarrow/conflagration/sawoff(forced = FALSE)
	. = ..()
	if(.)
		var/obj/item/ammo_box/magazine/internal/tube = magazine
		tube.max_ammo = 5

		item_state = "beacon_factory_sawn"
		mob_overlay_state = item_state
		weapon_weight = WEAPON_MEDIUM

		wield_slowdown = wield_slowdown-0.1
		wield_delay = 0.2 SECONDS

		spread = 4
		spread_unwielded = 12

		recoil = 0
		recoil_unwielded = 3

EMPTY_GUN_HELPER(shotgun/flamingarrow/conflagration)


//Elephant Gun
/obj/item/gun/ballistic/shotgun/doublebarrel/twobore
	name = "HP Huntsman"
	desc = "A comically huge double-barreled rifle replete with brass inlays depicting flames and naturalistic scenes, clearly meant for the nastiest monsters the Frontier has to offer. If you want an intact trophy, don't aim for the head. Chambered in two-bore."
	icon = 'icons/obj/guns/manufacturer/hunterspride/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/hunterspride/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/hunterspride/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/hunterspride/onmob.dmi'
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	base_icon_state = "huntsman"
	icon_state = "huntsman"
	item_state = "huntsman"
	unique_reskin = null
	attack_verb = list("bludgeoned", "smashed")
	default_ammo_type = /obj/item/ammo_box/magazine/internal/shot/twobore
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/shot/twobore,
	)
	w_class = WEIGHT_CLASS_BULKY
	force = 20 //heavy ass elephant gun, why wouldnt it be
	recoil = 4
	pb_knockback = 12
	fire_sound = 'sound/weapons/gun/shotgun/quadfire.ogg'
	rack_sound = 'sound/weapons/gun/shotgun/quadrack.ogg'
	load_sound = 'sound/weapons/gun/shotgun/quadinsert.ogg'

	can_be_sawn_off = FALSE
	fire_sound_volume = 80
	rack_sound_volume = 50
	manufacturer = MANUFACTURER_HUNTERSPRIDE

	gun_firemodes = list(FIREMODE_SEMIAUTO) //no dual burst for you
	default_firemode = FIREMODE_SEMIAUTO

/// Rifles

/obj/item/gun/ballistic/rifle/illestren
	name = "\improper HP Illestren"
	desc = "A sturdy and conventional bolt-action rifle. One of Hunter's Pride's most successful firearms, the Illestren is popular among colonists, pirates, snipers, and countless others. Chambered in 8x50mmR."
	icon_state = "illestren"
	item_state = "illestren"
	icon = 'icons/obj/guns/manufacturer/hunterspride/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/hunterspride/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/hunterspride/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/hunterspride/onmob.dmi'

	sawn_desc = "An Illestren rifle sawn down to a ridiculously small size. There was probably a reason it wasn't made this short to begin with, but it still packs a punch."
	eject_sound = 'sound/weapons/gun/rifle/vickland_unload.ogg'
	eject_empty_sound = 'sound/weapons/gun/rifle/vickland_unload.ogg'

	internal_magazine = FALSE
	default_ammo_type = /obj/item/ammo_box/magazine/illestren_a850r
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/illestren_a850r,
	)
	empty_autoeject = TRUE
	eject_sound_vary = FALSE
	can_be_sawn_off = TRUE
	manufacturer = MANUFACTURER_HUNTERSPRIDE

/obj/item/gun/ballistic/rifle/illestren/empty //i had to name it empty instead of no_mag because else it wouldnt work with guncases. sorry!
	default_ammo_type = FALSE

/obj/item/gun/ballistic/rifle/illestren/sawoff(forced = FALSE)
	. = ..()
	if(.)
		spread = 19
		spread_unwielded = 30
		item_state = "illestren_sawn"
		mob_overlay_state = item_state
		weapon_weight = WEAPON_MEDIUM //you can fire it onehanded, makes it worse than worse than useless onehanded, but you can

/obj/item/gun/ballistic/rifle/illestren/blow_up(mob/user)
	. = FALSE
	if(chambered && chambered.BB)
		process_fire(user, user, FALSE)
		. = TRUE

/obj/item/gun/ballistic/rifle/illestren/factory
	desc = "A sturdy and conventional bolt-action rifle. One of Hunter's Pride's most successful firearms, this example has been kept in excellent shape and may as well be fresh out of the workshop. Chambered in 8x50mmR."
	icon_state = "illestren_factory"
	item_state = "illestren_factory"

/obj/item/gun/ballistic/rifle/illestren/sawoff(forced = FALSE)
	. = ..()
	if(.)
		item_state = "illestren_factory_sawn"
		mob_overlay_state = item_state

/obj/item/gun/ballistic/rifle/illestren/sawn
	desc = "An Illestren rifle sawn down to a ridiculously small size. There was probably a reason it wasn't made this short to begin with, but it still packs a punch."
	sawn_off = TRUE

//Lever-Action Rifles

/obj/item/gun/ballistic/shotgun/flamingarrow
	name = "HP Flaming Arrow"
	desc = "A sturdy and lightweight lever-action rifle with hand-stamped Hunter's Pride marks on the receiver. A popular choice among Frontier homesteaders for hunting small game and rudimentary self-defense. Chambered in .38."
	sawn_desc = "A lever-action rifle that has been sawed down and modified for extra portability. While surprisingly effective as a sidearm, the more important benefit is how much cooler it looks."
	base_icon_state = "flamingarrow"
	icon_state = "flamingarrow"
	item_state = "flamingarrow"
	icon = 'icons/obj/guns/manufacturer/hunterspride/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/hunterspride/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/hunterspride/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/hunterspride/onmob.dmi'
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	default_ammo_type = /obj/item/ammo_box/magazine/internal/shot/winchester
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/shot/winchester,
	)
	fire_sound = 'sound/weapons/gun/rifle/flamingarrow.ogg'
	rack_sound = 'sound/weapons/gun/rifle/skm_cocked.ogg'
	bolt_wording = "lever"
	cartridge_wording = "bullet"
	can_be_sawn_off = TRUE

	wield_slowdown = RIFLE_SLOWDOWN
	wield_delay = 0.65 SECONDS

	spread = -5
	spread_unwielded = 7

	recoil = 0
	recoil_unwielded = 2

EMPTY_GUN_HELPER(shotgun/flamingarrow)

/obj/item/gun/ballistic/shotgun/flamingarrow/update_icon_state()
	. = ..()
	if(current_skin)
		icon_state = "[unique_reskin[current_skin]][sawn_off ? "_sawn" : ""]"
	else
		icon_state = "[base_icon_state || initial(icon_state)][sawn_off ? "_sawn" : ""]"


/obj/item/gun/ballistic/shotgun/flamingarrow/rack(mob/user = null)
	. = ..()
	if(!wielded)
		SpinAnimation(7,1)

/obj/item/gun/ballistic/shotgun/flamingarrow/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	var/fan = FALSE
	if(HAS_TRAIT(user, TRAIT_GUNSLINGER) && !semi_auto && wielded_fully && loc == user && !safety)
		fan = TRUE
		fire_delay = 0.35 SECONDS
	. = ..()
	fire_delay = src::fire_delay
	if(fan)
		rack()
		to_chat(user, "<span class='notice'>You quickly rack the [bolt_wording] of \the [src]!</span>")
		balloon_alert_to_viewers("quickly racks!")
		fire_delay = 0 SECONDS

/obj/item/gun/ballistic/shotgun/flamingarrow/sawoff(forced = FALSE)
	. = ..()
	if(.)
		var/obj/item/ammo_box/magazine/internal/tube = magazine
		tube.max_ammo = 7

		item_state = "flamingarrow_sawn"
		mob_overlay_state = item_state
		weapon_weight = WEAPON_MEDIUM

		wield_slowdown = wield_slowdown-0.1
		wield_delay = 0.2 SECONDS //THE COWBOY RIFLE

		spread = 4
		spread_unwielded = 12

		recoil = 0
		recoil_unwielded = 3

/obj/item/gun/ballistic/shotgun/flamingarrow/factory
	desc = "A sturdy and lightweight lever-action rifle with hand-stamped Hunter's Pride marks on the receiver. This example has been kept in excellent shape and may as well be fresh out of the workshop. Chambered in .38."
	icon_state = "flamingarrow_factory"
	base_icon_state = "flamingarrow_factory"
	item_state = "flamingarrow_factory"

/obj/item/gun/ballistic/shotgun/flamingarrow/factory/sawoff(forced = FALSE)
	. = ..()
	if(.)
		item_state = "flamingarrow_factory_sawn"
		mob_overlay_state = item_state

/obj/item/gun/ballistic/shotgun/flamingarrow/bolt
	name = "HP Flaming Bolt"
	desc = "A sturdy, excellently-made lever-action rifle. This one appears to be a genuine antique, kept in incredibly good condition despite its advanced age. Chambered in .38."
	base_icon_state = "flamingbolt"
	icon_state = "flamingbolt"
	item_state = "flamingbolt"

/obj/item/gun/ballistic/shotgun/flamingarrow/bolt/sawoff(forced = FALSE)
	. = ..()
	if(.)
		item_state = "flamingbolt_sawn"
		mob_overlay_state = item_state

/obj/item/gun/ballistic/shotgun/flamingarrow/absolution
	name = "HP Absolution"
	base_icon_state = "absolution"
	icon_state = "absolution"
	item_state = "absolution"
	fire_sound = 'sound/weapons/gun/revolver/shot.ogg'
	desc = "A large lever-action rifle with hand-stamped Hunter's Pride marks on the receiver and an 8 round ammunition capacity. More powerful than the Flaming Arrow, the Absolution is a popular pick for hunting larger fauna like bears and goliaths, especially when a bolt action's slower rate of fire would be a liability. Chambered in .357."
	sawn_desc = "A large lever-action rifle, sawn down for portability. It looks much cooler, but you should probably be using a revolver..."
	default_ammo_type = /obj/item/ammo_box/magazine/internal/shot/winchester/absolution
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/shot/winchester/absolution,
	)

/obj/item/gun/ballistic/shotgun/flamingarrow/absolution/sawoff(forced = FALSE)
	. = ..()
	if(.)
		var/obj/item/ammo_box/magazine/internal/tube = magazine
		tube.max_ammo = 8

		item_state = "illestren_sawn"
		mob_overlay_state = item_state
		weapon_weight = WEAPON_MEDIUM

		wield_slowdown = wield_slowdown-0.1
		wield_delay = 0.2 SECONDS

		spread = 4
		spread_unwielded = 12

		recoil = 0
		recoil_unwielded = 3

//Break-Action Rifle
/obj/item/gun/ballistic/shotgun/doublebarrel/beacon
	name = "HP Beacon"
	desc = "A single-shot break-action rifle made by Hunter's Pride and sold to civilian hunters. Boasts excellent accuracy and stopping power. Uses .45-70 ammo."
	sawn_desc= "A single-shot break-action pistol chambered in .45-70. A bit difficult to aim."
	base_icon_state = "beacon"
	icon_state = "beacon"
	item_state = "beacon"
	unique_reskin = null
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	default_ammo_type = /obj/item/ammo_box/magazine/internal/shot/beacon
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/shot/beacon,
	)
	fire_sound = 'sound/weapons/gun/revolver/shot_hunting.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM
	force = 10
	obj_flags = UNIQUE_RENAME
	semi_auto = TRUE
	can_be_sawn_off = TRUE
	pb_knockback = 3
	wield_slowdown = HEAVY_RIFLE_SLOWDOWN
	spread_unwielded = 15
	spread = 0
	recoil = 0
	recoil_unwielded = 5

	gun_firemodes = list(FIREMODE_SEMIAUTO)
	default_firemode = FIREMODE_SEMIAUTO

/obj/item/gun/ballistic/shotgun/doublebarrel/beacon/sawoff(forced = FALSE)
	. = ..()
	if(.)
		item_state = "beacon_sawn"
		mob_overlay_state = item_state
		wield_slowdown = wield_slowdown-0.1
		wield_delay = 0.5 SECONDS

		spread_unwielded = 20 //mostly the hunting revolver stats
		spread = 6
		recoil = 2
		recoil_unwielded = 4

EMPTY_GUN_HELPER(shotgun/doublebarrel/beacon)

/obj/item/gun/ballistic/shotgun/doublebarrel/beacon/factory
	desc = "A single-shot break-action rifle made by Hunter's Pride and sold to civilian hunters. This example has been kept in excellent shape and may as well be fresh out of the workshop. Uses .45-70 ammo."
	sawn_desc= "A single-shot break-action pistol chambered in .45-70. A bit difficult to aim."
	base_icon_state = "beacon_factory"
	icon_state = "beacon_factory"
	item_state = "beacon_factory"

/obj/item/gun/ballistic/shotgun/doublebarrel/beacon/factory/sawoff(forced = FALSE)
	. = ..()
	if(.)
		item_state = "beacon_factory_sawn"
		mob_overlay_state = item_state

//pre sawn off beacon
/obj/item/gun/ballistic/shotgun/doublebarrel/beacon/presawn
	name = "sawn-off HP Beacon"
	sawn_desc= "A single-shot break-action pistol chambered in .45-70. A bit difficult to aim."
	sawn_off = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT

	weapon_weight = WEAPON_MEDIUM

	item_state = "beacon_sawn"
	mob_overlay_state = "beacon_sawn"
	wield_slowdown = 0.45
	wield_delay = 0.5 SECONDS

	spread_unwielded = 20 //mostly the hunting revolver stats
	spread = 6
	recoil = 2
	recoil_unwielded = 4

/// snipers

//well. its almost a sniper.
/obj/item/gun/ballistic/automatic/marksman/vickland //weapon designed by Apogee-dev
	name = "\improper Vickland"
	desc = "The Vickland is a rare semi-automatic battle rifle produced by Hunter's Pride during a limited run in 2563. It is unusual in its class for its internal rotary magazine, which must be reloaded using stripper clips. Chambered in .308."
	icon = 'icons/obj/guns/manufacturer/hunterspride/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/hunterspride/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/hunterspride/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/hunterspride/onmob.dmi'

	fire_sound = 'sound/weapons/gun/rifle/vickland.ogg'
	icon_state = "vickland"
	item_state = "vickland"
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	internal_magazine = TRUE
	default_ammo_type = /obj/item/ammo_box/magazine/internal/vickland
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/vickland,
	)
	fire_sound = 'sound/weapons/gun/rifle/vickland.ogg'

	manufacturer = MANUFACTURER_HUNTERSPRIDE
	zoomable = FALSE //no scope on it

	rack_sound = 'sound/weapons/gun/rifle/ar_cock.ogg'

	fire_delay = 0.4 SECONDS

	spread_unwielded = 25
	recoil = 0
	recoil_unwielded = 4
	wield_slowdown = DMR_SLOWDOWN

/obj/item/gun/ballistic/rifle/scout
	name = "HP Scout"
	desc = "A powerful bolt-action rifle popular among hunters and mercenaries alike, equally suited for taking down big game or two-legged game. Chambered in .300 Magnum."
	icon = 'icons/obj/guns/manufacturer/hunterspride/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/hunterspride/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/hunterspride/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/hunterspride/onmob.dmi'
	icon_state = "scout"
	item_state = "scout"

	default_ammo_type = /obj/item/ammo_box/magazine/internal/boltaction/smile
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/boltaction/smile,
	)
	fire_sound = 'sound/weapons/gun/rifle/scout.ogg'

	rack_sound = 'sound/weapons/gun/rifle/scout_bolt_out.ogg'
	bolt_drop_sound = 'sound/weapons/gun/rifle/scout_bolt_in.ogg'

	can_be_sawn_off = FALSE

	zoomable = TRUE
	zoom_amt = 10 //Long range, enough to see in front of you, but no tiles behind you.
	zoom_out_amt = 5

	recoil = 1
	recoil_unwielded = 8

	manufacturer = MANUFACTURER_HUNTERSPRIDE

