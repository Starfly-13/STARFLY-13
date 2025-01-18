/datum/outfit/job/nanotrasen/ert
	name = "ERT - Nanotrasen Vigilitas Security Officer"
	jobtype = /datum/job/officer
	job_icon = "securityofficer"

	wallet = null

	box = /obj/item/storage/box/survival/security
	l_pocket = /obj/item/restraints/handcuffs
	r_pocket = /obj/item/melee/knife/combat

	backpack_contents = list(/obj/item/radio=1, /obj/item/stock_parts/cell/gun/upgraded=2, /obj/item/screwdriver=1)


/datum/outfit/job/nanotrasen/security/ert/lp/medic
	name = "ERT - Loss Prevention Medical Specialist"
	jobtype = /datum/job/doctor
	job_icon = "medicalresponseofficer"

	head = null
	uniform = /obj/item/clothing/under/rank/medical/paramedic/lp
	suit = /obj/item/clothing/suit/space/hardsuit/ert/lp/med
	id = /obj/item/card/id/lpmed
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	back = /obj/item/storage/backpack/ert/medical
	belt = /obj/item/storage/belt/medical/surgery

	box = /obj/item/storage/box/survival/medical
	l_pocket = /obj/item/healthanalyzer
	r_pocket = /obj/item/reagent_containers/hypospray/medipen/atropine

	backpack_contents = list(/obj/item/storage/firstaid/medical=1, /obj/item/radio=1)


/datum/outfit/job/nanotrasen/security/ert/lp/engineer
	name = "ERT - Loss Prevention Engineering Specialist"
	jobtype = /datum/job/engineer
	job_icon = "engineeringresponseofficer"

	head = null
	uniform = /obj/item/clothing/under/rank/engineering/engineer/nt/lp
	suit = /obj/item/clothing/suit/space/hardsuit/ert/lp/engi
	id = /obj/item/card/id/lpengie
	belt = /obj/item/storage/belt/utility/full
	gloves = /obj/item/clothing/gloves/combat
	glasses = /obj/item/clothing/glasses/welding
	back = /obj/item/storage/backpack/ert/engineer

	box = /obj/item/storage/box/survival/engineer
	l_pocket = /obj/item/extinguisher/mini
	r_pocket = /obj/item/wrench/combat

	backpack_contents = list(/obj/item/stack/sheet/metal/fifty=1, /obj/item/stack/sheet/glass/fifty=1, /obj/item/radio=1)

/datum/outfit/job/nanotrasen/security/ert/lp/lieutenant
	name = "ERT - Loss Prevention Lieutenant"
	jobtype = /datum/job/captain
	job_icon = "emergencyresponseteamcommander"

	head = null
	ears = /obj/item/radio/headset/nanotrasen/alt/captain
	id = /obj/item/card/id/lplieu
	belt = /obj/item/storage/belt/military/army
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/nanotrasen/cap/security
	suit = /obj/item/clothing/suit/armor/nanotrasen
	suit_store = /obj/item/gun/ballistic/automatic/pistol/commander
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security
	shoes = /obj/item/clothing/shoes/jackboots

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec
	box = /obj/item/storage/box/survival/security

	backpack_contents = list(/obj/item/ammo_box/magazine/co9mm = 3)

	implants = list(/obj/item/implant/weapons_auth)

/datum/outfit/job/nanotrasen/ert/inspector
	name = "ERT - Nanotrasen CentCom Inspector"
	id_assignment = "Inspector"
	job_icon = "centcom"

	head = null
	uniform = /obj/item/clothing/under/rank/centcom/official
	shoes = /obj/item/clothing/shoes/sneakers/black
	gloves = /obj/item/clothing/gloves/color/black
	suit = null
	suit_store = null
	ears = /obj/item/radio/headset/headset_cent
	glasses = /obj/item/clothing/glasses/sunglasses
	belt = /obj/item/clipboard
	id = /obj/item/card/id/centcom

	l_pocket = /obj/item/pen
	r_pocket = /obj/item/pda/heads

	backpack_contents = list(/obj/item/stamp/nanotrasen/central, /obj/item/paper_bin/bundlenatural, /obj/item/hand_labeler)

// /datum/outfit/job/nanotrasen/ert/emergency
// 	name = "ERT - Vigilitas Emergency Response Officer"

/datum/outfit/job/nanotrasen/ert/leader
	name = "ERT - Nanotrasen Vigilitas Security Corporal"
	jobtype = /datum/job/hos
	job_icon = "lieutenant"

	ears = /obj/item/radio/headset/headset_sec/alt
	uniform = /obj/item/clothing/under/nanotrasen/security
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/nanotrasen/beret/security
	suit = /obj/item/clothing/suit/armor/nanotrasen/slim
	l_pocket = /obj/item/restraints/handcuffs
	r_pocket = /obj/item/assembly/flash/handheld
	backpack_contents = null

// /datum/outfit/job/nanotrasen/ert/leader/emergency
// 	name = "ERT - Vigilitas Emergency Response Lieutenant"

// /datum/outfit/job/nanotrasen/ert/emergency/medic
// 	name = "ERT - Vigilitas Emergency Response Medic"

// /datum/outfit/job/nanotrasen/ert/emergency/engineer
// 	name = "ERT - Vigilitas Emergency Response Engineer"
