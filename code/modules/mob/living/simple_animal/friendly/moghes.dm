mob/living/simple_animal/threshbeast
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
	tame_chance = 5
	bonus_tame_chance = 10
	speed = 3
	harm_intent_damage = 0
	melee_damage_lower = 12
	melee_damage_upper = 20

mob/living/simple_animal/threshbeast/brown
	icon_state = "threshbeastbrown"
	icon_living = "threshbeastbrown"
	icon_dead = "threshbeastbrown_dead"

mob/living/simple_animal/threshbeast/grey
	icon_state = "threshbeastgrey"
	icon_living = "threshbeastgrey"
	icon_dead = "threshbeastgrey_dead"

mob/living/simple_animal/threshbeast/red
	icon_state = "threshbeastred"
	icon_living = "threshbeastred"
	icon_dead = "threshbeastred_dead"

