/mob/living/simple_animal/threshbeast
	name = "threshbeast"
	desc = "Large herbivorous reptiles native to Moghes, the azkrazal or 'threshbeast' is commonly used as a mount, beast of burden, or convenient food source by Unathi. They are highly valued for their speed and strength, capable of running at 30-42 miles per hour at top speed. Their favorite foods are grasses and cactus fruits"
	icon = 'icons/mob/moghes/threshbeast.dmi'
	icon_state = "threshbeast"
	icon_living = "threshbeast"
	icon_dead = "threshbeast_dead"
	butcher_results = list(/obj/item/stack/sheet/animalhide/lizard = 2, /obj/item/reagent_containers/food/snacks/meat/slab = 6)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "pushes"
	response_disarm_simple = "pushes"
	response_harm_continuous = "strikes"
	response_harm_simple = "strikes"
	speak_chance = 1
	turns_per_move = 5
	speak_emote = list("chuffs", "hisses", "bellows")
	emote_hear = list("chuffs", "hisses", "bellows")
	emote_see = list("shakes its head", "thumps its tail")
	mob_biotypes = MOB_ORGANIC|MOB_BEAST|MOB_REPTILE
	move_resist = MOVE_FORCE_VERY_STRONG
	food_type = list(/obj/item/reagent_containers/food/snacks/grown/ash_flora/cactus_fruit, /obj/item/reagent_containers/food/snacks/grown/ash_flora/fern, /obj/item/reagent_containers/food/snacks/grown/grass, /obj/item/reagent_containers/food/snacks/grown/grass/fairy, /obj/item/reagent_containers/food/snacks/grown/grass/carpet)		// Herbivore
	base_pixel_x = -15
	maxHealth = 100
	health = 100
	tame_chance = 15
	bonus_tame_chance = 30
	speed = 3
	harm_intent_damage = 0
	melee_damage_lower = 12
	melee_damage_upper = 20
	var/saddled = FALSE

/mob/living/simple_animal/threshbeast/attackby(obj/item/O, mob/user, params)
	if(istype(O, /obj/item/saddle) && !saddled)
		if(tame && do_after(user, 55, target=src))
			user.visible_message("<span class='notice'>You manage to put [O] on [src], you can now ride [p_them()].</span>")
			qdel(O)
			saddled = TRUE
			can_buckle = TRUE
			buckle_lying = FALSE
			add_overlay("threshbeast_saddled")
			var/datum/component/riding/D = LoadComponent(/datum/component/riding)
			D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 8), TEXT_SOUTH = list(0, 8), TEXT_EAST = list(-2, 8), TEXT_WEST = list(2, 8)))
			D.set_vehicle_dir_layer(SOUTH, ABOVE_MOB_LAYER)
			D.set_vehicle_dir_layer(NORTH, OBJ_LAYER)
			D.set_vehicle_dir_layer(EAST, OBJ_LAYER)
			D.set_vehicle_dir_layer(WEST, OBJ_LAYER)
			D.drive_verb = "ride"
		else
			user.visible_message("<span class='warning'>[src] is rocking around! You can't put the saddle on!</span>")
		return
	..()

/mob/living/simple_animal/threshbeast/brown
	icon_state = "threshbeastbrown"
	icon_living = "threshbeastbrown"
	icon_dead = "threshbeastbrown_dead"

/mob/living/simple_animal/threshbeast/grey
	icon_state = "threshbeastgrey"
	icon_living = "threshbeastgrey"
	icon_dead = "threshbeastgrey_dead"

/mob/living/simple_animal/threshbeast/red
	icon_state = "threshbeastred"
	icon_living = "threshbeastred"
	icon_dead = "threshbeastred_dead"

/mob/living/simple_animal/miervesh
	name = "Mier'vesh"
	desc = "A small, sweet-tempered flying reptile from Moghes. Frequently samples the air with a long, thin forked tongue. They are popular animals among Ouerean Unathi as they are small and sweet tempered, making them slow to respond to danger." //'
	icon = 'icons/mob/moghes/miervesh.dmi'
	icon_state = "miervesh-1"
	icon_living = "miervesh-1"
	icon_dead = "miervesh-1-dead"
	density = FALSE
	health = 4
	maxHealth = 4
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/chicken = 1)
	melee_damage_upper = 2
	melee_damage_lower = 0
	speak_chance = 1
	speak = list("Chirp!","peep!","tweet!")
	speak_emote = list("croons","chirps","hisses")
	emote_hear = list("croons.","chirps.","hisses.")
	emote_see = list("pecks at the ground","flaps its wings","flicks out its tongue")
	turns_per_move = 5

	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently moves aside"
	response_disarm_simple = "gently move aside"
	response_harm_continuous = "swats"
	response_harm_simple = "swat"
	a_intent = INTENT_HARM //wild animals aren't going to be your best friend, but a player-controlled one might be tame enough.
	attack_verb_continuous = "chomps"
	attack_verb_simple = "chomp"
	friendly_verb_continuous = "grooms"
	friendly_verb_simple = "groom"
	mob_size = MOB_SIZE_SMALL
	movement_type = FLYING

/mob/living/simple_animal/miervesh/red
	icon_state = "miervesh-2"
	icon_living = "miervesh-2"
	icon_dead = "miervesh-2-dead"