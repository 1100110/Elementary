/* EINA - EFL data type library
 * Copyright (C) 2008 Cedric Bail
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
module eina_accessor;


public import eina_config;
public import eina_types;
public import eina_magic;

extern (C)  {

/**
 * @page eina_accessor_example_01_page Eina_Accessor usage
 * @dontinclude eina_accessor_01.c
 *
 * We start by including necessary headers, declaring variables and
 * initializing eina:
 * @skip #include
 * @until eina_init
 *
 * Next we populate our array and list:
 * @until }
 *
 * Now that we have two containers populated we can actually start the example
 * and create an accessor:
 * @until accessor_new
 *
 * Once having the accessor we can use it to access certain elements in the
 * container:
 * @until }
 * @note Unlike iterators accessors allow us non-linear access, which allows us
 * to print only the odd elements in the container.
 *
 * As with every other resource we allocate we need to free the accessor(and the
 * array):
 * @until array_free
 *
 * Now we create another accessor, this time for the list:
 * @until accessor_new
 *
 * And now the interesting bit, we use the same code we used above to print
 * parts of the array to print parts of the list:
 * @until }
 *
 * And to free the list we use a gimmick, instead of freeing @a list, we ask the
 * accessor for it's container and free that:
 * @until list_free
 *
 * Finally we shut eina down and leave:
 * @until }
 *
 * The full source code can be found on the examples folder
 * on the @ref eina_accessor_01_c "eina_accessor_01.c" file.
 *
/**
 * @page eina_accessor_01_c Eina_Accessor usage example
 *
 * @include eina_accessor_01.c
 * @example eina_accessor_01.c
 *
/**
 * @addtogroup Eina_Accessor_Group Accessor Functions
 *
 * @brief These functions manage accessor on containers.
 *
 * These functions allow to access elements of a container in a
 * generic way, without knowing which container is used (a bit like
 * iterators in the C++ STL). Accessors allows random access (that is, any
 * element in the container). For sequential access, see
 * @ref Eina_Iterator_Group.
 *
 * An accessor is created from container data types, so no creation
 * function is available here. An accessor is deleted with
 * eina_accessor_free(). To get the data of an element at a given
 * position, use eina_accessor_data_get(). To call a function on
 * chosen elements of a container, use eina_accessor_over().
 *
 * See an example @ref eina_accessor_example_01_page "here".
 *
/**
 * @addtogroup Eina_Content_Access_Group Content Access
 *
 * @{
 *
/**
 * @defgroup Eina_Accessor_Group Accessor Functions
 *
 * @{
 *
/**
 * @typedef Eina_Accessor
 * Abstract type for accessors.
 */
//struct Eina_Accessor;
/**
 * @typedef Eina_Accessor_Get_At_Callback
 * Type for a callback that returns the data of a container as the given index.
 */
alias Eina_Bool function(Eina_Accessor* it, uint idx, void** data)
                            *Eina_Accessor_Get_At_Callback;

/**
 * @typedef Eina_Accessor_Get_Container_Callback
 * Type for a callback that returns the container.
 */
alias void* function(Eina_Accessor* it) *Eina_Accessor_Get_Container_Callback;

/**
 * @typedef Eina_Accessor_Free_Callback
 * Type for a callback that frees the container.
 */
alias void function(Eina_Accessor* it) *Eina_Accessor_Free_Callback;

/**
 * @typedef Eina_Accessor_Lock_Callback
 * Type for a callback that lock the container.
 */
alias Eina_Bool function(Eina_Accessor* it) *Eina_Accessor_Lock_Callback;

/**
 * @struct _Eina_Accessor
 * Type to provide random access to data structures.
 */
struct Eina_Accessor
{
    immutable EINA_ACCESSOR_VERSION =       1;
        /**< Version of the Accessor API. */
    int                                     Eversion;
        /**< Callback called when a data element is requested. */
    Eina_Accessor_Get_At_Callback           get_at;
        /**< Callback called when the container is requested. */
    Eina_Accessor_Get_Container_Callback    get_container;
        /**< Callback called when the container is freed. */
    Eina_Accessor_Free_Callback             free;
        /**< Callback called when the container is locked. */
    Eina_Accessor_Lock_Callback             lock;
        /**< Callback called when the container is unlocked. */
    Eina_Accessor_Lock_Callback             unlock;

    immutable EINA_MAGIC_ACCESSOR =         0x98761232;
    // EINA_MAGIC
}

/**
 * @def FUNC_ACCESSOR_GET_AT(Function)
 * Helper macro to cast @p Function to a Eina_Accessor_Get_At_Callback.
 */
// #define FUNC_ACCESSOR_GET_AT(Function)        ((Eina_Accessor_Get_At_Callback)Function)

/**
 * @def FUNC_ACCESSOR_GET_CONTAINER(Function)
 * Helper macro to cast @p Function to a Eina_Accessor_Get_Container_Callback.
 */
// #define FUNC_ACCESSOR_GET_CONTAINER(Function) ((Eina_Accessor_Get_Container_Callback)Function)

/**
 * @def FUNC_ACCESSOR_FREE(Function)
 * Helper macro to cast @p Function to a Eina_Accessor_Free_Callback.
 */
// #define FUNC_ACCESSOR_FREE(Function)          ((Eina_Accessor_Free_Callback)Function)

/**
 * @def FUNC_ACCESSOR_LOCK(Function)
 * Helper macro to cast @p Function to a Eina_Iterator_Lock_Callback.
 */
// #define FUNC_ACCESSOR_LOCK(Function)          ((Eina_Accessor_Lock_Callback)Function)

/**
 * @brief Free an accessor.
 *
 * @param accessor The accessor to free.
 *
 * This function frees @p accessor if it is not @c NULL;
 */
void                eina_accessor_free(Eina_Accessor* accessor);

/**
 * @brief Retrieve the data of an accessor at a given position.
 *
 * @param accessor The accessor.
 * @param position The position of the element.
 * @param data The pointer that stores the data to retrieve.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * This function retrieves the data of the element pointed by
 * @p accessor at the porition @p position, and stores it in
 * @p data. If @p accessor is @c NULL or if an error occurred,
 * #EINA_FALSE is returned, otherwise EINA_TRUE is returned.
 */
Eina_Bool           eina_accessor_data_get(Eina_Accessor* accessor,
                                           uint   position,
                                           void** data);

/**
 * @brief Return the container of an accessor.
 *
 * @param accessor The accessor.
 * @return The container which created the accessor.
 *
 * This function returns the container which created @p accessor. If
 * @p accessor is @c NULL, this function returns @c NULL.
 */
void*               eina_accessor_container_get(Eina_Accessor* accessor);

/**
 * @brief Iterate over the container and execute a callback on chosen elements.
 *
 * @param accessor The accessor.
 * @param cb The callback called on the chosen elements.
 * @param start The position of the first element.
 * @param end The position of the last element.
 * @param fdata The data passed to the callback.
 *
 * This function iterates over the elements pointed by @p accessor,
 * starting from the element at position @p start and ending to the
 * element at position @p end. For Each element, the callback
 * @p cb is called with the data @p fdata. If @p accessor is @c NULL
 * or if @p start is greter or equal than @p end, the function returns
 * immediately.
 */
void                eina_accessor_over(Eina_Accessor* accessor,
                                       Eina_Each_Cb   cb,
                                       uint   start,
                                       uint   end,
                                       const void* fdata);

/**
 * @brief Lock the container of the accessor.
 *
 * @param accessor The accessor.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * If the container of the @p accessor permits it, it will be locked. When a
 * container is locked calling eina_accessor_over() on it will return
 * immediately. If @p accessor is @c NULL or if a problem occurred, #EINA_FALSE
 * is returned, otherwise #EINA_TRUE is returned. If the container isn't
 * lockable, it will return EINA_TRUE.
 *
 * @warning None of the existing eina data structures are lockable.
 */
Eina_Bool           eina_accessor_lock(Eina_Accessor* accessor);

/**
 * @brief Unlock the container of the accessor.
 *
 * @param accessor The accessor.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * If the container of the @p accessor permits it and was previously
 * locked, it will be unlocked. If @p accessor is @c NULL or if a
 * problem occurred, #EINA_FALSE is returned, otherwise #EINA_TRUE
 * is returned. If the container is not lockable, it will return
 * EINA_TRUE.
 *
 * @warning None of the existing eina data structures are lockable.
 */
Eina_Bool           eina_accessor_unlock(Eina_Accessor* accessor);

/**
 * @def EINA_ACCESSOR_FOREACH
 * @brief Macro to iterate over all elements easily.
 *
 * @param accessor The accessor to use.
 * @param counter A counter used by eina_accessor_data_get() when
 * iterating over the container.
 * @param data Where to store * data, must be a pointer support getting
 * its address since * eina_accessor_data_get() requires a pointer to
 * pointer!
 *
 * This macro allows a convenient way to loop over all elements in an
 * accessor, very similar to EINA_LIST_FOREACH().
 *
 * This macro can be used for freeing the data of a list, like in the
 * following example. It has the same goal as the one documented in
 * EINA_LIST_FOREACH(), but using accessors:
 *
 * @code
 * Eina_List     *list;
 * Eina_Accessor *accessor;
 * unsigned int   i;
 * char          *data;
 *
 * // list is already filled,
 * // its elements are just duplicated strings
 *
 * accessor = eina_list_accessor_new(list);
 * EINA_ACCESSOR_FOREACH(accessor, i, data)
 *   free(data);
 * eina_accessor_free(accessor);
 * eina_list_free(list);
 * @endcode
 *
 * @note if the datatype provides both iterators and accessors prefer
 *    to use iterators to iterate over, as they're likely to be more
 *    optimized for such task.
 *
 * @note this example is not optimal algorithm to release a list since
 *    it will walk the list twice, but it serves as an example. For
 *    optimized version use EINA_LIST_FREE()
 *
 * @warning unless explicitly stated in functions returning accessors,
 *    do not modify the accessed object while you walk it, in this
 *    example using lists, do not remove list nodes or you might
 *    crash!  This is not a limitiation of accessors themselves,
 *    rather in the accessors implementations to keep them as simple
 *    and fast as possible.
 */
// #define EINA_ACCESSOR_FOREACH(accessor, counter, data)                  \
//  for ((counter) = 0;                                                   \
//       eina_accessor_data_get((accessor), (counter), (void **)(void *)&(data)); \
//       (counter)++)

/**
 * @}
 *
/**
 * @}
 */
}
