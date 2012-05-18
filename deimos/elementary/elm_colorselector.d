/**
 * @defgroup Colorselector Colorselector
 * @ingroup Elementary
 *
 * @image html img/widget/colorselector/preview-00.png
 * @image latex img/widget/colorselector/preview-00.eps
 *
 * A ColorSelector is a color selection widget. It allows application to set a
 * series of colors.It also allows to load/save colors from/to config with a
 * unique identifier, by default, the colors are loaded/saved from/to config
 * using "default" identifier.
 * The colors can be picked by user from the color set by clicking on individual color
 * item on the palette or by selecting it from selector.
 *
 * Signals that you can add callbacks for are:
 * - "changed" - When the color value changes on selector(event_info is NULL).
 * - "color,item,selected" - When user clicks on color item. The event_info parameter
 * of the callback will be the selected color item.
 * - "color,item,longpressed" - When user long presses on color item. The event info
 * parameter of the callback contains selected color item.
 *
 * See @ref tutorial_colorselector.
 * @{
 */
module elm_colorselector;

import Evas;
import Eina;
import elm_general;

extern (C)  {

struct Elm_Color_RGBA
{
   uint r;
   uint g;
   uint b;
   uint a;
}

struct Elm_Custom_Palette
{
   const char* palette_name;
   Eina_List*  color_list;
}

/**
 * @enum _Elm_Colorselector_Mode
 * @typedef Elm_Colorselector_Mode
 *
 * Different modes supported by Colorselector
 *
 * @see elm_colorselector_mode_set()
 * @see elm_colorselector_mode_get()
 */
enum Elm_Colorselector_Mode
{
   ELM_COLORSELECTOR_PALETTE = 0, /**< only color palette is displayed */
   ELM_COLORSELECTOR_COMPONENTS, /**< only color selector is displayed */
   ELM_COLORSELECTOR_BOTH /**< Both Palette and selector is displayed, default */
}

/**
 * @brief Add a new colorselector to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Colorselector
 */
Evas_Object *elm_colorselector_add(Evas_Object *parent);

/**
 * Set color to colorselector
 *
 * @param obj Colorselector object
 * @param r r-value of color
 * @param g g-value of color
 * @param b b-value of color
 * @param a a-value of color
 *
 * @ingroup Colorselector
 */
void elm_colorselector_color_set(Evas_Object *obj, int r, int g, int b, int a);

/**
 * Get current color from colorselector
 *
 * @param obj Colorselector object
 * @param r integer pointer for r-value of color
 * @param g integer pointer for g-value of color
 * @param b integer pointer for b-value of color
 * @param a integer pointer for a-value of color
 *
 * @ingroup Colorselector
 */
void elm_colorselector_color_get(const Evas_Object *obj, int *r, int *g, int *b, int *a);

/**
 * Set Colorselector's mode.
 *
 * @param obj Colorselector object
 * @param mode Elm_Colorselector_Mode
 *
 * Colorselector supports three modes palette only, selector only and both.
 *
 * @ingroup Colorselector
 */
void elm_colorselector_mode_set(Evas_Object *obj, Elm_Colorselector_Mode mode);

/**
 * Get Colorselector's mode.
 *
 * @param obj Colorselector object
 * @return mode The current mode of colorselector
 *
 * @ingroup Colorselector
 */
Elm_Colorselector_Mode elm_colorselector_mode_get(const Evas_Object *obj);

/**
 * Get Palette item's color.
 *
 * @param it The color palette item.
 * @param r integer pointer for r-value of color
 * @param g integer pointer for g-value of color
 * @param b integer pointer for b-value of color
 * @param a integer pointer for a-value of color
 *
 * @ingroup Colorselector
 */
void elm_colorselector_palette_item_color_get(const Elm_Object_Item *it, int *r, int *g, int *b, int *a);

/**
 * Set palette item's color.
 *
 * @param it The color palette item.
 * @param r r-value of color
 * @param g g-value of color
 * @param b b-value of color
 * @param a a-value of color
 *
 * @ingroup Colorselector
 */
void elm_colorselector_palette_item_color_set(Elm_Object_Item *it, int r, int g, int b, int a);

/**
 * Add a new color item to palette.
 *
 * @param obj The Colorselector object
 * @param r r-value of color
 * @param g g-value of color
 * @param b b-value of color
 * @param a a-value of color
 * @return A new color palette Item.
 *
 * @ingroup Colorselector
 */
Elm_Object_Item *elm_colorselector_palette_color_add(Evas_Object *obj, int r, int g, int b, int a);

/**
 * Clear the palette items.
 *
 * @param obj The Colorselector object
 *
 * @ingroup Colorselector
 */
void elm_colorselector_palette_clear(Evas_Object *obj);

/**
 * Set current palette's name
 *
 * @param obj The Colorselector object
 * @param palette_name Name of palette
 *
 * When colorpalette name is set, colors will be loaded from and saved to config
 * using the set name. If no name is set then colors will be loaded from or
 * saved to "default" config.
 *
 * @ingroup Colorselector
 */
void elm_colorselector_palette_name_set(Evas_Object *obj, const char *palette_name);

/**
 * Get current palette's name
 *
 * @param obj The Colorselector object
 * @return Name of palette
 *
 * Returns the currently set palette name using which colors will be
 * saved/loaded in to config.
 *
 * @ingroup Colorselector
 */
char *elm_colorselector_palette_name_get(const Evas_Object *obj);

/**
 * @}
 */
}
