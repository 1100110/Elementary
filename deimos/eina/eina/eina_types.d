/* EINA - EFL data type library
 * Copyright (C) 2007-2008 Carsten Haitzler, Vincent Torri, Jorge Luis Zapata Muga
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
module eina_types;

extern (C)  {
/**
 * @addtogroup Eina_Core_Group Core
 *
 * @{
 */
/**
 * @defgroup Eina_Types_Group Types
 *
 * @{
 */
/**
 * @def EAPI
 * @brief Used to export functions(by changing visibility).
 */
/**
 * @def EINA_WARN_UNUSED_RESULT
 * Used to warn when the returned value of the function is not used.
 */
/**
 * @def EINA_ARG_NONNULL
 * Used to warn when the specified arguments of the function are @c NULL.
 */
/**
 * @def EINA_DEPRECATED
 * Used to warn when the function is considered as deprecated.
 */
/**
 * @def EINA_MALLOC
 * @brief EINA_MALLOC is used to tell the compiler that a function may be treated
 * as if any non-NULL pointer it returns cannot alias any other pointer valid when
 * the function returns and that the memory has undefined content.
 */
/**
 * @def EINA_PURE
 * @brief EINA_PURE is used to tell the compiler this functions has no effects
 * except the return value and their return value depends only on the parameters
 * and/or global variables.
 */
/**
 * @def EINA_PRINTF
 * @param fmt The format to be used.
 * @param arg The argument to be used.
 */
/**
 * @def EINA_SCANF
 * @param fmt The format to be used.
 * @param arg The argument to be used.
 */
/**
 * @def EINA_FORMAT
 * @param fmt The format to be used.
 */
/**
 * @def EINA_CONST
 * @brief Attribute from gcc to prevent the function to read/modify any global memory.
 */
/**
 * @def EINA_NOINSTRUMENT
 * @brief Attribute from gcc to disable instrumentation for a specific function.
 */
/**
 * @def EINA_UNLIKELY
 * @param exp The expression to be used.
 */
/**
 * @def EINA_LIKELY
 * @param exp The expression to be used.
 */
/**
 * @typedef Eina_Bool
 * Type to mimic a boolean.
 *
 * @note it differs from stdbool.h as this is defined as an unsigned
 *       char to make it usable by bitfields (Eina_Bool name:1) and
 *       also take as few bytes as possible.
 */
alias ubyte Eina_Bool;   //uchar

/**
 * @def EINA_FALSE
 * boolean value FALSE (numerical value 0)
 */
immutable EINA_FALSE = cast(Eina_Bool)0;

/**
 * @def EINA_TRUE
 * boolean value TRUE (numerical value 1)
 */
immutable EINA_TRUE = cast(Eina_Bool)1;

__gshared const uint eina_prime_table[];

/**
 * @typedef Eina_Compare_Cb
 * Function used in functions using sorting. It compares @p data1 and
 * @p data2. If @p data1 is 'less' than @p data2, -1 must be returned,
 * if it is 'greater', 1 must be returned, and if they are equal, 0
 * must be returned.
 */
alias int function(const void* data1, const void* data2) *Eina_Compare_Cb;

/**
 * @def EINA_COMPARE_CB
 * Macro to cast to Eina_Compare_Cb.
 */
//TODO check ALL this shit...  stupid function pointers...
Eina_Compare_Cb EINA_COMPARE_CB(I:int*)(I func)
{
    return cast(Eina_Compare_Cb*)func;
}

/**
 * @typedef Eina_Each_Cb
 * A callback type used when iterating over a container.
 */
alias Eina_Bool function(const void* container, void* data, void* fdata)
                            *Eina_Each_Cb;

/**
 * @def EINA_EACH_CB
 * Macro to cast to Eina_Each.
 */
/// #define EINA_EACH_CB(Function) ((Eina_Each_Cb)Function)
Eina_Each_Cb EINA_EACH_CB(I:ubyte*)(I func)
{
    return cast(Eina_Each_Cb*)func;
}

/**
 * @typedef Eina_Free_Cb
 * A callback type used to free data when iterating over a container.
 */
alias void function(void* data) *Eina_Free_Cb;

/**
 * @def EINA_FREE_CB
 * Macro to cast to Eina_Free_Cb.
 */
/// #define EINA_FREE_CB(Function) ((Eina_Free_Cb)Function)
Eina_Free_Cb EINA_FREE_CB(I:void*)(I func)
{
    return cast(Eina_Free_Cb*)func;
}

/**
 * @def EINA_C_ARRAY_LENGTH
 * Macro to return the array length of a standard c array.
 * For example:
 * int foo[] = { 0, 1, 2, 3 };
 * would return 4 and not 4 * sizeof(int).
 * @since 1.2.0
 */
/// #define EINA_C_ARRAY_LENGTH(arr) (sizeof(arr) / sizeof((arr)[0]))
int EINA_C_ARRAY_LENGTH(S)(S arr)
{
    return (arr.sizeof / arr[0].sizeof);
}
/**
 * @}
 */
/**
 * @}
 */
}
