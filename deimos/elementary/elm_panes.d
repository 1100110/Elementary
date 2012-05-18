/**
 * @defgroup Panes Panes
 * @ingroup Elementary
 *
 * @image html img/widget/panes/preview-00.png
 * @image latex img/widget/panes/preview-00.eps width=\textwidth
 *
 * @image html img/panes.png
 * @image latex img/panes.eps width=\textwidth
 *
 * The panes widget adds a draggable bar between two contents. When dragged
 * this bar will resize contents' size.
 *
 * Panes can be displayed vertically or horizontally, and contents
 * size proportion can be customized (homogeneous by default).
 *
 * Smart callbacks one can listen to:
 * - "press" - The panes has been pressed (button wasn't released yet).
 * - "unpressed" - The panes was released after being pressed.
 * - "clicked" - The panes has been clicked>
 * - "clicked,double" - The panes has been double clicked
 *
 * Available styles for it:
 * - @c "default"
 *
 * Default content parts of the panes widget that you can use are:
 * @li "left" - A leftside content of the panes
 * @li "right" - A rightside content of the panes
 *
 * If panes are displayed vertically, left content will be displayed on
 * top.
 *
 * Supported elm_object common APIs.
 * @li @ref elm_object_part_content_set
 * @li @ref elm_object_part_content_get
 * @li @ref elm_object_part_content_unset
 *
 * Here is an example on its usage:
 * @li @ref panes_example
 *
/**
 * @addtogroup Panes
 * @{
 *
/**
 * Add a new panes widget to the given parent Elementary
 * (container) object.
 *
 * @param parent The parent object.
 * @return a new panes widget handle or @c NULL, on errors.
 *
 * This function inserts a new panes widget on the canvas.
 *
 * @ingroup Panes
 */
module elm_panes;

import Eina;
import Evas;

extern (C)  {

Evas_Object *elm_panes_add(Evas_Object *parent);

/**
 * Set whether the left and right panes resize homogeneously or not.
 *
 * @param obj The panes object.
 * @param fixed Use @c EINA_TRUE to make @p obj to be
 * resize the left and right panes @b homogeneously.
 * Use @c EINA_FALSE to make use of the values specified in
 * elm_panes_content_left_size_set() and
 * elm_panes_content_right_size_set()
 * to resize the left and right panes.
 *
 * By default panes are resized homogeneously.
 *
 * @see elm_panes_fixed_get()
 * @see elm_panes_content_left_size_set()
 * @see elm_panes_content_right_size_set()
 *
 * @ingroup Panes
 */
void elm_panes_fixed_set(Evas_Object *obj, Eina_Bool fixed);

/**
 * Retrieve the resize mode for the panes of a given panes widget.
 *
 * @param obj The panes object.
 * @return @c EINA_TRUE, if @p obj is set to be resized @b homogeneously,
 *
 * @see elm_panes_fixed_set() for more details.
 * @see elm_panes_content_left_size_get()
 * @see elm_panes_content_right_size_get()
 *
 * @ingroup Panes
 */
Eina_Bool elm_panes_fixed_get(const Evas_Object *obj);

/**
 * Get the size proportion of panes widget's left side.
 *
 * @param obj The panes object.
 * @return float value between 0.0 and 1.0 representing size proportion
 * of left side.
 *
 * @see elm_panes_content_left_size_set() for more details.
 *
 * @ingroup Panes
 */
double elm_panes_content_left_size_get(const Evas_Object *obj);

/**
 * Set the size proportion of panes widget's left side.
 *
 * @param obj The panes object.
 * @param size Value between 0.0 and 1.0 representing size proportion
 * of left side.
 *
 * By default it's homogeneous, i.e., both sides have the same size.
 *
 * If something different is required, it can be set with this function.
 * For example, if the left content should be displayed over
 * 75% of the panes size, @p size should be passed as @c 0.75.
 * This way, right content will be resized to 25% of panes size.
 *
 * If displayed vertically, left content is displayed at top, and
 * right content at bottom.
 *
 * @note This proportion will change when user drags the panes bar.
 *
 * @see elm_panes_content_left_size_get()
 *
 * @ingroup Panes
 */
void elm_panes_content_left_size_set(Evas_Object *obj, double size);

/**
 * Get the size proportion of panes widget's right side.
 *
 * @param obj The panes object.
 * @return float value between 0.0 and 1.0 representing size proportion
 * of right side.
 *
 * @see elm_panes_content_right_size_set() for more details.
 *
 * @ingroup Panes
 */
double elm_panes_content_right_size_get(const Evas_Object *obj);

/**
 * Set the size proportion of panes widget's right side.
 *
 * @param obj The panes object.
 * @param size Value between 0.0 and 1.0 representing size proportion
 * of right side.
 *
 * By default it's homogeneous, i.e., both sides have the same size.
 *
 * If something different is required, it can be set with this function.
 * For example, if the right content should be displayed over
 * 75% of the panes size, @p size should be passed as @c 0.75.
 * This way, left content will be resized to 25% of panes size.
 *
 * If displayed vertically, left content is displayed at top, and
 * right content at bottom.
 *
 * @note This proportion will change when user drags the panes bar.
 *
 * @see elm_panes_content_right_size_get()
 *
 * @ingroup Panes
 */
void elm_panes_content_right_size_set(Evas_Object *obj, double size);


/**
 * Set the orientation of a given panes widget.
 *
 * @param obj The panes object.
 * @param horizontal Use @c EINA_TRUE to make @p obj to be
 * @b horizontal, @c EINA_FALSE to make it @b vertical.
 *
 * Use this function to change how your panes is to be
 * disposed: vertically or horizontally.
 *
 * By default it's displayed horizontally.
 *
 * @see elm_panes_horizontal_get()
 *
 * @ingroup Panes
 */
void elm_panes_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);

/**
 * Retrieve the orientation of a given panes widget.
 *
 * @param obj The panes object.
 * @return @c EINA_TRUE, if @p obj is set to be @b horizontal,
 * @c EINA_FALSE if it's @b vertical (and on errors).
 *
 * @see elm_panes_horizontal_set() for more details.
 *
 * @ingroup Panes
 */
Eina_Bool elm_panes_horizontal_get(const Evas_Object *obj);

/**
 * @}
 */
}
