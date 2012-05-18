#include <Elementary.h>
EAPI_MAIN int
elm_main(int argc, char **argv)
{
   // create window(s) here and do any application init
   elm_run(); // run main loop
   elm_shutdown(); // after mainloop finishes running, shutdown
   return 0; // exit 0 for exit code
}
ELM_MAIN()
