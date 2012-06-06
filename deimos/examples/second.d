import std.string;
import Elementary;
import Evas;

void on_done(void* data, Evas_Object* obj, void* event_info)
{
   // quit the mainloop (elm_run function will return)
   elm_exit();
}

int elm_main(int argc, char** argv)
{
    Evas_Object* win, box, lab, btn;

    // new window - do the usual and give it a name (hello) and title (Hello)
    win = elm_win_util_standard_add("Hello", "Hello");

    // when the user clicks "close" on a window there is a request to delete
    //TODO fix this, fix the shit...
    evas_object_smart_callback_add(win, "delete,request",
                            cast(Evas_Smart_Cb)&on_done, null);

    // add a box object - default is vertical. a box holds children in a row,
    // either horizontally or vertically. nothing more.
    box = elm_box_add(win);

    // make the box horizontal
    elm_box_horizontal_set(box, true);

    // add object as a resize object for the window (controls window minimum
    // size as well as gets resized if window is resized)
    elm_win_resize_object_add(win, box);
    evas_object_show(box);

    // add a label widget, set the text and put it in the pad frame
    lab = elm_label_add(win);

    // set default text of the label
    elm_object_text_set(lab, "Hello out there world!");

    // pack the label at the end of the box
    elm_box_pack_end(box, lab);
    evas_object_show(lab);

    // add an ok button
    btn = elm_button_add(win);

    // set default text of button to "OK"
    elm_object_text_set(btn, "OK");

    // pack the button at the end of the box
    elm_box_pack_end(box, btn);
    evas_object_show(btn);

    // call on_done when button is clicked
    evas_object_smart_callback_add(btn, "clicked",
                            cast(Evas_Smart_Cb)&on_done, null);

    // now we are done, show the window
    evas_object_show(win);

    // run the mainloop and process events and callbacks
    elm_run();
    elm_shutdown();
    return 0;
}

//Contains the actual int main()
mixin(ELM_MAIN!());
