/obj/item/reagent_containers/food/drinks/breakawayflask
	name = "breakaway flask"
	desc = "A special flask designed to stabilize Illestren Bacterium and shatter violently on contact."
	icon_state = "breakawayflask"
	item_state = "breakawayflask"
	w_class = WEIGHT_CLASS_SMALL
	gulp_size = 25
	amount_per_transfer_from_this = 25
	volume = 50
	throwforce = 10
	custom_materials = list(/datum/material/glass=2500, /datum/material/plasma=500)
	max_integrity = 20
	spillable = TRUE
	resistance_flags = ACID_PROOF
	obj_flags = UNIQUE_RENAME
	drop_sound = 'sound/items/handling/drinkglass_drop.ogg'
	pickup_sound =  'sound/items/handling/drinkglass_pickup.ogg'
	custom_price = 15
	can_have_cap = TRUE
	cap_icon_state = "baflask_cap"
	cap_on = TRUE
	var/vintage = FALSE

/obj/item/reagent_containers/food/drinks/breakawayflask/on_reagent_change(changetype)
	cut_overlays()

	gulp_size = max(round(reagents.total_volume / 25), 25)
	var/datum/reagent/largest_reagent = reagents.get_master_reagent()
	if (reagents.reagent_list.len > 0)
		if(!renamedByPlayer && vintage == FALSE)
			name = largest_reagent.glass_name
			desc = largest_reagent.glass_desc
		if(largest_reagent.breakaway_flask_icon_state)
			icon_state = largest_reagent.breakaway_flask_icon_state
		else
			var/mutable_appearance/baflask_overlay = mutable_appearance(icon, "baflaskoverlay")
			icon_state = "baflaskclear"
			baflask_overlay.color = mix_color_from_reagents(reagents.reagent_list)
			add_overlay(baflask_overlay)

	else
		icon_state = "breakawayflask"
		name = "breakaway flask"
		desc = "A special flask designed to stabilize Illestren Bacterium and shatter violently on contact."
		return

/obj/item/reagent_containers/food/drinks/breakawayflask/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	spillable = TRUE
	. = ..()

/obj/item/reagent_containers/food/drinks/breakawayflask/vintage
	name = "Vintage Trickwine"
	desc = "Supposedly one of the first bottles made"
	vintage = TRUE

/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/ashwine
	name = "Vintage Ashwine"
	list_reagents = list(/datum/reagent/consumable/ethanol/trickwine/ash_wine = 45, /datum/reagent/consumable/ethanol/absinthe  = 5)
	desc = "Ashwine was originally created using herbs native to Indecipheres, as a means of relaxing after a long hunt."

/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/icewine
	name = "Vintage Icewine"
	list_reagents = list(/datum/reagent/consumable/ethanol/trickwine/ice_wine = 45, /datum/reagent/consumable/ethanol/sake = 5)
	desc = "Icewine, popular among warm-blooded travellers on lava and desert planets for regulating their body temperature."

/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/shockwine
	name = "Vintage Lightnings' Blessing"
	list_reagents = list(/datum/reagent/consumable/ethanol/trickwine/shock_wine = 45, /datum/reagent/consumable/ethanol/vodka = 5)
	desc = "Lightnings' Blessing was a limited-run drink created on Sol in 2282 to celebrate four hundred years of consumer electricity."

/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/hearthwine
	name = "Vintage Hearthflame"
	list_reagents = list(/datum/reagent/consumable/ethanol/trickwine/hearth_wine = 45, /datum/reagent/consumable/ethanol/hcider = 5)
	desc = "Hearthflame was a limited-run liquor from the 2100s notorious for its burning sensation. The strange qualities of the drink allow it to be used to help treat wounds or inflict burns on enemies."
