/obj/item/ammo_box/magazine/internal/cylinder/rev38
	name = "detective revolver cylinder"
	ammo_type = /obj/item/ammo_casing/c38
	caliber = ".38"
	max_ammo = 6
	instant_load = TRUE

/obj/item/ammo_box/magazine/internal/cylinder/rev38/big
	name = "\improper Montagne cylinder"
	max_ammo = 7

/obj/item/ammo_box/magazine/internal/cylinder/rev4570
	name = "hunting revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a4570
	caliber = ".45-70"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/rus357
	name = "\improper Russian revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = ".357"
	max_ammo = 6
	instant_load = FALSE

/obj/item/ammo_box/magazine/internal/rus357/Initialize()
	stored_ammo += new ammo_type(src)
	. = ..()

/obj/item/ammo_box/magazine/internal/cylinder/pepperbox
	name = "pepperbox revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = ".357"
	max_ammo = 5
	instant_load = FALSE

/obj/item/ammo_box/magazine/internal/cylinder/rev44
	name = "cattleman revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a44roum
	caliber = ".44 special"
	max_ammo = 6
	instant_load = FALSE

/obj/item/ammo_box/magazine/internal/cylinder/rev44/montagne
	name = "montagne revolver cylinder"
	instant_load = TRUE

/obj/item/ammo_box/magazine/internal/cylinder/rev45
	name = "cattleman revolver cylinder"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	max_ammo = 6
	instant_load = FALSE

/obj/item/ammo_box/magazine/internal/cylinder/rev45/montagne
	name = "montagne revolver cylinder"
	instant_load = TRUE

/obj/item/ammo_box/magazine/internal/cylinder/rev762
	name = "\improper Nagant revolver cylinder"
	ammo_type = /obj/item/ammo_casing/n762_38
	caliber = "7.62x38mmR"
	instant_load = FALSE
	max_ammo = 7
