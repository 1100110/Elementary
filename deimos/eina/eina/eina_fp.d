/* EINA - EFL data type library
 * Copyright (C) 2007-2008 Jorge Luis Zapata Muga
 * Copyright (C) 2009 Cedric BAIL
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
module eina_fp;

public import eina_types;

extern (C)  {

public import std.stdint;

immutable EINA_F32P32_PI = 0x00000003243f6a89;

alias int64_t Eina_F32p32;
alias int32_t Eina_F16p16;
alias int32_t Eina_F8p24;

/// Literally All of these are static inline.
Eina_F32p32     eina_f32p32_int_from(int32_t v);
int32_t         eina_f32p32_int_to(Eina_F32p32 v);
Eina_F32p32     eina_f32p32_double_from(double v);
double          eina_f32p32_double_to(Eina_F32p32 v);


Eina_F32p32     eina_f32p32_add(Eina_F32p32 a, Eina_F32p32 b);
Eina_F32p32     eina_f32p32_sub(Eina_F32p32 a, Eina_F32p32 b);
Eina_F32p32     eina_f32p32_mul(Eina_F32p32 a, Eina_F32p32 b);
Eina_F32p32     eina_f32p32_scale(Eina_F32p32 a, Eina_F32p32 b);
Eina_F32p32     eina_f32p32_div(Eina_F32p32 a, Eina_F32p32 b);
Eina_F32p32     eina_f32p32_sqrt(Eina_F32p32 a, Eina_F32p32 b);
uint            eina_f32p32_fracc_get(Eina_F32p32 a, Eina_F32p32 b);

/// dont use llabs - issues if not on 64bit
// Yay!  does that mean I don't have to define it??
// ... Please??
/// #define eina_fp32p32_llabs(a) ((a < 0) ? -(a) : (a))
//TODO hate fucking defines...
//auto eina_fp32p32_llabs(auto a)  {
//    if(a>0)
//        return  -(a);
//    else
//        return  (a);
//}

Eina_F32p32     eina_f32p32_cos(Eina_F32p32 a);
Eina_F32p32     eina_f32p32_sin(Eina_F32p32 a);

Eina_F16p16     eina_f16p16_int_from(int32_t v);
int32_t         eina_f16p16_int_to(Eina_F16p16 v);
Eina_F16p16     eina_f16p16_float_from(float v);
//TODO  make sure float is all right...
float           eina_f16p16_float_to(Eina_F16p16 v);

Eina_F16p16     eina_f16p16_add(Eina_F16p16 a, Eina_F16p16 b);
Eina_F16p16     eina_f16p16_sub(Eina_F16p16 a, Eina_F16p16 b);
Eina_F16p16     eina_f16p16_mul(Eina_F16p16 a, Eina_F16p16 b);
Eina_F16p16     eina_f16p16_scale(Eina_F16p16 a, int b);
Eina_F16p16     eina_f16p16_div(Eina_F16p16 a, Eina_F16p16 b);
Eina_F16p16     eina_f16p16_sqrt(Eina_F16p16 a);
uint            eina_f16p16_fracc_get(Eina_F16p16 v);

Eina_F8p24      eina_f8p24_int_from(int32_t v);
int32_t         eina_f8p24_int_to(Eina_F8p24);
Eina_F8p24      eina_f8p24_float_from(float v);
//TODO
float           eina_f8p24_float_to(Eina_F8p24 v);

Eina_F8p24      eina_f8p24_add(Eina_F8p24 a, Eina_F8p24 b);
Eina_F8p24      eina_f8p24_sub(Eina_F8p24 a, Eina_F8p24 b);
Eina_F8p24      eina_f8p24_mul(Eina_F8p24 a, Eina_F8p24 b);
Eina_F8p24      eina_f8p24_scale(Eina_F8p24 a, int b);
Eina_F8p24      eina_f8p24_div(Eina_F8p24 a, Eina_F8p24 b);
Eina_F8p24      eina_f8p24_sqrt(Eina_F8p24 a);
uint            eina_f8p24_fracc_get(Eina_F8p24 v);

Eina_F16p16     eina_f16p16_to_f32p32(Eina_F16p16 a);
Eina_F32p32     eina_f8p24_to_f32p32(Eina_F8p24 a);
Eina_F16p16     eina_f32p32_tof16p16(Eina_F32p32 a);
Eina_F16p16     eina_f8p24_to_f16p16(Eina_F8p24 a);
Eina_F8p24      eina_f32p32_to_f8p24(Eina_F32p32 a);
Eina_F8p24      eina_f16p16_to_f8p24(Eina_F16p16 a);

}/// #endif
