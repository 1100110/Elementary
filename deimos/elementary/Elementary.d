/* This is the primary Elementary header file that includes all other useful
 * headers.
 *
 * Elementary is distributed under the LGPLv2 license. Please see the COPYING
 * file that was distributed with this source.
 */
module Elementary;

/// Standard headers for standard system calls etc.
/// Yeah... Don't import stdio...
// public import std.stdio; //and for some reason this breaks EVERYTHING.
// public import std.c.stdlib;
// #include <unistd.h>
// public import std.c.string;
// #include <sys/types.h>
// #include <sys/stat.h>
// #include <sys/time.h>
// #include <sys/param.h>
// public import std.c.math;
// #include <fnmatch.h>
// #include <limits.h>
// public import std.ctype;
// public import std.c.time;
// #ifdef ELM_DIRENT_H
// #include <dirent.h>
// #endif
// #include <pwd.h>
// #include <errno.h>

// #ifdef ELM_UNIX
// #include <locale.h>
// #ifdef ELM_LIBINTL_H
// #include <libintl.h>
// #endif
// #include <signal.h>
// #include <grp.h>
// #include <glob.h>
// #endif


/** EFL headers */
public import Eina;
// public import Eet;
public import Evas;
// public import Evas_GL;
// public import Ecore;
// public import Ecore_Evas;
// public import Ecore_File;
// public import Ecore_IMF;
// public import Ecore_con;
public import Edje;

version(E_DBus) {
    public import E_DBus;
}

version(ELM_EFREET) {
    public import Efreet;
    public import Efreet_Mime;
    public import Efreet_Trash;
}

version(ELM_ETHUMB) {
    public import Ethumb_Client;
}

version(ELM_EMAP)   {
    public import Emap;
}

/** allow usage from d */
extern (C)  {

/** Docs
 *      These do nothing, but can teach you a few things
 */
public import elm_intro;
public import elm_getting_started;
public import elm_authors;

immutable ELM_VERSION_MAJOR=1;
immutable ELM_VERSION_MINOR=0;

struct Elm_Version
{
   int major;
   int minor;
   int micro;
   int revision;
}

__gshared Elm_Version* elm_version;

/** include these first for general used definitions */
public import elm_general;
public import elm_tooltip;
public import elm_object_item;

/** special widgets - types used elsewhere */
public import elm_icon;
public import elm_scroller;
public import elm_entry;
public import elm_list;

/** other includes */
/// Tom Hacohen
public import elc_ctxpopup;
public import elc_dayselector;
public import elc_fileselector;
public import elc_fileselector_entry;
public import elc_fileselector_button;
public import elc_hoversel;
public import elc_multibuttonentry;
public import elc_naviframe;
public import elc_popup;
public import elm_actionslider;
public import elm_app;
public import elm_bg;
public import elm_box;

/// Daniel Juyung Seo
public import elm_bubble;
public import elm_button;
public import elm_cache;
// public import elm_calendar;
public import elm_check;
public import elm_clock;
public import elm_cnp;
public import elm_colorselector;
// public import elm_config;
public import elm_conform;
public import elm_cursor;
public import elm_datetime;
// public import elm_debug;
public import elm_diskselector;

/// Chuneon Park
public import elm_finger;
public import elm_flip;
public import elm_flipselector;
public import elm_focus;
// need Eina Hash
// public import elm_font;
public import elm_frame;
public import elm_gen;
// public import elm_gengrid;
// public import elm_genlist;
public import elm_gesture_layer;
// Need Evas_gl
// public import elm_glview;
public import elm_grid;

/// Woohyun Jung
public import elm_hover;
public import elm_image;
public import elm_index;
public import elm_label;
public import elm_layout;
// public import elm_macros;
// public import elm_mapbuf;
// public import elm_map;
public import elm_menu;
public import elm_mirroring;
public import elm_need;
public import elm_notify;
public import elm_object;

/// SanjeevBA
public import elm_panel;
public import elm_panes;
public import elm_photocam;
public import elm_photo;
public import elm_plug;
public import elm_progressbar;
public import elm_radio;
public import elm_route;
public import elm_scale;
public import elm_scroll;
// public import elm_segment_control;

/// Carsten Haitzler
public import elm_separator;
public import elm_slider;
public import elm_slideshow;
public import elm_spinner;
// public import elm_store;
public import elm_table;
public import elm_theme;
public import elm_thumb;
public import elm_toolbar;
// public import elm_transit;
// public import elm_video;
// public import elm_web;
public import elm_win;

/** include deprecated calls last of all */
// public import elm_deprecated;
}   /// End D
