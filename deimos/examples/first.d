import std.stdio;
import std.string;

//This works...
// import elm_temp_try;
//This works...
//import elm_general;

//Now it works!!
import Elementary;

int elm_main(int argc, in char** argv)
{
    // create window(s) here and do any application init
    elm_run(); // run main loop
    elm_shutdown(); // after mainloop finishes running, shutdown
    return 0; // exit 0 for exit code
}

mixin(ELM_MAIN!());
