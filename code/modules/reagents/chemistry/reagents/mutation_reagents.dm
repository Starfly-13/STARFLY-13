#define MUT_MSG_IMMEDIATE 1
#define MUT_MSG_EXTENDED 2
#define MUT_MSG_ABOUT2TURN 3

/datum/reagent/mutationtoxin
	name = "Stable Mutation Toxin"
	description = "A humanizing toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	metabolization_rate = 0.2 //metabolizes to prevent micro-dosage
	taste_description = "slime"
	var/race = /datum/species/human
	var/list/mutationtexts = list( "You don't feel very well." = MUT_MSG_IMMEDIATE,
									"Your skin feels a bit abnormal." = MUT_MSG_IMMEDIATE,
									"Your limbs begin to take on a different shape." = MUT_MSG_EXTENDED,
									"Your appendages begin morphing." = MUT_MSG_EXTENDED,
									"You feel as though you're about to change at any moment!" = MUT_MSG_ABOUT2TURN)
	var/cycles_to_turn = 20 //the current_cycle threshold / iterations needed before one can transform
	process_flags = ORGANIC | SYNTHETIC //WS Edit - IPCs

/datum/reagent/mutationtoxin/on_mob_life(mob/living/carbon/human/H)
	. = TRUE
	if(!istype(H))
		return
	if(!(H.dna?.species) || !(H.mob_biotypes & MOB_ORGANIC))
		return
	var/datum/species/mutation = pick(race)			//I honestly feel extremely uncomfortable. I do not like the fact that this works.
	var/current_species = H.dna.species.type
	if(mutation && mutation != current_species)
		H.set_species(mutation)
	else
		to_chat(H, "<span class='danger'>The pain vanishes suddenly. You feel no different.</span>")
	H.reagents.del_reagent(type)

	if(prob(10))
		var/list/pick_ur_fav = list()
		var/filter = NONE
		if(current_cycle <= (cycles_to_turn*0.3))
			filter = MUT_MSG_IMMEDIATE
		else if(current_cycle <= (cycles_to_turn*0.8))
			filter = MUT_MSG_EXTENDED
		else
			filter = MUT_MSG_ABOUT2TURN

		for(var/i in mutationtexts)
			if(mutationtexts[i] == filter)
				pick_ur_fav += i
		to_chat(H, "<span class='warning'>[pick(pick_ur_fav)]</span>")

	if(current_cycle >= cycles_to_turn)
		var/datum/species/species_type = race
		H.set_species(species_type)
		H.reagents.del_reagent(type)
		to_chat(H, "<span class='warning'>You've become \a [lowertext(initial(species_type.name))]!</span>")
	..()

/datum/reagent/mutationtoxin/classic //The one from plasma on green slimes
	name = "Mutation Toxin"
	description = "A corruptive toxin."
	color = "#13BC5E" // rgb: 19, 188, 94
	race = /datum/species/jelly/slime
	process_flags = ORGANIC | SYNTHETIC //WS Edit - IPCs

/datum/reagent/mutationtoxin/unstable
	name = "Unstable Mutation Toxin"
	description = "A mostly safe mutation toxin."
	color = "#13BC5E" // rgb: 19, 188, 94
	race = list(/datum/species/jelly/slime,
						/datum/species/human,
						/datum/species/lizard,
						/datum/species/fly,
						/datum/species/moth,
						/datum/species/pod,
						/datum/species/jelly,
						/datum/species/abductor
	)
	process_flags = ORGANIC | SYNTHETIC

/datum/reagent/mutationtoxin/lizard
	name = "Unathi Mutation Toxin"
	description = "A lizarding toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/lizard
	process_flags = ORGANIC | SYNTHETIC //WS Edit - IPCs
	taste_description = "dragon's breath but not as cool"

/datum/reagent/mutationtoxin/fly
	name = "Fly Mutation Toxin"
	description = "An insectifying toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/fly
	process_flags = ORGANIC | SYNTHETIC //WS Edit - IPCs
	taste_description = "trash"

/datum/reagent/mutationtoxin/moth
	name = "Moth Mutation Toxin"
	description = "A glowing toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/moth
	process_flags = ORGANIC | SYNTHETIC //WS Edit - IPCs
	taste_description = "clothing"

/datum/reagent/mutationtoxin/pod
	name = "Podperson Mutation Toxin"
	description = "A vegetalizing toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/pod
	process_flags = ORGANIC | SYNTHETIC //WS Edit - IPCs
	taste_description = "flowers"

/datum/reagent/mutationtoxin/jelly
	name = "Imperfect Mutation Toxin"
	description = "A jellyfying toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/jelly
	process_flags = ORGANIC | SYNTHETIC //WS Edit - IPCs
	taste_description = "grandma's gelatin"

/datum/reagent/mutationtoxin/jelly/on_mob_life(mob/living/carbon/human/H)
	if(isjellyperson(H))
		to_chat(H, "<span class='warning'>Your jelly shifts and morphs, turning you into another subspecies!</span>")
		var/species_type = pick(subtypesof(/datum/species/jelly))
		H.set_species(species_type)
		H.reagents.del_reagent(type)
		return TRUE
	if(current_cycle >= cycles_to_turn) //overwrite since we want subtypes of jelly
		var/datum/species/species_type = pick(subtypesof(race))
		H.set_species(species_type)
		H.reagents.del_reagent(type)
		to_chat(H, "<span class='warning'>You've become \a [initial(species_type.name)]!</span>")
		return TRUE
	return ..()

/datum/reagent/mutationtoxin/abductor
	name = "Abductor Mutation Toxin"
	description = "An alien toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/abductor
	process_flags = ORGANIC | SYNTHETIC //WS Edit - IPCs
	taste_description = "something out of this world... no, universe!"

/datum/reagent/mutationtoxin/android
	name = "Android Mutation Toxin"
	description = "A robotic toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/android
	process_flags = ORGANIC | SYNTHETIC //WS Edit - IPCs
	taste_description = "circuitry and steel"

/datum/reagent/mutationtoxin/ipc
	name = "IPC Mutation Toxin"
	description = "An integrated positronic toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/ipc
	process_flags = ORGANIC | SYNTHETIC

/datum/reagent/mutationtoxin/kepi //crying
	name = "Kepori Mutation Toxin"
	description = "A feathery toxin."
	race = /datum/species/kepori
	process_flags = ORGANIC | SYNTHETIC
	taste_description = "a familiar white meat"

//BLACKLISTED RACES
/datum/reagent/mutationtoxin/skeleton
	name = "Skeleton Mutation Toxin"
	description = "A scary toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/skeleton
	process_flags = ORGANIC | SYNTHETIC //WS Edit - IPCs
	taste_description = "milk... and lots of it"

/datum/reagent/mutationtoxin/zombie
	name = "Zombie Mutation Toxin"
	description = "An undead toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/zombie //Not the infectious kind. The days of xenobio zombie outbreaks are long past.
	process_flags = ORGANIC | SYNTHETIC //WS Edit - IPCs
	taste_description = "brai...nothing in particular"

/datum/reagent/mutationtoxin/goofzombie
	name = "Krokodil Zombie Mutation Toxin"
	description = "An undead toxin... kinda..."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/human/krokodil_addict //Not the infectious kind. The days of xenobio zombie outbreaks are long past.
	process_flags = ORGANIC | SYNTHETIC

/datum/reagent/mutationtoxin/ash
	name = "Ash Mutation Toxin"
	description = "An ashen toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/lizard/ashwalker
	process_flags = ORGANIC | SYNTHETIC //WS Edit - IPCs
	taste_description = "savagery"

//DANGEROUS RACES
/datum/reagent/mutationtoxin/shadow
	name = "Shadow Mutation Toxin"
	description = "A dark toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/shadow
	process_flags = ORGANIC | SYNTHETIC //WS Edit - IPCs
	taste_description = "the night"

/datum/reagent/mutationtoxin/plasma
	name = "Plasma Mutation Toxin"
	description = "A plasma-based toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/plasmaman
	process_flags = ORGANIC | SYNTHETIC //WS Edit - IPCs
	taste_description = "plasma"

#undef MUT_MSG_IMMEDIATE
#undef MUT_MSG_EXTENDED
#undef MUT_MSG_ABOUT2TURN
