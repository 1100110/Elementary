/* EINA - EFL data type library
 * Copyright (C) 2007-2008 Jorge Luis Zapata Muga
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library;
 * if not, see <http://www.gnu.org/licenses/>.
 */
module eina_rectangle;

public import eina_types;

extern  (C) {

/**
 * @addtogroup Eina_Rectangle_Group Rectangle
 *
 * @brief These functions provide rectangle management.
 *
/**
 * @addtogroup Eina_Tools_Group Tools
 *
 * @{
 *
/**
 * @defgroup Eina_Rectangle_Group Rectangle
 *
 * @{
 *
/**
 * @typedef Eina_Rectangle
 * Simple rectangle structure.
 */
struct Eina_Rectangle
{
   int x; /**< top-left x co-ordinate of rectangle */
   int y; /**< top-left y co-ordinate of rectangle */
   int w; /**< width of rectangle */
   int h; /**< height of rectangle */
}

/**
 * @typedef Eina_Rectangle_Pool
 * Type for an opaque pool of rectangle.
 */
/// typedef struct _Eina_Rectangle_Pool Eina_Rectangle_Pool;
struct Eina_Rectangle_Pool;

//All of these are static inline
int         eina_spans_intersect(int c1, int l1, int c2, int l2);
Eina_Bool   eina_rectangle_is_empty(const Eina_Rectangle* r);
void        eina_rectangle_coords_from(Eina_Rectangle* r, int x, int y, int w, int h);
Eina_Bool   eina_rectangles_intersect(const Eina_Rectangle* r1, const Eina_Rectangle* r2);
Eina_Bool   eina_rectangle_xcoord_inside(const Eina_Rectangle* r, int x);
Eina_Bool   eina_rectangle_ycoord_inside(const Eina_Rectangle* r, int y);
Eina_Bool   eina_rectangle_coords_inside(const Eina_Rectangle* r, int x, int y);

void        eina_rectangle_union(Eina_Rectangle* dst, const Eina_Rectangle* src);
Eina_Bool   eina_rectangle_intersection(Eina_Rectangle* dst, const Eina_Rectangle* src);
void        eina_rectangle_rescale_in(const Eina_Rectangle* eout, const Eina_Rectangle* ein);
void        eina_rectangle_rescale_out(const Eina_Rectangle* eout, const Eina_Rectangle* ein,
                                        Eina_Rectangle* res);

/**
 * @brief Add a rectangle in a new pool.
 *
 * @param w The width of the rectangle.
 * @param h The height of the rectangle.
 * @return A newly allocated pool on success, @c NULL otherwise.
 *
 * This function adds the rectangle of size (@p width, @p height) to a
 * new pool. If the pool can not be created, @c NULL is
 * returned. Otherwise the newly allocated pool is returned.
 */
// These aren't static inline
Eina_Rectangle_Pool*    eina_rectangle_pool_new(int w, int h);
/**
 * @brief Return the pool of the given rectangle.
 *
 * @param rect The rectangle.
 * @return The pool of the given rectangle.
 *
 * This function returns the pool in which @p rect is. If  @p rect is
 * @c NULL, @c NULL is returned.
 */
Eina_Rectangle_Pool*    eina_rectangle_pool_get(Eina_Rectangle* rect);

/**
 * @brief Return the width and height of the given pool.
 *
 * @param pool The pool.
 * @param w The returned width.
 * @param h The returned height.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * This function returns the width and height of @p pool and store
 * them in respectively @p w and @p h if they are not @c NULL. If
 * @p pool is @c NULL, #EINA_FALSE is returned. Otherwise #EINA_TRUE is
 * returned.
 */
Eina_Bool               eina_rectangle_pool_geometry_get(Eina_Rectangle_Pool* pool, int* w, int* h);

/**
 * @brief Get the data from the given pool.
 *
 * @param pool The pool.
 * @return The returned data.
 *
 * This function gets the data from @p pool set by
 * eina_rectangle_pool_data_set(). If @p pool is @c NULL, this
 * function returns @c NULL.
 */
void*                   eina_rectangle_pool_data_get(Eina_Rectangle_Pool* pool);

/**
 * @brief Set the data to the given pool.
 *
 * @param pool The pool.
 * @param data The data to set.
 *
 * This function sets @p data to @p pool. If @p pool is @c NULL, this
 * function does nothing.
 */
void                    eina_rectangle_pool_data_set(Eina_Rectangle_Pool* pool, const void* data);

/**
 * @brief Free the given pool.
 *
 * @param pool The pool to free.
 *
 * This function frees the allocated data of @p pool. If @p pool is
 * @c NULL, ths function returned immediately.
 */
void                    eina_rectangle_pool_free(Eina_Rectangle_Pool* pool);

/**
 * @brief Return the number of rectangles in the given pool.
 *
 * @param pool The pool.
 * @return The number of rectangles in the pool.
 *
 * This function returns the number of rectangles in @p pool.
 */
int                     eina_rectangle_pool_count(Eina_Rectangle_Pool* pool);

/**
 * @brief Request a rectangle of given size in the given pool.
 *
 * @param pool The pool.
 * @param w The width of the rectangle to request.
 * @param h The height of the rectangle to request.
 * @return The requested rectangle on success, @c NULL otherwise.
 *
 * This function retrieve from @p pool the rectangle of width @p w and
 * height @p h. If @p pool is @c NULL, or @p w or @p h are non-positive,
 * the function returns @c NULL. If @p w or @p h are greater than the
 * pool size, the function returns @c NULL. On success, the function
 * returns the rectangle which matches the size (@p w, @p h).
 * Otherwise it returns @c NULL.
 */
Eina_Rectangle*         eina_rectangle_pool_request(Eina_Rectangle_Pool* pool, int w, int h);

/**
 * @brief Remove the given rectangle from the pool.
 *
 * @param rect The rectangle to remove from the pool.
 *
 * This function removes @p rect from the pool. If @p rect is
 * @c NULL, the function returns immediately. Otherwise it remoes @p
 * rect from the pool.
 */
void                    eina_rectangle_pool_release(Eina_Rectangle* rect);

/**
 * @def EINA_RECTANGLE_SET
 * @brief Macro to set the values of a #Eina_Rectangle.
 *
 * @param Rectangle The rectangle to set the values.
 * @param X The X coordinate of the top left corner of the rectangle.
 * @param Y The Y coordinate of the top left corner of the rectangle.
 * @param W The width of the rectangle.
 * @param H The height of the rectangle.
 *
 * This macro set the values of @p Rectangle. (@p X, @p Y) is the
 * coordinates of the top left corner of @p Rectangle, @p W is its
 * width and @p H is its height.
 */
/** #define EINA_RECTANGLE_SET(Rectangle, X, Y, W, H)   \
    (Rectangle)->x = X;                                 \
    (Rectangle)->y = Y;                                 \
    (Rectangle)->w = W;                                 \
    (Rectangle)->h = H;
*/
//TODO check
void EINA_RECTANGLE_SET(R:Eina_Rectangle, I:int)(R rect, I X, I Y, I W, I H)
{
    rect.x = X;
    rect.y = Y;
    rect.w = W;
    rect.h = H;
}

/**
 * @brief Create a new rectangle.
 *
 * @param x The X coordinate of the top left corner of the rectangle.
 * @param y The Y coordinate of the top left corner of the rectangle.
 * @param w The width of the rectangle.
 * @param h The height of the rectangle.
 * @return The new rectangle on success, @ NULL otherwise.
 *
 * This function creates a rectangle which top left corner has the
 * coordinates (@p x, @p y), with height @p w and height @p h and adds
 * it to the rectangles pool. No check is done on @p w and @p h. This
 * function returns a new rectangle on success, @c NULL otherwhise.
 */
Eina_Rectangle* eina_rectangle_new(int x, int y, int w, int h);

/**
 * @brief Free the given rectangle.
 *
 * @param rect The rectangle to free.
 *
 * This function removes @p rect from the rectangles pool.
 */
void            eina_rectangle_free(Eina_Rectangle* rect);
/**
 * @}
 *
/**
 * @}
 */
}///#endif /*_EINA_RECTANGLE_H_*/
