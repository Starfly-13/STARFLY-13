/obj/item/storage/guncase
	name = "gun case"
	desc = "A large box designed for holding firearms and magazines safely."
	icon = 'icons/obj/guncase.dmi'
	icon_state = "guncase"
	lefthand_file = 'icons/mob/inhands/equipment/toolbox_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/toolbox_righthand.dmi'
	item_state = "infiltrator_case"
	force = 12
	throwforce = 12
	throw_speed = 2
	throw_range = 7
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("robusted")
	hitsound = 'sound/weapons/smash.ogg'
	drop_sound = 'sound/items/handling/toolbox_drop.ogg'
	pickup_sound = 'sound/items/handling/toolbox_pickup.ogg'
	custom_materials = list(/datum/material/iron = 500)
	var/max_items = 10
	var/max_w_class = WEIGHT_CLASS_BULKY
	var/gun_type
	var/mag_type
	var/mag_count = 2
	var/ammoless = TRUE
	var/grab_loc = FALSE
	var/holdable_items = list(
		/obj/item/gun,
		/obj/item/ammo_box,
		/obj/item/stock_parts/cell/gun
	)

/obj/item/storage/guncase/Initialize(mapload)
	. = ..()
	if(mapload && grab_loc)
		var/items_eaten = 0
		for(var/obj/item/I in loc)
			if(I.w_class > max_w_class)
				continue
			if(is_type_in_list(I, holdable_items))
				I.forceMove(src)
				items_eaten++
			if(items_eaten >= mag_count + 1)
				break

/obj/item/storage/guncase/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = max_items
	STR.max_w_class = max_w_class
	STR.set_holdable(holdable_items)

/obj/item/storage/guncase/PopulateContents()
	if(grab_loc)
		return
	if(gun_type)
		new gun_type(src, ammoless)
	if(mag_type)
		for(var/i in 1 to mag_count)
			if(ispath(mag_type, /obj/item/ammo_box) | ispath(mag_type, /obj/item/stock_parts/cell))
				new mag_type(src, ammoless)

/// Need to double check this in a seperate pr that adds this to a few ships
/// Eats the items on its tile
/obj/item/storage/guncase/inherit
	grab_loc = TRUE

/obj/item/storage/guncase/p16
/obj/item/storage/guncase/p16/PopulateContents()
	new /obj/item/gun/ballistic/automatic/assault/p16/no_mag(src)
	new /obj/item/ammo_box/magazine/p16/empty(src)
	new /obj/item/ammo_box/magazine/p16/empty(src)

/obj/item/storage/guncase/pistol
	name = "pistol case"
	desc = "A large box designed for holding pistols and magazines safely."
	max_items = 8
	max_w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/pistolcase/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 8
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.set_holdable(list(
		/obj/item/gun,
		/obj/item/ammo_box/,
		/obj/item/stock_parts/cell/gun
		))

/obj/item/storage/pistolcase/modelh
/obj/item/storage/pistolcase/modelh/PopulateContents()
	new /obj/item/gun/ballistic/automatic/powered/gauss/modelh/no_mag(src)
	new /obj/item/ammo_box/magazine/modelh/empty(src)
	new /obj/item/ammo_box/magazine/modelh/empty(src)

/obj/item/storage/pistolcase/stechkin
/obj/item/storage/pistolcase/stechkin/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/syndicate/no_mag(src)
	new /obj/item/ammo_box/magazine/m10mm_ringneck/empty(src)
	new /obj/item/ammo_box/magazine/m10mm_ringneck/empty(src)

/obj/item/storage/pistolcase/candor
/obj/item/storage/pistolcase/candor/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/candor/no_mag(src)
	new /obj/item/ammo_box/magazine/m45/empty(src)
	new /obj/item/ammo_box/magazine/m45/empty(src)

/obj/item/storage/pistolcase/candornew
/obj/item/storage/pistolcase/candornew/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/candor/factory/no_mag(src)
	new /obj/item/ammo_box/magazine/m45/empty(src)
	new /obj/item/ammo_box/magazine/m45/empty(src)

/obj/item/storage/pistolcase/detective
/obj/item/storage/pistolcase/detective/PopulateContents()
	new /obj/item/gun/ballistic/revolver/detective/no_mag(src)
	new /obj/item/ammo_box/c38/empty(src)
	new /obj/item/ammo_box/c38/empty(src)

/obj/item/storage/pistolcase/shadow
/obj/item/storage/pistolcase/shadow/PopulateContents()
	new /obj/item/gun/ballistic/revolver/shadow/no_mag(src)

/obj/item/storage/pistolcase/commander
/obj/item/storage/pistolcase/commander/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/commander/no_mag(src)
	new /obj/item/ammo_box/magazine/co9mm/empty(src)
	new /obj/item/ammo_box/magazine/co9mm/empty(src)

/obj/item/storage/pistolcase/firebrand
/obj/item/storage/pistolcase/firebrand/PopulateContents()
	new /obj/item/gun/ballistic/revolver/firebrand/no_mag(src)

/obj/item/storage/pistolcase/derringer
/obj/item/storage/pistolcase/derringer/PopulateContents()
	new /obj/item/gun/ballistic/derringer/empty(src)

/obj/item/storage/pistolcase/a357
/obj/item/storage/pistolcase/a357/PopulateContents()
	new /obj/item/gun/ballistic/revolver/no_mag(src)
	new /obj/item/ammo_box/a357/empty(src)
	new /obj/item/ammo_box/a357/empty(src)

/obj/item/storage/pistolcase/montagne
/obj/item/storage/pistolcase/montagne/PopulateContents()
	new /obj/item/gun/ballistic/revolver/montagne/no_mag(src)
	new /obj/item/ammo_box/a44roum_speedloader/empty(src)
	new /obj/item/ammo_box/a44roum_speedloader/empty(src)


/obj/item/storage/pistolcase/disposable
/obj/item/storage/pistolcase/disposable/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/disposable(src)
	new /obj/item/gun/ballistic/automatic/pistol/disposable(src)

/obj/item/storage/pistolcase/laser
/obj/item/storage/pistolcase/laser/PopulateContents()
	new /obj/item/gun/energy/laser/empty_cell(src)
	new /obj/item/stock_parts/cell/gun(src)

/obj/item/storage/pistolcase/egun
/obj/item/storage/pistolcase/egun/PopulateContents()
	new /obj/item/gun/energy/laser/empty_cell(src)
	new /obj/item/stock_parts/cell/gun(src)

/obj/item/storage/pistolcase/kalixpistol
/obj/item/storage/pistolcase/kalixpistol/PopulateContents()
	new /obj/item/gun/energy/kalix/pistol/empty_cell(src)
	new /obj/item/stock_parts/cell/gun/kalix(src)

/obj/item/storage/guncase/kalixrifle
/obj/item/storage/guncase/kalixrifle/PopulateContents()
	new /obj/item/gun/energy/kalix/empty_cell(src)
	new /obj/item/stock_parts/cell/gun/kalix(src)

/obj/item/storage/pistolcase/miniegun
/obj/item/storage/pistolcase/miniegun/PopulateContents()
	new /obj/item/gun/energy/e_gun/empty_cell(src)
	new /obj/item/stock_parts/cell/gun/mini(src)

/obj/item/storage/pistolcase/iongun
/obj/item/storage/pistolcase/iongun/PopulateContents()
	new /obj/item/gun/energy/ionrifle/empty_cell(src)
	new /obj/item/stock_parts/cell/gun(src)

/// Need to double check this in a seperate pr that adds this to a few ships
/// Eats the items on its tile
/obj/item/storage/guncase/pistol/inherit
	grab_loc = TRUE
