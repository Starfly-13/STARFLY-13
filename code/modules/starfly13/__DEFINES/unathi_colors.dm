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

/// this species has the trait of having many beautiful exotic colors
/// see: https://www.google.com/search?q=exotic+colorful+lizards&sclient=img&udm=2
/// see: `code/modules/mob/living/carbon/human/species.dm`
/// see: `code/modules/mob/living/carbon/human/species_types/lizardpeople.dm`
/// typically this is added to `species_traits` if you want exotic unathi coloring
#define UNATHI_COLORS 8000000

// features store per-character preferences for things like body shape,
// clothing, eye/hair/skin coloration, etc.
// see: `code/__HELPERS/mobs.dm`
// see: `code/modules/client/preferences.dm`
// see: `code/modules/client/preferences_savefile.dm`
// these are the names of the unathi color features

/// feature name for unathi primary body color
#define FEATURE_UNATHI_COLOR_BODY1 "unathi_color_body1"
/// feature name for unathi secondary body color (unused)
#define FEATURE_UNATHI_COLOR_BODY2 "unathi_color_body2"
/// feature name for unathi primary body marking color
#define FEATURE_UNATHI_COLOR_BODY_MARKING1 "unathi_color_body_marking1"
/// feature name for unathi secondary body marking color (unused)
#define FEATURE_UNATHI_COLOR_BODY_MARKING2 "unathi_color_body_marking2"
/// feature name for unathi primary face marking color
#define FEATURE_UNATHI_COLOR_FACE_MARKING1 "unathi_color_face_marking1"
/// feature name for unathi secondary face marking color (unused)
#define FEATURE_UNATHI_COLOR_FACE_MARKING2 "unathi_color_face_marking2"
/// feature name for unathi primary frill color
#define FEATURE_UNATHI_COLOR_FRILL1 "unathi_color_frill1"
/// feature name for unathi secondary frill color
#define FEATURE_UNATHI_COLOR_FRILL2 "unathi_color_frill2"
/// feature name for unathi primary horn color
#define FEATURE_UNATHI_COLOR_HORN1 "unathi_color_horn1"
/// feature name for unathi secondary horn color (unused)
#define FEATURE_UNATHI_COLOR_HORN2 "unathi_color_horn2"
/// feature name for unathi primary spine color
#define FEATURE_UNATHI_COLOR_SPINE1 "unathi_color_spine1"
/// feature name for unathi secondary spine color (unused)
#define FEATURE_UNATHI_COLOR_SPINE2 "unathi_color_spine2"
/// feature name for unathi primary tail color
#define FEATURE_UNATHI_COLOR_TAIL1 "unathi_color_tail1"
/// feature name for unathi secondary tail color
#define FEATURE_UNATHI_COLOR_TAIL2 "unathi_color_tail2"
