/**
 * @defgroup Bubble Bubble
 * @ingroup Elementary
 *
 * @image html img/widget/bubble/preview-00.png
 * @image latex img/widget/bubble/preview-00.eps
 * @image html img/widget/bubble/preview-01.png
 * @image latex img/widget/bubble/preview-01.eps
 * @image html img/widget/bubble/preview-02.png
 * @image latex img/widget/bubble/preview-02.eps
 *
 * @brief The Bubble is a widget to show text similar to how speech is
 * represented in comics.
 *
 * The bubble widget contains 5 important visual elements:
 * @li The frame is a rectangle with rounded edjes and an "arrow".
 * @li The @p icon is an image to which the frame's arrow points to.
 * @li The @p label is a text which appears to the right of the icon if the
 * corner is "top_left" or "bottom_left" and is right aligned to the frame
 * otherwise.
 * @li The @p info is a text which appears to the right of the label. Info's
 * font is of a lighter color than label.
 * @li The @p content is an evas object that is shown inside the frame.
 *
 * The position of the arrow, icon, label and info depends on which corner is
 * selected. The four available corners are:
 * @li "top_left" - Default
 * @li "top_right"
 * @li "bottom_left"
 * @li "bottom_right"
 *
 * Signals that you can add callbacks for are:
 * @li "clicked" - This is called when a user has clicked the bubble.
 *
 * Default content parts of the bubble that you can use for are:
 * @li "default" - A content of the bubble
 * @li "icon" - An icon of the bubble
 *
 * Default text parts of the button widget that you can use for are:
 * @li "default" - Label of the bubble
 * @li "info" - info of the bubble
 *
 * Supported elm_object common APIs.
 * @li @ref elm_object_part_text_set
 * @li @ref elm_object_part_text_get
 * @li @ref elm_object_part_content_set
 * @li @ref elm_object_part_content_get
 * @li @ref elm_object_part_content_unset
 *
 * For an example of using a bubble see @ref bubble_01_example_page "this".
 *
 * @{
 *
/**
 * Defines the corner values for a bubble.
 *
 * The corner will be used to determine where the arrow of the
 * bubble points to.
 */
module elm_bubble;

import Evas;

extern (C)  {

enum Elm_Bubble_Pos
{
  ELM_BUBBLE_POS_INVALID = -1,
  ELM_BUBBLE_POS_TOP_LEFT,
  ELM_BUBBLE_POS_TOP_RIGHT,
  ELM_BUBBLE_POS_BOTTOM_LEFT,
  ELM_BUBBLE_POS_BOTTOM_RIGHT,
}

/**
 * Add a new bubble to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * This function adds a text bubble to the given parent evas object.
 *
 * @ingroup Bubble
 */
Evas_Object* elm_bubble_add(Evas_Object *parent);

/**
 * Set the corner of the bubble
 *
 * @param obj The bubble object.
 * @param pos The given corner for the bubble.
 *
 * This function sets the corner of the bubble. The corner will be used to
 * determine where the arrow in the frame points to and where label, icon and
 * info are shown.
 *
 *
 * @ingroup Bubble
 */
void elm_bubble_pos_set(Evas_Object *obj, Elm_Bubble_Pos pos);

/**
 * Get the corner of the bubble
 *
 * @param obj The bubble object.
 * @return The given corner for the bubble.
 *
 * This function gets the selected corner of the bubble.
 *
 * @ingroup Bubble
 */
Elm_Bubble_Pos elm_bubble_pos_get(const Evas_Object *obj);

/**
 * @}
 */
}
