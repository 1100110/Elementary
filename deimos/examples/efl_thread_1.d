#!/usr/bin/rdmd
//Compile with:
//gcc -o efl_thread_1 efl_thread_1.c -g `pkg-config --cflags --libs elementary`
//Don't listen to it, it don't know nothin..

import Elementary;
//import pthread

__gshared Evas_Object* win = null;
static Evas_Object *rect = null;

static pthread_t thread_id;

// BEGIN - code running in my custom pthread instance
//
void myThreadRun(void* arg)
{
   double t = 0.0;
    
   //inf.
    for (;;)
    {
        ecore_thread_main_loop_begin(); // begin critical
        {
            Evas_Coord x, y;

            x = 200 + (200 * sin(t));
            y = 200 + (200 * cos(t));
            evas_object_move(rect, x - 50, y - 50);
        }
        ecore_thread_main_loop_end(); // end critical
        usleep(1000);
        t += 0.02;
     }
}
//
// END - code running in my custom pthread instance

void myThreadNew()
{
   pthread_attr_t attr;

   if (pthread_attr_init(&attr) != 0)
      perror("pthread_attr_init");
   if (pthread_create(&thread_id, &attr, myThreadRun, null) != 0)
      perror("pthread_create");
}

int elm_main(int argc, char **argv)
{
   Evas_Object* o, bg;

   win = elm_win_add(null, "efl-thread-1", ELM_WIN_BASIC);
   elm_win_title_set(win, "EFL Thread 1");
   elm_win_autodel_set(win, EINA_TRUE);
   elm_policy_set(ELM_POLICY_QUIT, ELM_POLICY_QUIT_LAST_WINDOW_CLOSED);
   evas_object_resize(win, 400, 400);
   evas_object_show(win);

   bg = elm_bg_add(win);
   evas_object_size_hint_weight_set(bg, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND);
   elm_win_resize_object_add(win, bg);
   evas_object_show(bg);

   o = evas_object_rectangle_add(evas_object_evas_get(win));
   evas_object_color_set(o, 50, 80, 180, 255);
   evas_object_resize(o, 100, 100);
   evas_object_show(o);
   rect = o;

   // create custom thread to do some "work on the side"
   myThreadNew();

   elm_run();
   elm_shutdown();

   return 0;
}
mixin(ELM_MAIN!());
