//Compile with:
//gcc -o efl_thread_1 efl_thread_1.c -g `pkg-config --cflags --libs elementary`
import Elementary;
//import pthread;

Evas_Object* win;
Evas_Object* rect;

//pthread_t thread_id;

// BEGIN - code running in my custom pthread instance
//
void* my_thread_run(void* arg)
{
   double t = 0.0;

   for (;;)
     {
        ecore_thread_main_loop_begin(); // begin critical
          { // indented for illustration of "critical" block
             Evas_Coord x, y;

             x = 200 + (200 * sin(t));
             y = 200 + (200 * cos(t));
             evas_object_move(rect, x - 50, y - 50);
          }
        ecore_thread_main_loop_end(); // end critical
        usleep(1000);
        t += 0.02;
     }
   return NULL;
}
//
// END - code running in my custom pthread instance

static void
my_thread_new(void)
{
   pthread_attr_t attr;

   if (pthread_attr_init(&attr) != 0)
      perror("pthread_attr_init");
   if (pthread_create(&thread_id, &attr, my_thread_run, NULL) != 0)
      perror("pthread_create");
}

EAPI_MAIN int
elm_main(int argc, char **argv)
{
   Evas_Object *o, *bg;

   win = elm_win_add(NULL, "efl-thread-1", ELM_WIN_BASIC);
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
   my_thread_new();

   elm_run();
   elm_shutdown();

   return 0;
}
ELM_MAIN()
