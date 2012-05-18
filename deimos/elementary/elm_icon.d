/**
 * @defgroup Icon Icon
 * @ingroup Elementary
 *
 * @image html img/widget/icon/preview-00.png
 * @image latex img/widget/icon/preview-00.eps
 *
 * An object that provides standard icon images (delete, edit, arrows, etc.)
 * or a custom file (PNG, JPG, EDJE, etc.) used for an icon.
 *
 * The icon image requested can be in the elementary theme, or in the
 * freedesktop.org paths. It's possible to set the order of preference from
 * where the image will be used.
 *
 * This API is very similar to @ref Image, but with ready to use images.
 *
 * Default images provided by the theme are described below.
 *
 * The first list contains icons that were first intended to be used in
 * toolbars, but can be used in many other places too:
 * @li home
 * @li close
 * @li apps
 * @li arrow_up
 * @li arrow_down
 * @li arrow_left
 * @li arrow_right
 * @li chat
 * @li clock
 * @li delete
 * @li edit
 * @li refresh
 * @li folder
 * @li file
 *
 * Now some icons that were designed to be used in menus (but again, you can
 * use them anywhere else):
 * @li menu/home
 * @li menu/close
 * @li menu/apps
 * @li menu/arrow_up
 * @li menu/arrow_down
 * @li menu/arrow_left
 * @li menu/arrow_right
 * @li menu/chat
 * @li menu/clock
 * @li menu/delete
 * @li menu/edit
 * @li menu/refresh
 * @li menu/folder
 * @li menu/file
 *
 * And here we have some media player specific icons:
 * @li media_player/forward
 * @li media_player/info
 * @li media_player/next
 * @li media_player/pause
 * @li media_player/play
 * @li media_player/prev
 * @li media_player/rewind
 * @li media_player/stop
 *
 * Signals that you can add callbacks for are:
 *
 * "clicked" - This is called when a user has clicked the icon
 *
 * Supported elm_object common APIs.
 * @li @ref elm_object_signal_emit
 * @li @ref elm_object_signal_callback_add
 * @li @ref elm_object_signal_callback_del
 *
 * An example of usage for this API follows:
 * @li @ref tutorial_icon
 *
/**
 * @addtogroup Icon
 * @{
 */
module elm_icon;

import Evas;
import Eina;

extern (C)  {

enum Elm_Icon_Type  {
   ELM_ICON_NONE,
   ELM_ICON_FILE,
   ELM_ICON_STANDARD
}

/**
 * @enum _Elm_Icon_Lookup_Order
 * @typedef Elm_Icon_Lookup_Order
 *
 * Lookup order used by elm_icon_standard_set(). Should look for icons in the
 * theme, FDO paths, or both?
 *
 * @ingroup Icon
 */
enum Elm_Icon_Lookup_Order
{
   ELM_ICON_LOOKUP_FDO_THEME, /**< icon look up order: freedesktop, theme */
   ELM_ICON_LOOKUP_THEME_FDO, /**< icon look up order: theme, freedesktop */
   ELM_ICON_LOOKUP_FDO, /**< icon look up order: freedesktop */
   ELM_ICON_LOOKUP_THEME /**< icon look up order: theme */
}

/**
 * Add a new icon object to the parent.
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @see elm_icon_file_set()
 *
 * @ingroup Icon
 */
Evas_Object* elm_icon_add(Evas_Object* parent);

/**
 * Set the file that will be used as icon.
 *
 * @param obj The icon object
 * @param file The path to file that will be used as icon image
 * @param group The group that the icon belongs to an edje file
 *
 * @return (@c EINA_TRUE = success, @c EINA_FALSE = error)
 *
 * @note The icon image set by this function can be changed by
 * elm_icon_standard_set().
 *
 * @see elm_icon_file_get()
 *
 * @ingroup Icon
 */
Eina_Bool elm_icon_file_set(Evas_Object* obj, const char* file, const char* group);

/**
 * Set a location in memory to be used as an icon
 *
 * @param obj The icon object
 * @param img The binary data that will be used as an image
 * @param size The size of binary data @p img
 * @param format Optional format of @p img to pass to the image loader
 * @param key Optional key of @p img to pass to the image loader (eg. if @p img is an edje file)
 *
 * The @p format string should be something like "png", "jpg", "tga",
 * "tiff", "bmp" etc. if it is provided (NULL if not). This improves
 * the loader performance as it tries the "correct" loader first before
 * trying a range of other possible loaders until one succeeds.
 *
 * @return (@c EINA_TRUE = success, @c EINA_FALSE = error)
 *
 * @note The icon image set by this function can be changed by
 * elm_icon_standard_set().
 *
 * @ingroup Icon
 */
Eina_Bool elm_icon_memfile_set(Evas_Object* obj, const void* img, size_t size, const char* format, const char* key);

/**
 * Get the file that will be used as icon.
 *
 * @param obj The icon object
 * @param file The path to file that will be used as the icon image
 * @param group The group that the icon belongs to, in edje file
 *
 * @see elm_icon_file_set()
 *
 * @ingroup Icon
 */
void elm_icon_file_get(const Evas_Object* obj, const char** file, const char** group);

/**
 * Set the file that will be used, but use a generated thumbnail.
 *
 * @param obj The icon object
 * @param file The path to file that will be used as icon image
 * @param group The group that the icon belongs to an edje file
 *
 * This functions like elm_icon_file_set() but requires the Ethumb library
 * support to be enabled successfully with elm_need_ethumb(). When set
 * the file indicated has a thumbnail generated and cached on disk for
 * future use or will directly use an existing cached thumbnail if it
 * is valid.
 *
 * @see elm_icon_file_set()
 *
 * @ingroup Icon
 */
void elm_icon_thumb_set(Evas_Object* obj, const char* file, const char* group);

/**
 * Set the icon by icon standards names.
 *
 * @param obj The icon object
 * @param name The icon name
 *
 * @return (@c EINA_TRUE = success, @c EINA_FALSE = error)
 *
 * For example, freedesktop.org defines standard icon names such as "home",
 * "network", etc. There can be different icon sets to match those icon
 * keys. The @p name given as parameter is one of these "keys", and will be
 * used to look in the freedesktop.org paths and elementary theme. One can
 * change the lookup order with elm_icon_order_lookup_set().
 *
 * If name is not found in any of the expected locations and it is the
 * absolute path of an image file, this image will be used.
 *
 * @note The icon image set by this function can be changed by
 * elm_icon_file_set().
 *
 * @see elm_icon_standard_get()
 * @see elm_icon_file_set()
 *
 * @ingroup Icon
 */
Eina_Bool elm_icon_standard_set(Evas_Object* obj, const char* name);

/**
 * Get the icon name set by icon standard names.
 *
 * @param obj The icon object
 * @return The icon name
 *
 * If the icon image was set using elm_icon_file_set() instead of
 * elm_icon_standard_set(), then this function will return @c NULL.
 *
 * @see elm_icon_standard_set()
 *
 * @ingroup Icon
 */
char* elm_icon_standard_get(const Evas_Object* obj);

/**
 * Set the smooth scaling for an icon object.
 *
 * @param obj The icon object
 * @param smooth @c EINA_TRUE if smooth scaling should be used, @c EINA_FALSE
 * otherwise. Default is @c EINA_TRUE.
 *
 * Set the scaling algorithm to be used when scaling the icon image. Smooth
 * scaling provides a better resulting image, but is slower.
 *
 * The smooth scaling should be disabled when making animations that change
 * the icon size, since they will be faster. Animations that don't require
 * resizing of the icon can keep the smooth scaling enabled (even if the icon
 * is already scaled, since the scaled icon image will be cached).
 *
 * @see elm_icon_smooth_get()
 *
 * @ingroup Icon
 */
void elm_icon_smooth_set(Evas_Object* obj, Eina_Bool smooth);

/**
 * Get whether smooth scaling is enabled for an icon object.
 *
 * @param obj The icon object
 * @return @c EINA_TRUE if smooth scaling is enabled, @c EINA_FALSE otherwise.
 *
 * @see elm_icon_smooth_set()
 *
 * @ingroup Icon
 */
Eina_Bool elm_icon_smooth_get(const Evas_Object* obj);

/**
 * Disable scaling of this object.
 *
 * @param obj The icon object.
 * @param no_scale @c EINA_TRUE if the object is not scalable, @c EINA_FALSE
 * otherwise. Default is @c EINA_FALSE.
 *
 * This function disables scaling of the icon object through the function
 * elm_object_scale_set(). However, this does not affect the object
 * size/resize in any way. For that effect, take a look at
 * elm_icon_resizable_set().
 *
 * @see elm_icon_no_scale_get()
 * @see elm_icon_resizable_set()
 * @see elm_object_scale_set()
 *
 * @ingroup Icon
 */
void elm_icon_no_scale_set(Evas_Object* obj, Eina_Bool no_scale);

/**
 * Get whether scaling is disabled on the object.
 *
 * @param obj The icon object
 * @return @c EINA_TRUE if scaling is disabled, @c EINA_FALSE otherwise
 *
 * @see elm_icon_no_scale_set()
 *
 * @ingroup Icon
 */
Eina_Bool elm_icon_no_scale_get(const Evas_Object* obj);

/**
 * Set if the object is (up/down) resizable.
 *
 * @param obj The icon object
 * @param size_up A bool to set if the object is resizable up. Default is
 * @c EINA_TRUE.
 * @param size_down A bool to set if the object is resizable down. Default
 * is @c EINA_TRUE.
 *
 * This function limits the icon object resize ability. If @p size_up is set to
 * @c EINA_FALSE, the object can't have its height or width resized to a value
 * higher than the original icon size. Same is valid for @p size_down.
 *
 * @see elm_icon_resizable_get()
 *
 * @ingroup Icon
 */
void elm_icon_resizable_set(Evas_Object* obj, Eina_Bool size_up, Eina_Bool size_down);

/**
 * Get if the object is (up/down) resizable.
 *
 * @param obj The icon object
 * @param size_up A bool to set if the object is resizable up
 * @param size_down A bool to set if the object is resizable down
 *
 * @see elm_icon_resizable_set()
 *
 * @ingroup Icon
 */
void elm_icon_resizable_get(const Evas_Object* obj, Eina_Bool* size_up, Eina_Bool *size_down);

/**
 * Get the object's image size
 *
 * @param obj The icon object
 * @param w A pointer to store the width in
 * @param h A pointer to store the height in
 *
 * @ingroup Icon
 */
void elm_icon_size_get(const Evas_Object* obj, int* w, int* h);

/**
 * Set if the icon fill the entire object area.
 *
 * @param obj The icon object
 * @param fill_outside @c EINA_TRUE if the object is filled outside,
 * @c EINA_FALSE otherwise. Default is @c EINA_FALSE.
 *
 * When the icon object is resized to a different aspect ratio from the
 * original icon image, the icon image will still keep its aspect. This flag
 * tells how the image should fill the object's area. They are: keep the
 * entire icon inside the limits of height and width of the object (@p
 * fill_outside is @c EINA_FALSE) or let the extra width or height go outside
 * of the object, and the icon will fill the entire object (@p fill_outside
 * is @c EINA_TRUE).
 *
 * @note Unlike @ref Image, there's no option in icon to set the aspect ratio
 * retain property to false. Thus, the icon image will always keep its
 * original aspect ratio.
 *
 * @see elm_icon_fill_outside_get()
 * @see elm_image_fill_outside_set()
 *
 * @ingroup Icon
 */
void elm_icon_fill_outside_set(Evas_Object* obj, Eina_Bool fill_outside);

/**
 * Get if the object is filled outside.
 *
 * @param obj The icon object
 * @return @c EINA_TRUE if the object is filled outside, @c EINA_FALSE otherwise.
 *
 * @see elm_icon_fill_outside_set()
 *
 * @ingroup Icon
 */
Eina_Bool elm_icon_fill_outside_get(const Evas_Object* obj);

/**
 * Set the prescale size for the icon.
 *
 * @param obj The icon object
 * @param size The prescale size. This value is used for both width and
 * height.
 *
 * This function sets a new size for pixmap representation of the given
 * icon. It allows the icon to be loaded already in the specified size,
 * reducing the memory usage and load time when loading a big icon with load
 * size set to a smaller size.
 *
 * It's equivalent to the elm_bg_load_size_set() function for bg.
 *
 * @note this is just a hint, the real size of the pixmap may differ
 * depending on the type of icon being loaded, being bigger than requested.
 *
 * @see elm_icon_prescale_get()
 * @see elm_bg_load_size_set()
 *
 * @ingroup Icon
 */
void elm_icon_prescale_set(Evas_Object* obj, int size);

/**
 * Get the prescale size for the icon.
 *
 * @param obj The icon object
 * @return The prescale size
 *
 * @see elm_icon_prescale_set()
 *
 * @ingroup Icon
 */
int elm_icon_prescale_get(const Evas_Object* obj);

/**
 * Gets the image object of the icon. DO NOT MODIFY THIS.
 *
 * @param obj The icon object
 * @return The internal icon object
 *
 * @ingroup Icon
 */
Evas_Object* elm_icon_object_get(Evas_Object* obj);

/**
 * Sets the icon lookup order used by elm_icon_standard_set().
 *
 * @param obj The icon object
 * @param order The icon lookup order (can be one of
 * ELM_ICON_LOOKUP_FDO_THEME, ELM_ICON_LOOKUP_THEME_FDO, ELM_ICON_LOOKUP_FDO
 * or ELM_ICON_LOOKUP_THEME)
 *
 * @see elm_icon_order_lookup_get()
 * @see Elm_Icon_Lookup_Order
 *
 * @ingroup Icon
 */
void elm_icon_order_lookup_set(Evas_Object* obj, Elm_Icon_Lookup_Order order);

/**
 * Gets the icon lookup order.
 *
 * @param obj The icon object
 * @return The icon lookup order
 *
 * @see elm_icon_order_lookup_set()
 * @see Elm_Icon_Lookup_Order
 *
 * @ingroup Icon
 */
Elm_Icon_Lookup_Order elm_icon_order_lookup_get(const Evas_Object* obj);

/**
 * Enable or disable preloading of the icon
 *
 * @param obj The icon object
 * @param disabled If EINA_TRUE, preloading will be disabled
 * @ingroup Icon
 */
void elm_icon_preload_disabled_set(Evas_Object* obj, Eina_Bool disabled);

/**
 * Get if the icon supports animation or not.
 *
 * @param obj The icon object
 * @return @c EINA_TRUE if the icon supports animation,
 *         @c EINA_FALSE otherwise.
 *
 * Return if this elm icon's image can be animated. Currently Evas only
 * supports gif animation. If the return value is EINA_FALSE, other
 * elm_icon_animated_xxx APIs won't work.
 * @ingroup Icon
 */
Eina_Bool elm_icon_animated_available_get(const Evas_Object* obj);

/**
 * Set animation mode of the icon.
 *
 * @param obj The icon object
 * @param animated @c EINA_TRUE if the object do animation job,
 * @c EINA_FALSE otherwise. Default is @c EINA_FALSE.
 *
 * Since the default animation mode is set to EINA_FALSE,
 * the icon is shown without animation. Files like animated GIF files
 * can animate, and this is supported if you enable animated support
 * on the icon.
 * Set it to EINA_TRUE when the icon needs to be animated.
 * @ingroup Icon
 */
void elm_icon_animated_set(Evas_Object* obj, Eina_Bool animated);

/**
 * Get animation mode of the icon.
 *
 * @param obj The icon object
 * @return The animation mode of the icon object
 * @see elm_icon_animated_set
 * @ingroup Icon
 */
Eina_Bool elm_icon_animated_get(const Evas_Object* obj);

/**
 * Set animation play mode of the icon.
 *
 * @param obj The icon object
 * @param play @c EINA_TRUE the object play animation images,
 * @c EINA_FALSE otherwise. Default is @c EINA_FALSE.
 *
 * To play elm icon's animation, set play to EINA_TRUE.
 * For example, you make gif player using this set/get API and click event.
 * This literally lets you control current play or paused state. To have
 * this work with animated GIF files for example, you first, before
 * setting the file have to use elm_icon_animated_set() to enable animation
 * at all on the icon.
 *
 * 1. Click event occurs
 * 2. Check play flag using elm_icon_animated_play_get
 * 3. If elm icon was playing, set play to EINA_FALSE.
 *    Then animation will be stopped and vice versa
 * @ingroup Icon
 */
void elm_icon_animated_play_set(Evas_Object* obj, Eina_Bool play);

/**
 * Get animation play mode of the icon.
 *
 * @param obj The icon object
 * @return The play mode of the icon object
 *
 * @see elm_icon_animated_play_get
 * @ingroup Icon
 */
Eina_Bool elm_icon_animated_play_get(const Evas_Object* obj);

/**
 * Set whether the original aspect ratio of the icon should be kept on resize.
 *
 * @param obj The icon object.
 * @param fixed @c EINA_TRUE if the icon should retain the aspect,
 * @c EINA_FALSE otherwise.
 *
 * The original aspect ratio (width / height) of the icon is usually
 * distorted to match the object's size. Enabling this option will retain
 * this original aspect, and the way that the icon is fit into the object's
 * area depends on the option set by elm_icon_fill_outside_set().
 *
 * @see elm_icon_aspect_fixed_get()
 * @see elm_icon_fill_outside_set()
 *
 * @ingroup Icon
 */
void elm_icon_aspect_fixed_set(Evas_Object* obj, Eina_Bool fixed);

/**
 * Get if the object retains the original aspect ratio.
 *
 * @param obj The icon object.
 * @return @c EINA_TRUE if the object keeps the original aspect, @c EINA_FALSE
 * otherwise.
 *
 * @ingroup Icon
 */
Eina_Bool elm_icon_aspect_fixed_get(const Evas_Object* obj);

/**
 * @}
 */
}
