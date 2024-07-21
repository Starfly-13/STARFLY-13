// unathi_colors.dm
// Copyright 2024 Patrick Meade.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published
// by the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//---------------------------------------------------------------------------

/proc/choose_unathi_color(mob/user, list/features, unathi_color, default_color)
	// create an associative list to map color define to body part description
	var/list/bodypart_list = list(
		FEATURE_UNATHI_COLOR_BODY1 = "body",
		FEATURE_UNATHI_COLOR_BODY2 = "body",
		FEATURE_UNATHI_COLOR_BODY_MARKING1 = "body marking",
		FEATURE_UNATHI_COLOR_BODY_MARKING2 = "body marking",
		FEATURE_UNATHI_COLOR_FACE_MARKING1 = "face marking",
		FEATURE_UNATHI_COLOR_FACE_MARKING2 = "face marking",
		FEATURE_UNATHI_COLOR_FRILL1 = "frill",
		FEATURE_UNATHI_COLOR_FRILL2 = "frill",
		FEATURE_UNATHI_COLOR_HORN1 = "horn",
		FEATURE_UNATHI_COLOR_HORN2 = "horn",
		FEATURE_UNATHI_COLOR_SPINE1 = "spine",
		FEATURE_UNATHI_COLOR_SPINE2 = "spine",
		FEATURE_UNATHI_COLOR_TAIL1 = "tail",
		FEATURE_UNATHI_COLOR_TAIL2 = "tail",
	)
	// create an associative list to map color define to ordinal word
	var/list/ordinal_list = list(
		FEATURE_UNATHI_COLOR_BODY1 = "primary",
		FEATURE_UNATHI_COLOR_BODY2 = "secondary",
		FEATURE_UNATHI_COLOR_BODY_MARKING1 = "primary",
		FEATURE_UNATHI_COLOR_BODY_MARKING2 = "secondary",
		FEATURE_UNATHI_COLOR_FACE_MARKING1 = "primary",
		FEATURE_UNATHI_COLOR_FACE_MARKING2 = "secondary",
		FEATURE_UNATHI_COLOR_FRILL1 = "primary",
		FEATURE_UNATHI_COLOR_FRILL2 = "secondary",
		FEATURE_UNATHI_COLOR_HORN1 = "primary",
		FEATURE_UNATHI_COLOR_HORN2 = "secondary",
		FEATURE_UNATHI_COLOR_SPINE1 = "primary",
		FEATURE_UNATHI_COLOR_SPINE2 = "secondary",
		FEATURE_UNATHI_COLOR_TAIL1 = "primary",
		FEATURE_UNATHI_COLOR_TAIL2 = "secondary",
	)
	// choose the correct words to display to the user
	var/bodypart = bodypart_list[unathi_color]
	var/ordinal = ordinal_list[unathi_color]
	// ask the user to choose a color
	var/new_color = input(user, "Choose your Unathi's [ordinal] [bodypart] color:", "Character Preference","#" + features[unathi_color]) as color|null
	if(new_color)
		var/temp_hsv = RGBtoHSV(new_color)
		if(new_color == "#000000")
			features[unathi_color] = default_color
		else if(ReadHSV(temp_hsv)[3] >= ReadHSV("#191919")[3])
			features[unathi_color] = sanitize_hexcolor(new_color)
		else
			to_chat(user, "<span class='danger'>Invalid color. Your color is not bright enough.</span>")
			return FALSE
	// signal that everything went OK
	return TRUE


/proc/random_unathi_color()
	var/color_ok = FALSE
	var/new_color = "000000"

	// until we've found an acceptably bright color
	while(color_ok == FALSE)
		// check a new color to see if it's bright enough
		new_color = random_color()
		var/temp_hsv = RGBtoHSV(new_color)
		if(ReadHSV(temp_hsv)[3] >= ReadHSV("#191919")[3])
			color_ok = TRUE

	// return the unathi color to the caller
	return new_color
