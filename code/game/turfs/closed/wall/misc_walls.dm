/turf/closed/wall/mineral/cult
	name = "runed metal wall"
	desc = "A cold metal wall engraved with indecipherable symbols. Studying them causes your head to pound."
	icon = 'icons/turf/walls/cult_wall.dmi'
	icon_state = "cult_wall-0"
	base_icon_state = "cult_wall"
	smoothing_flags = SMOOTH_BITMASK
	canSmoothWith = null
	sheet_type = /obj/item/stack/sheet/runed_metal
	sheet_amount = 1
	girder_type = /obj/structure/girder/cult

/turf/closed/wall/mineral/cult/Initialize()
	new /obj/effect/temp_visual/cult/turf(src)
	. = ..()

/turf/closed/wall/mineral/cult/devastate_wall()
	new sheet_type(get_turf(src), sheet_amount)

/turf/closed/wall/mineral/cult/Exited(atom/movable/gone, direction)
	. = ..()
	if(istype(gone, /mob/living/simple_animal/hostile/construct/harvester)) //harvesters can go through cult walls, dragging something with
		var/mob/living/simple_animal/hostile/construct/harvester/H = gone
		var/atom/movable/stored_pulling = H.pulling
		if(stored_pulling)
			stored_pulling.setDir(direction)
			stored_pulling.forceMove(src)
			H.start_pulling(stored_pulling, supress_message = TRUE)

/turf/closed/wall/mineral/cult/artificer
	name = "runed stone wall"
	desc = "A cold stone wall engraved with indecipherable symbols. Studying them causes your head to pound."

/turf/closed/wall/mineral/cult/artificer/break_wall()
	new /obj/effect/temp_visual/cult/turf(get_turf(src))
	return null //excuse me we want no runed metal here

/turf/closed/wall/mineral/cult/artificer/devastate_wall()
	new /obj/effect/temp_visual/cult/turf(get_turf(src))

/turf/closed/wall/vault
	name = "strange wall"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rockvault"
	base_icon_state = "rockvault"
	smoothing_flags = NONE
	canSmoothWith = null
	smoothing_groups = null
	rcd_memory = null

/turf/closed/wall/vault/rock
	name = "rocky wall"
	desc = "You feel a strange nostalgia from looking at this..."

/turf/closed/wall/vault/alien
	name = "alien wall"
	icon_state = "alienvault"
	base_icon_state = "alienvault"

/turf/closed/wall/vault/sandstone
	name = "sandstone wall"
	icon_state = "sandstonevault"
	base_icon_state = "sandstonevault"

/turf/closed/wall/ice
	icon = 'icons/turf/walls/icedmetal_wall.dmi'
	icon_state = "icedmetal_wall-0"
	base_icon_state = "icedmetal_wall"
	desc = "A wall covered in a thick sheet of ice."
	smoothing_flags = SMOOTH_BITMASK
	canSmoothWith = null
	rcd_memory = null
	hardness = 35
	slicing_duration = 150 //welding through the ice+metal
	bullet_sizzle = TRUE

/turf/closed/wall/rust
	//SDMM supports colors, this is simply for easier mapping
	//and should be removed on initialize
	color = COLOR_ORANGE_BROWN

/turf/closed/wall/rust/Initialize(mapload)
	. = ..()
	color = null

/turf/closed/wall/rust/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/rust)

/turf/closed/wall/r_wall/rust
	//SDMM supports colors, this is simply for easier mapping
	//and should be removed on initialize
	color = COLOR_ORANGE_BROWN

/turf/closed/wall/r_wall/Initialize(mapload)
	. = ..()
	color = null

/turf/closed/wall/r_wall/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/rust)

/turf/closed/wall/mineral/bronze
	name = "clockwork wall"
	desc = "A huge chunk of bronze, decorated like gears and cogs."
	icon = 'icons/turf/walls/clockwork_wall.dmi'
	icon_state = "clockwork_wall-0"
	base_icon_state = "clockwork_wall"
	smoothing_flags = SMOOTH_BITMASK
	sheet_type = /obj/item/stack/sheet/bronze
	sheet_amount = 2
	girder_type = /obj/structure/girder/bronze

/turf/closed/wall/rock
	name = "reinforced rock"
	desc = "It has metal struts that need to be welded away before it can be mined."
	icon = 'icons/turf/walls/reinforced_rock.dmi'
	icon_state = "porous_rock-0"
	base_icon_state = "porous_rock"
	sheet_amount = 1
	hardness = 50
	girder_type = null
	decon_type = /turf/closed/mineral/asteroid

/turf/closed/wall/rock/porous
	name = "reinforced porous rock"
	desc = "This rock is filled with pockets of breathable air. It has metal struts to protect it from mining."
	decon_type = /turf/closed/mineral/asteroid/porous
