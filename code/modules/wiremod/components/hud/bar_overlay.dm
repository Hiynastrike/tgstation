/**
 * # Bar Overlay Component
 *
 * Basically an advanced verion of object overlay component that shows a horizontal/vertical bar.
 * Requires a BCI shell.
 */

#define BAR_OVERLAY_LIMIT 10

/obj/item/circuit_component/object_overlay/bar
	display_name = "Bar Overlay"
	desc = "Requires a BCI shell. A component that shows a bar overlay ontop of an object from a range of 0 to 100."

	var/datum/port/input/bar_number

/obj/item/circuit_component/object_overlay/bar/Initialize()
	. = ..()
	bar_number = add_input_port("Number", PORT_TYPE_NUMBER)

/obj/item/circuit_component/object_overlay/bar/populate_options()
	var/static/component_options_bar = list(
		"Vertical",
		"Horizontal"
	)
	options = component_options_bar

	var/static/options_to_icons_bar = list(
		"Vertical" = "barvert",
		"Horizontal" = "barhoriz"
	)
	options_map = options_to_icons_bar

/obj/item/circuit_component/object_overlay/bar/show_to_owner(atom/target_atom, mob/living/owner)
	if(LAZYLEN(active_overlays) >= BAR_OVERLAY_LIMIT)
		return

	if(active_overlays[target_atom])
		QDEL_NULL(active_overlays[target_atom])

	var/number_clear = clamp(bar_number.input_value, 0, 100)
	if(current_option == "Horizontal")
		number_clear = round(number_clear / 6.25) * 6.25
	else if(current_option == "Vertical")
		number_clear = round(number_clear / 10) * 10
	var/image/cool_overlay = image(icon = 'icons/hud/screen_bci.dmi', loc = target_atom, icon_state = "[options_map[current_option]][number_clear]", layer = RIPPLE_LAYER)

	if(image_pixel_x.input_value)
		cool_overlay.pixel_x = image_pixel_x.input_value

	if(image_pixel_y.input_value)
		cool_overlay.pixel_y = image_pixel_y.input_value

	active_overlays[target_atom] = WEAKREF(target_atom.add_alt_appearance(
		/datum/atom_hud/alternate_appearance/basic/one_person,
		"bar_overlay_[REF(src)]",
		cool_overlay,
		owner,
	))

#undef BAR_OVERLAY_LIMIT
