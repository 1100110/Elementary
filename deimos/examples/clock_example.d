/**
 * Simple Elementary's <b>clock widget</b> example, illustrating its
 * usage and API.
 *
 * See stdout/stderr for output. Compile with:
 *
 * @verbatim
 * gcc -g clock_example.c -o clock_example `pkg-config --cflags --libs elementary`
 * @endverbatim
 */

import Elementary;
import std.string;
import std.stdio;

void on_done(void* data, Evas_Object* obj, void* event_info)   {
   elm_exit();
}

int elm_main(int argc, char** argv) {

   Evas_Object* win, bg, bx, ck;
   Elm_Clock_Edit_Mode digedit;

   win = elm_win_add(null, toStringz("clock"), Elm_Win_Type.ELM_WIN_BASIC);
   elm_win_title_set(win, toStringz("Clock Example"));
   evas_object_smart_callback_add(win, toStringz("delete,request"), cast(Evas_Smart_Cb)&on_done, null);

   bg = elm_bg_add(win);
   elm_win_resize_object_add(win, bg);
   //evas_object_size_hint_weight_set(bg, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND);
   evas_object_show(bg);

   bx = elm_box_add(win);
   //evas_object_size_hint_weight_set(bx, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND);
   elm_win_resize_object_add(win, bx);
   evas_object_show(bx);

   ///* pristine (no seconds, military time) */
   ck = elm_clock_add(win);
   elm_box_pack_end(bx, ck);
   evas_object_show(ck);

   ///* am/pm */
   ck = elm_clock_add(win);
   elm_clock_show_am_pm_set(ck, EINA_TRUE);
   elm_box_pack_end(bx, ck);
   evas_object_show(ck);

   ///* with seconds and custom time */
   ck = elm_clock_add(win);
   elm_clock_show_seconds_set(ck, EINA_TRUE);
   elm_clock_time_set(ck, 10, 11, 12);
   elm_box_pack_end(bx, ck);
   evas_object_show(ck);

   ///* in edition mode, with seconds, custom time and am/pm set */
   ck = elm_clock_add(win);
   elm_clock_edit_set(ck, EINA_TRUE);
   elm_clock_show_seconds_set(ck, EINA_TRUE);
   elm_clock_show_am_pm_set(ck, EINA_TRUE);
   elm_clock_time_set(ck, 10, 11, 12);
   elm_box_pack_end(bx, ck);
   evas_object_show(ck);

   ///* in edition mode, with seconds, but only some digits editable */
   ck = elm_clock_add(win);
   elm_clock_show_seconds_set(ck, EINA_TRUE);
   elm_clock_edit_set(ck, EINA_TRUE);
   digedit = Elm_Clock_Edit_Mode.ELM_CLOCK_EDIT_HOUR_UNIT |
           Elm_Clock_Edit_Mode.ELM_CLOCK_EDIT_MIN_UNIT |
           Elm_Clock_Edit_Mode.ELM_CLOCK_EDIT_SEC_UNIT;
   elm_clock_edit_mode_set(ck, digedit);
   elm_box_pack_end(bx, ck);
   evas_object_show(ck);

   evas_object_show(win);

   elm_run();
   elm_shutdown();

   return 0;
}

mixin(ELM_MAIN!());
