/*
 * gcc -o button_example_00 button_example_00.c `pkg-config --cflags --libs elementary`
 */
import Elementary;
import std.string;

void on_click(void* data, Evas_Object* obj, void* event_info)
{
   elm_exit();
}

int elm_main(int argc, char** argv)
{
    Evas_Object* win;
    Evas_Object* bg;
    Evas_Object* btn;

    /* Create an win, associate it with a canvas and */
    /* turn it visible on WM (Window Manager).       */
    win = elm_win_add(null, "Greetings", Elm_Win_Type.ELM_WIN_BASIC);
    elm_win_title_set(win, "Hello, World!");
    elm_win_autodel_set(win, EINA_TRUE);
    elm_policy_set(Elm_Policy.ELM_POLICY_QUIT, 
            Elm_Policy_Quit.ELM_POLICY_QUIT_LAST_WINDOW_CLOSED);
    evas_object_resize(win, 240, 60);
    evas_object_show(win);

    /* Create a bg, associate it to an win */
    /* and turn it visible on WM.          */
    bg = elm_bg_add(win);
    //evas_object_size_hint_weight_set(bg, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND);
    //elm_win_resize_object_add(win, bg);
    evas_object_show(bg);

    /* Create a btn, associate to a function, associate */
    /* to win,  give a dimension and position.          */
    btn = elm_button_add(win);
    
    //Found in Elm Object
    //Move the cast out of user code...
    elm_object_text_set(btn, "Good-Bye, World!");
    evas_object_smart_callback_add(btn, "clicked", 
            cast(Evas_Smart_Cb)&on_click, cast(void*)null);
    evas_object_resize(btn, 120, 30);
    evas_object_move(btn, 60, 15);
    evas_object_show(btn);

    elm_run();
    elm_shutdown();

    return 0;
}
mixin(ELM_MAIN!());
