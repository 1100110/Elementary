/**
   @brief Ecore Library Public API Calls

   These routines are used for Ecore Library interaction
 *
/**

   @mainpage Ecore

   @version 1.1
   @date 2000-2012

   Please see the @ref authors page for contact details.

   @section intro Introduction

   Ecore is a library of convenience functions. A brief explanation of how to use
   it can be found in @ref Ecore_Main_Loop_Page.

   The Ecore library provides the following modules:
   @li @ref Ecore_Main_Loop_Group
   @li @ref Ecore_File_Group
   @li @ref Ecore_Con_Group
   @li @ref Ecore_Evas_Group
   @li @ref Ecore_FB_Group
   @li @link Ecore_Ipc.h    Ecore_IPC - Inter Process Communication functions. @endlink
   @li @link Ecore_X.h      Ecore_X - X Windows System wrapper. @endlink
   @li @ref Ecore_Win32_Group
   @li @ref Ecore_WinCE_Group

   For more info on Ecore usage, there are these @ref Examples.

   @section compiling How to compile using Ecore?
   pkgconfig (.pc) files are installed for every ecore module.
   Thus, to compile using any of them, you can use something like the following:

@verbatim
gcc *.c $(pkg-config ecore ecore-$x ecore-$y [...] --cflags --libs)
@endverbatim

   @section install How is it installed?

   Suggested configure options for ecore for a Linux desktop X display
   with OpenGL and Software support, communication (networking) and
   IPC (inter process communication):

@verbatim
./configure \
    --enable-ecore-con \
    --enable-ecore-ipc \
    --enable-ecore-file \
    --enable-ecore-input \
    --enable-ecore-input-evas \
    --enable-ecore-x \
    --enable-ecore-evas \
    --enable-ecore-evas-software-buffer \
    --enable-ecore-evas-software-x11 \
    --enable-ecore-evas-opengl-x11
make
sudo make install
@endverbatim

 *
/**
   @page authors Authors
   @author Carsten Haitzler <raster@rasterman.com>
   @author Tom Gilbert <tom@linuxbrit.co.uk>
   @author Burra <burra@colorado.edu>
   @author Chris Ross <chris@darkrock.co.uk>
   @author Term <term@twistedpath.org>
   @author Tilman Sauerbeck <tilman@code-monkey.de>
   @author Ibukun Olumuyiwa <ibukun@computer.org>
   @author Yuri <da2001@hotmail.ru>
   @author Nicholas Curran <quasar@bigblue.net.au>
   @author Howell Tam <pigeon@pigeond.net>
   @author Nathan Ingersoll <rbdpngn@users.sourceforge.net>
   @author Andrew Elcock <andy@elcock.org>
   @author Kim Woelders <kim@woelders.dk>
   @author Sebastian Dransfeld <sebastid@tango.flipp.net>
   @author Simon Poole <simon.armlinux@themalago.net>
   @author Jorge Luis Zapata Muga <jorgeluis.zapata@gmail.com>
   @author dan sinclair <zero@everburning.com>
   @author Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
   @author David 'onefang' Seikel <onefang@gmail.com>
   @author Hisham 'CodeWarrior' Mardam Bey <hisham@hisham.cc>
   @author Brian 'rephorm' Mattern <rephorm@rephorm.com>
   @author Tim Horton <hortont424@gmail.com>
   @author Arnaud de Turckheim 'quarium' <quarium@gmail.com>
   @author Matt Barclay <mbarclay@gmail.com>
   @author Peter Wehrfritz <peter.wehrfritz@web.de>
   @author Albin "Lutin" Tonnerre <albin.tonnerre@gmail.com>
   @author Vincent Torri <vincent.torri@gmail.com>
   @author Lars Munch <lars@segv.dk>
   @author Andre Dieb <andre.dieb@gmail.com>
   @author Mathieu Taillefumier <mathieu.taillefumier@free.fr>
   @author Rui Miguel Silva Seabra <rms@1407.org>
   @author Samsung Electronics
   @author Samsung SAIT
   @author Nicolas Aguirre <aguirre.nicolas@gmail.com>
   @author Brett Nash <nash@nash.id.au>
   @author Mike Blumenkrantz <michael.blumenkrantz@gmail.com>
   @author Leif Middelschulte <leif.middelschulte@gmail.com>
   @author Mike McCormack <mj.mccormack@samsung.com>
   @author Sangho Park <gouache95@gmail.com>
   @author Jihoon Kim <jihoon48.kim@samsung.com> <imfine98@gmail.com>
   @author PnB <Poor.NewBie@gmail.com>
   @author Daniel Juyung Seo <seojuyung2@gmail.com> <juyung.seo@samsung.com>
   @author Christopher 'devilhorns' Michael <cpmichael1@comcast.net>
   @author ChunEon Park <hermet@hermet.pe.kr>
   @author xlopez@igalia.com
   @author Rafael Antognolli <antognolli@profusion.mobi>
   @author Kim Yunhan <spbear@gmail.com>
   @author Youness Alaoui <kakaroto@kakaroto.homelinux.net>
   @author Bluezery <ohpowel@gmail.com>
   @author Doyoun Kang <wayofmine@gmail.com> <doyoun.kang@samsung.com>
   @author Haifeng Deng <haifeng.deng@samsung.com>

   Please contact <enlightenment-devel@lists.sourceforge.net> to get in
   contact with the developers and maintainers.
 *
/**
 * @page Ecore_Main_Loop_Page The Ecore Main Loop
 *
 * @section intro What is Ecore?
 *
 * Ecore is a clean and tiny event loop library with many modules to do lots of
 * convenient things for a programmer, to save time and effort. It's small and
 * lean, designed to work from embedded systems all the way up to large and
 * powerful multi-cpu workstations. The main loop has a number of primitives to
 * be used with its main loop. It serializes all the primitives and allows for
 * great responsiveness without the need for threads(or any other concurrency).
 *
 * @subsection timers Timers
 *
 * Timers serve two main purposes: doing something at a specified time and
 * repeatedly doing something with a set interval.
 * @see Ecore_Timer_Group
 *
 * @subsection poolers Poolers
 *
 * Poolers allow for pooling to be centralized into a single place therefore
 * alleviating the need for different parts of the program to wake up at
 * different times to do pooling, thereby making the code simpler and more
 * efficient.
 * @see Ecore_Poller_Group
 *
 * @subsection idler Idlers
 *
 * There are three types of idlers, enterers, idlers(proper) and exiters, they
 * are called, respectively, when the program is about to enter an idle state,
 * when the program is idle and when the program is leaving an idle state. Idler
 * enterers are usually a good place to update the program state. Proper idlers
 * are the appropriate place to do heavy computational tasks thereby using what
 * would otherwise be wasted CPU cycles. Exiters are the perfect place to do
 * anything your program should do just before processing events(also timers,
 * poolers, file descriptor handlers and animators)
 * @see Ecore_Idle_Group
 *
 * @subsection fd_handler File descriptor handlers
 *
 * File descriptor handlers allow you to monitor when there is data available to
 * read on file descriptors, when writing will not block or if there was an
 * error. Any valid file descriptor can be used with this API, regardless of if
 * was gotten with an OS specific API or from ecore.
 * @see Ecore_FD_Handler_Group
 *
 * @subsection animators Animators
 *
 * Ecore provides a facility called animators, so named since the intended use
 * was in animations, that facilitates knowing what percentage of a given
 * interval has elapsed. This is perfect for performing animations, but is not
 * limited to that use, it can, for example, also be used to create a progress
 * bar.
 * @see Ecore_Animator_Group
 *
 * @subsection ev_handlers Event handlers
 *
 * Event handlers are, arguably, the most important feature of the ecore main
 * loop, they are what allows the programmer to easily handle user interaction.
 * Events however are not only things the user does, events can represent
 * anything for which a type is created.
 * @see Ecore_Event_Group
 *
 * All of these primitives are discussed in more detail in their respective
 * pages linked above.
 *
 * Here is a diagram of the main loop flow of a simple program:
 *
 * @image html  prog_flow.png
 * @image latex prog_flow.eps width=\textwidth
 *
 *
 *
 * @section work How does Ecore work?
 *
 * Ecore is very easy to learn and use. All the function calls are designed to
 * be easy to remember, explicit in describing what they do, and heavily
 * name-spaced. Ecore programs can start and be very simple.
 *
 * For example:
 *
 * @code
 * #include <Ecore.h>
 *
 * int
 * main(int argc, const char **argv)
 * {
 *    ecore_init();
 *    ecore_app_args_set(argc, argv);
 *    ecore_main_loop_begin();
 *    ecore_shutdown();
 *    return 0;
 * }
 * @endcode
 *
 * This program is very simple and doesn't check for errors, but it does start up
 * and begin a main loop waiting for events or timers to tick off. This program
 * doesn't set up any, but now we can expand on this simple program a little
 * more by adding some event handlers and timers.
 *
 * @code
 * #include <Ecore.h>
 *
 * Ecore_Timer         *timer1     = NULL;
 * Ecore_Event_Handler *handler1   = NULL;
 * double               start_time = 0.0;
 *
 * int
 * timer_func(void *data)
 * {
 *    printf("Tick timer. Sec: %3.2f\n", ecore_time_get() - start_time);
 *    return 1;
 * }
 *
 * int
 * exit_func(void *data, int ev_type, void *ev)
 * {
 *    Ecore_Event_Signal_Exit *e;
 *
 *    e = (Ecore_Event_Signal_Exit *)ev;
 *    if (e->interrupt)      printf("Exit: interrupt\n");
 *    else if (e->quit)      printf("Exit: quit\n");
 *    else if (e->terminate) printf("Exit: terminate\n");
 *    ecore_main_loop_quit();
 *    return 1;
 * }
 *
 * int
 * main(int argc, const char **argv)
 * {
 *    ecore_init();
 *    ecore_app_args_set(argc, argv);
 *    start_time = ecore_time_get();
 *    handler1 = ecore_event_handler_add(ECORE_EVENT_SIGNAL_EXIT, exit_func, NULL);
 *    timer1 = ecore_timer_add(0.5, timer_func, NULL);
 *    ecore_main_loop_begin();
 *    ecore_shutdown();
 *    return 0;
 * }
 * @endcode
 *
 * In the previous example, we initialize our application and get the time at
 * which our program has started so we can calculate an offset. We set
 * up a timer to tick off in 0.5 seconds, and since it returns 1, will
 * keep ticking off every 0.5 seconds until it returns 0, or is deleted
 * by hand. An event handler is set up to call a function -
 * exit_func(),
 * whenever an event of type ECORE_EVENT_SIGNAL_EXIT is received (CTRL-C
 * on the command line will cause such an event to happen). If this event
 * occurs it tells you what kind of exit signal was received, and asks
 * the main loop to quit when it is finished by calling
 * ecore_main_loop_quit().
 *
 * The handles returned by ecore_timer_add() and
 * ecore_event_handler_add() are
 * only stored here as an example. If you don't need to address the timer or
 * event handler again you don't need to store the result, so just call the
 * function, and don't assign the result to any variable.
 *
 * This program looks slightly more complex than needed to do these simple
 * things, but in principle, programs don't get any more complex. You add more
 * event handlers, for more events, will have more timers and such, BUT it all
 * follows the same principles as shown in this example.
 *
 */

/*
   @page Ecore_Config_Page The Enlightened Property Library

   The Enlightened Property Library (Ecore_Config) is an abstraction
   from the complexities of writing your own configuration. It provides
   many features using the Enlightenment 17 development libraries.

   To use the library, you:
   @li Set the default values of your properties.
   @li Load the configuration from a file.  You must set the default values
    first, so that the library knows the correct type of each argument.

   The following examples show how to use the Enlightened Property Library:
   @li @link config_basic_example.c config_basic_example.c @endlink
   @li @link config_listener_example.c config_listener_example.c @endlink

 *
/**
   @page X_Window_System_Page X Window System

   The Ecore library includes a wrapper for handling the X window system.
   This page briefly explains what the X window system is and various terms
   that are used.
 */

version(Windows)    {
import Evil;
}

import Eina;
import std.c.time;
// This has important stuff.
import core.sys.posix.sys.select;

//#ifdef _WIN32
//# ifdef EFL_ECORE_BUILD
//#  ifdef DLL_EXPORT
//#   define EAPI __declspec(dllexport)
//#  else
//#   define EAPI
//#  endif /* ! DLL_EXPORT */
//# else
//#  define EAPI __declspec(dllimport)
//# endif /* ! EFL_ECORE_BUILD */
//#else
//# ifdef __GNUC__
//#  if __GNUC__ >= 4
//#   define EAPI __attribute__ ((visibility("default")))
//#  else
//#   define EAPI
//#  endif
//# else
//#  define EAPI
//# endif
//#endif /* ! _WIN32 */

//#ifdef _WIN32
//# include <winsock2.h>
//#elif (defined (__FreeBSD__) && (__FreeBSD_version >= 420001)) || defined (__OpenBSD__)
//# include <sys/select.h>
//# include <signal.h>
//#else
//# include <sys/time.h>
//# if !defined (EXOTIC_NO_SIGNAL)
//#  include <signal.h>
//# endif
//#endif

//#include <sys/types.h>

extern (C)  {

/**
 * @defgroup Ecore_Init_Group Ecore initialization and shutdown functions.
 *
 * @{
 */

int ecore_init();
int ecore_shutdown();

/**
 * @}
 *
/**
 * @defgroup Ecore_Main_Loop_Group Ecore main loop
 *
 * This group discusses functions that are acting on Ecore's main loop itself or
 * on events and infrastructure directly linked to it. Most programs only need
 * to start and end the main loop, the rest of the function discussed here are
 * meant to be used in special situations, and with great care.
 *
 * For details on the usage of ecore's main loop and how it interacts with other
 * ecore facilities see: @ref Ecore_Main_Loop_Page.
 *
 * @{
 */

immutable ECORE_VERSION_MAJOR = 1;
immutable ECORE_VERSION_MINOR = 2;

struct Ecore_Version
{
   int major;
   int minor;
   int micro;
   int revision;
}

__gshared Ecore_Version *ecore_version;

immutable ECORE_CALLBACK_CANCEL  = EINA_FALSE; /**< Return value to remove a callback */
immutable ECORE_CALLBACK_RENEW   = EINA_TRUE; /**< Return value to keep a callback */

immutable ECORE_CALLBACK_PASS_ON = EINA_TRUE; /**< Return value to pass event to next handler */
immutable ECORE_CALLBACK_DONE    = EINA_FALSE; /**< Return value to stop event handling */

/**
 * @typedef Ecore_Task_Cb Ecore_Task_Cb
 * A callback run for a task (timer, idler, poller, animator, etc)
 */
alias Eina_Bool function(void* data) *Ecore_Task_Cb;

/**
 * @typedef Ecore_Select_Function
 * A function which can be used to replace select() in the main loop
 */
//TODO this is not defined anywhere...
union sigval_t
{
    int sival_int;
    void *sival_ptr;
}

alias int function(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, timeval *timeout) *Ecore_Select_Function;

void ecore_main_loop_iterate();

void ecore_main_loop_select_func_set(Ecore_Select_Function func);
Ecore_Select_Function ecore_main_loop_select_func_get();

Eina_Bool ecore_main_loop_glib_integrate();
void ecore_main_loop_glib_always_integrate_disable();

void ecore_main_loop_begin();
void ecore_main_loop_quit();

/**
 * @typedef Ecore_Cb Ecore_Cb
 * A generic callback called as a hook when a certain point in
 * execution is reached.
 */
alias void function(void* data) *Ecore_Cb;

/**
 * @typedef Ecore_Data_Cb Ecore_Data_Cb
 * A callback which is used to return data to the main function
 */
alias void* function(void* data) *Ecore_Data_Cb;

/**
 * @brief Call callback asynchronously in the main loop.
 * @since 1.1.0
 *
 * @param callback The callback to call in the main loop
 * @param data The data to give to that call back
 *
 * For all calls that need to happen in the main loop (most EFL functions do),
 * this helper function provides the infrastructure needed to do it safely
 * by avoiding dead lock, race condition and properly wake up the main loop.
 *
 * Remember after that function call, you should never touch again the @p data
 * in the thread, it is owned by the main loop and your callback should take
 * care of freeing it if necessary.
 */
void ecore_main_loop_thread_safe_call_async(Ecore_Cb callback, void *data);

/**
 * @brief Call callback synchronously in the main loop.
 * @since 1.1.0
 *
 * @param callback The callback to call in the main loop
 * @param data The data to give to that call back
 * @return the value returned by the callback in the main loop
 *
 * For all calls that need to happen in the main loop (most EFL functions do),
 * this helper function provides the infrastructure needed to do it safely
 * by avoiding dead lock, race condition and properly wake up the main loop.
 *
 * Remember this function will block until the callback is executed in the
 * main loop. It can take time and you have no guaranty about the timeline.
 */
void *ecore_main_loop_thread_safe_call_sync(Ecore_Data_Cb callback, void *data);

/**
 * @brief This function suspend the main loop in a know state
 * @since 1.1.0
 *
 * @result the number of time ecore_thread_main_loop_begin() has been called
 * in this thread, if the main loop was suspended correctly. If not, it return @c -1.
 *
 * This function suspend the main loop in a know state, this let you
 * use any EFL call you want after it return. Be carefully, the main loop
 * is blocked until you call ecore_thread_main_loop_end(). This is
 * the only sane way to achieve pseudo thread safety.
 *
 * Notice that until the main loop is blocked, the thread is blocked
 * and their is noway around that.
 *
 * We still advise you, when possible, to use ecore_main_loop_thread_safe_call_async()
 * as it will not block the thread nor the main loop.
 */
int ecore_thread_main_loop_begin();

/**
 * @brief Unlock the main loop.
 * @since 1.1.0
 *
 * @result the number of time ecore_thread_main_loop_end() need to be called before
 * the main loop is unlocked again. @c -1 will be returned if you are trying to unlock
 * when there wasn't enough call to ecore_thread_main_loop_begin().
 *
 * After a call to ecore_thread_main_loop_begin(), you need to absolutely
 * call ecore_thread_main_loop_end(), or you application will stay frozen.
 */
int ecore_thread_main_loop_end();

/**
 * @}
 */

/**
 * @defgroup Ecore_Event_Group Ecore Event functions
 *
 * Ecore events provide two main features that are of use to those using ecore:
 * creating events and being notified of events. Those two will usually be used
 * in different contexts, creating events is mainly done by libraries wrapping
 * some system functionality while being notified of events is mainly a
 * necessity of applications.
 *
 * For a program to be notified of events it's interested in it needs to have a
 * function to process the event and to register that function as the callback
 * to the event, that's all:
 * @code
 * ecore_event_handler_add(EVENT_TYPE, _my_event_handler, some_data);
 * ...
 * static Eina_Bool
 * _my_event_handler(void *data, int type, void *event)
 * {
 *    //data is some_data
 *    //event is provided by whoever created the event
 *    //Do really cool stuff with event
 * }
 * @endcode
 *
 * One very important thing to note here is the @c EVENT_TYPE, to register a
 * handler for an event you must know its type before hand. Ecore provides
 * the following events which are emitted in response to POSIX
 * signals(https://en.wikipedia.org/wiki/Signal_%28computing%29):
 * @li @b ECORE_EVENT_SIGNAL_USER
 * @li @b ECORE_EVENT_SIGNAL_HUP
 * @li @b ECORE_EVENT_SIGNAL_POWER
 * @li @b ECORE_EVENT_SIGNAL_EXIT
 *
 * @warning Don't override these using the @c signal or @c sigaction calls.
 * These, however, aren't the only signals one can handle. Many
 * libraries(including ecore modules) have their own signals that can be
 * listened for and handled, to do that one only needs to know the type of the
 * event. This information can be found on the documentation of the library
 * emitting the signal, so, for example, for events related to windowing one
 * would look in @ref Ecore_Evas_Group.
 *
 * Examples of libraries that integrate into ecore's main loop by providing
 * events are @ref Ecore_Con_Group, @ref Ecore_Evas_Group and @ref
 * Ecore_Exe_Group, amongst others. This usage can be divided into two parts,
 * setup and adding events. The setup is very simple, all that needs doing is
 * getting a type id for the event:
 * @code
 * int MY_EV_TYPE = ecore_event_type_new();
 * @endcode
 * @note This variable should be declared in the header since it'll be needed by
 * anyone wishing to register a handler to your event.
 *
 * The complexity of adding of an event to the queue depends on whether that
 * event sends uses @c event, if it doesn't it a one-liner:
 * @code
 * ecore_event_add(MY_EV_TYPE, NULL, NULL, NULL);
 * @endcode
 * The usage when an @c event is needed is not that much more complex and can be
 * seen in @ref ecore_event_add.
 *
 * Examples that deals with events:
 * @li @ref ecore_event_example_01_c
 * @li @ref ecore_event_example_02_c
 *
 * @ingroup Ecore_Main_Loop_Group
 *
 * @{
 */

immutable ECORE_EVENT_NONE            = 0;
immutable ECORE_EVENT_SIGNAL_USER     = 1; /**< User signal event */
immutable ECORE_EVENT_SIGNAL_HUP      = 2; /**< Hup signal event */
immutable ECORE_EVENT_SIGNAL_EXIT     = 3; /**< Exit signal event */
immutable ECORE_EVENT_SIGNAL_POWER    = 4; /**< Power signal event */
immutable ECORE_EVENT_SIGNAL_REALTIME = 5; /**< Realtime signal event */
immutable ECORE_EVENT_COUNT           = 6;

struct Ecore_Win32_Handler;    /**< A handle for HANDLE handlers on Windows */
struct Ecore_Event_Handler;    /**< A handle for an event handler */
struct Ecore_Event_Filter;    /**< A handle for an event filter */
struct Ecore_Event;    /**< A handle for an event */
/**< User signal event */
/**< Hup signal event */
/**< Exit signal event */
/**< Power signal event */
/**< Realtime signal event */

/**
 * @typedef Ecore_Filter_Cb
 * A callback used for filtering events from the main loop.
 */
alias Eina_Bool function(void *data, void *loop_data, int type, void *event) *Ecore_Filter_Cb;

/**
 * @typedef Ecore_End_Cb Ecore_End_Cb
 * This is the callback which is called at the end of a function,
 * usually for cleanup purposes.
 */
alias void function(void *user_data, void *func_data) *Ecore_End_Cb;

/**
 * @typedef Ecore_Event_Handler_Cb Ecore_Event_Handler_Cb
 * A callback used by the main loop to handle events of a specified
 * type.
 */
alias Eina_Bool function(void *data, int type, void *event) *Ecore_Event_Handler_Cb;

//TODO Google saved me here.
//Why was this not defined?
struct siginfo_t    {
    int si_signo;
    int si_errno;
    int si_code;
    int si_trapno;
    pid_t si_pid;
    uid_t si_uid;
    int si_status;
    clock_t si_utime;
    clock_t si_stime;
    sigval_t si_value;
    int si_int;
    void * si_ptr;
    int si_overrun;
    int si_timerid;
    void * si_addr;
    int si_band;
    int si_fd;
}


struct Ecore_Event_Signal_User    /** User signal event */
{
   int       number;  /**< The signal number. Either 1 or 2 */
   void     *ext_data;  /**< Extension data - not used */

//TODO
//#if !defined (_WIN32) && !defined (__lv2ppu__) && !defined (EXOTIC_NO_SIGNAL)
   siginfo_t data; /**< Signal info */
//#endif
}

struct Ecore_Event_Signal_Hup    /** Hup signal event */
{
   void     *ext_data;  /**< Extension data - not used */

//TODO
//#if !defined (_WIN32) && !defined (__lv2ppu__) && !defined (EXOTIC_NO_SIGNAL)
   siginfo_t data; /**< Signal info */
//#endif
}

struct Ecore_Event_Signal_Exit    /** Exit request event */
{
    //TODO bitfields
   Eina_Bool interrupt;// : 1; /**< Set if the exit request was an interrupt  signal*/
   Eina_Bool quit;//      : 1; /**< set if the exit request was a quit signal */
   Eina_Bool terminate;// : 1; /**< Set if the exit request was a terminate signal */
   void     *ext_data; /**< Extension data - not used */

//#if !defined (_WIN32) && !defined (__lv2ppu__) && !defined (EXOTIC_NO_SIGNAL)
   siginfo_t data; /**< Signal info */
//#endif
}

struct Ecore_Event_Signal_Power    /** Power event */
{
   void     *ext_data;  /**< Extension data - not used */

//#if !defined (_WIN32) && !defined (__lv2ppu__) && !defined (EXOTIC_NO_SIGNAL)
   siginfo_t data; /**< Signal info */
//#endif
}

struct Ecore_Event_Signal_Realtime    /** Realtime event */
{
   int       num; /**< The realtime signal's number */

//#if !defined (_WIN32) && !defined (__lv2ppu__) && !defined (EXOTIC_NO_SIGNAL)
   siginfo_t data; /**< Signal info */
//#endif
}

/**
 * @brief Add an event handler.
 * @param type The type of the event this handler will get called for
 * @param func The function to call when the event is found in the queue
 * @param data A data pointer to pass to the called function @p func
 * @return A new Event handler, or @c NULL on failure.
 *
 * Add an event handler to the list of handlers. This will, on success, return
 * a handle to the event handler object that was created, that can be used
 * later to remove the handler using ecore_event_handler_del(). The @p type
 * parameter is the integer of the event type that will trigger this callback
 * to be called. The callback @p func is called when this event is processed
 * and will be passed the event type, a pointer to the private event
 * structure that is specific to that event type, and a data pointer that is
 * provided in this call as the @p data parameter.
 *
 * When the callback @p func is called, it must return 1 or 0. If it returns
 * 1 (or ECORE_CALLBACK_PASS_ON), It will keep being called as per normal, for
 * each handler set up for that event type. If it returns 0 (or
 * ECORE_CALLBACK_DONE), it will cease processing handlers for that particular
 * event, so all handler set to handle that event type that have not already
 * been called, will not be.
 */
Ecore_Event_Handler *ecore_event_handler_add(int type, Ecore_Event_Handler_Cb func, const void *data);

/**
 * @brief Delete an event handler.
 * @param event_handler Event handler handle to delete
 * @return Data passed to handler
 *
 * Delete a specified event handler from the handler list. On success this will
 * delete the event handler and return the pointer passed as @p data when the
 * handler was added by ecore_event_handler_add(). On failure @c NULL will be
 * returned. Once a handler is deleted it will no longer be called.
 */
void *ecore_event_handler_del(Ecore_Event_Handler *event_handler);

/**
 * @brief Add an event to the event queue.
 * @param type The event type to add to the end of the event queue
 * @param ev The data structure passed as @c event to event handlers
 * @param func_free The function to be called to free @a ev
 * @param data The data pointer to be passed to the free function
 * @return A Handle for that event on success, otherwise NULL
 *
 * If it succeeds, an event of type @a type will be added to the queue for
 * processing by event handlers added by ecore_event_handler_add(). The @a ev
 * parameter will be passed as the @c event parameter of the handler. When the
 * event is no longer needed, @a func_free will be called and passed @a ev for
 * cleaning up. If @p func_free is NULL, free() will be called with the private
 * structure pointer.
 */
Ecore_Event *ecore_event_add(int type, void *ev, Ecore_End_Cb func_free, void *data);

/**
 * @brief Delete an event from the queue.
 * @param event The event handle to delete
 * @return The data pointer originally set for the event free function
 *
 * This deletes the event @p event from the event queue, and returns the
 * @p data parameter originally set when adding it with ecore_event_add(). This
 * does not immediately call the free function, and it may be called later on
 * cleanup, and so if the free function depends on the data pointer to work,
 * you should defer cleaning of this till the free function is called later.
 */
void *ecore_event_del(Ecore_Event *event);

/**
 * @brief Get the data associated with an #Ecore_Event_Handler
 * @param eh The event handler
 * @return The data
 *
 * This function returns the data previously associated with @p eh by
 * ecore_event_handler_add().
 */
void *ecore_event_handler_data_get(Ecore_Event_Handler *eh);

/**
 * @brief Set the data associated with an #Ecore_Event_Handler
 * @param eh The event handler
 * @param data The data to associate
 * @return The previous data
 *
 * This function sets @p data to @p eh and returns the old data pointer
 * which was previously associated with @p eh by ecore_event_handler_add().
 */
void *ecore_event_handler_data_set(Ecore_Event_Handler *eh, const void *data);

/**
 * @brief Allocate a new event type id sensibly and return the new id.
 * @return A new event type id.
 *
 * This function allocates a new event type id and returns it. Once an event
 * type has been allocated it can never be de-allocated during the life of
 * the program. There is no guarantee of the contents of this event ID, or how
 * it is calculated, except that the ID will be unique to the current instance
 * of the process.
 */
int ecore_event_type_new();

/**
 * @brief Add a filter the current event queue.
 *
 * @param func_start Function to call just before filtering and return data
 * @param func_filter Function to call on each event
 * @param func_end Function to call after the queue has been filtered
 * @param data Data to pass to the filter functions
 * @return A filter handle on success, @c NULL otherwise.
 *
 * Adds a callback to filter events from the event queue. Filters are called on
 * the queue just before Event handler processing to try and remove redundant
 * events. Just as processing is about to start @a func_start is called and
 * passed the @a data pointer, the return value of this functions is passed to
 * @a func_filter as loop_data. @a func_filter is also passed @a data and the
 * event type and event structure. If this @a func_filter returns
 * @c EINA_FALSE, the event is removed from the queue, if it returns
 * @c EINA_TRUE, the event is kept. When processing is finished @p func_end is
 * called and is passed the loop_data(returned by @c func_start) and @p data
 * pointer to clean up.
 */
Ecore_Event_Filter *ecore_event_filter_add(Ecore_Data_Cb func_start, Ecore_Filter_Cb func_filter, Ecore_End_Cb func_end, const void *data);

/**
 * @brief Delete an event filter.
 * @param ef The event filter handle
 * @return The data set for the filter on success, @c NULL otherwise.
 *
 * Delete a filter that has been added by its @p ef handle.
 */
void *ecore_event_filter_del(Ecore_Event_Filter *ef);

/**
 * @brief Return the current event type being handled.
 * @return The current event type being handled if inside a handler callback,
 * ECORE_EVENT_NONE otherwise
 *
 * If the program is currently inside an Ecore event handler callback this
 * will return the type of the current event being processed.
 *
 * This is useful when certain Ecore modules such as Ecore_Evas "swallow"
 * events and not all the original information is passed on. In special cases
 * this extra information may be useful or needed and using this call can let
 * the program know if the event type being handled is one it wants to get more
 * information about.
 */
int ecore_event_current_type_get();

/**
 * @brief Return the current event type pointer handled.
 * @return The current event pointer being handled if inside a handler callback,
 * @c NULL otherwise.
 *
 * If the program is currently inside an Ecore event handler callback this
 * will return the pointer of the current event being processed.
 *
 * This is useful when certain Ecore modules such as Ecore_Evas "swallow"
 * events and not all the original information is passed on. In special cases
 * this extra information may be useful or needed and using this call can let
 * the program access the event data if the type of the event is handled by
 * the program.
 */
void *ecore_event_current_event_get();

/**
 * @}
 */

/**
 * @defgroup Ecore_Exe_Group Process Spawning Functions
 *
 * Functions that deal with and send signals to spawned processes.
 *
 * @ingroup Ecore_Main_Loop_Group
 *
 * @{
 */

/** Inherit priority from parent process */
immutable ECORE_EXE_PRIORITY_INHERIT = 9999;

extern int ECORE_EXE_EVENT_ADD;     /**< A child process has been added */
extern int ECORE_EXE_EVENT_DEL;     /**< A child process has been deleted (it exited, naming consistent with the rest of ecore). */
extern int ECORE_EXE_EVENT_DATA;    /**< Data from a child process. */
extern int ECORE_EXE_EVENT_ERROR;    /**< Errors from a child process. */

/**
 * @enum _Ecore_Exe_Flags
 * Flags for executing a child with its stdin and/or stdout piped back.
 */
enum Ecore_Exe_Flags    /* flags for executing a child with its stdin and/or stdout piped back */
{
   ECORE_EXE_NONE = 0, /**< No exe flags at all */
   ECORE_EXE_PIPE_READ = 1, /**< Exe Pipe Read mask */
   ECORE_EXE_PIPE_WRITE = 2, /**< Exe Pipe Write mask */
   ECORE_EXE_PIPE_ERROR = 4, /**< Exe Pipe error mask */
   ECORE_EXE_PIPE_READ_LINE_BUFFERED = 8, /**< Reads are buffered until a newline and split 1 line per Ecore_Exe_Event_Data_Line */
   ECORE_EXE_PIPE_ERROR_LINE_BUFFERED = 16, /**< Errors are buffered until a newline and split 1 line per Ecore_Exe_Event_Data_Line */
   ECORE_EXE_PIPE_AUTO = 32, /**< stdout and stderr are buffered automatically */
   ECORE_EXE_RESPAWN = 64, /**< FIXME: Exe is restarted if it dies */
   ECORE_EXE_USE_SH = 128, /**< Use /bin/sh to run the command. */
   ECORE_EXE_NOT_LEADER = 256, /**< Do not use setsid() to have the executed process be its own session leader */
   ECORE_EXE_TERM_WITH_PARENT = 512 /**< Makes child receive SIGTERM when parent dies. */
}

/**
 * @enum _Ecore_Exe_Win32_Priority
 * Defines the priority of the proccess.
 */
enum Ecore_Exe_Win32_Priority
{
   ECORE_EXE_WIN32_PRIORITY_IDLE, /**< Idle priority, for monitoring the system */
   ECORE_EXE_WIN32_PRIORITY_BELOW_NORMAL, /**< Below default priority */
   ECORE_EXE_WIN32_PRIORITY_NORMAL, /**< Default priority */
   ECORE_EXE_WIN32_PRIORITY_ABOVE_NORMAL, /**< Above default priority */
   ECORE_EXE_WIN32_PRIORITY_HIGH, /**< High priority, use with care as other threads in the system will not get processor time */
   ECORE_EXE_WIN32_PRIORITY_REALTIME     /**< Realtime priority, should be almost never used as it can interrupt system threads that manage mouse input, keyboard input, and background disk flushing */
}

struct Ecore_Exe; /**< A handle for spawned processes */

/**
 * @typedef Ecore_Exe_Cb Ecore_Exe_Cb
 * A callback to run with the associated @ref Ecore_Exe, usually
 * for cleanup purposes.
 */
alias void function(void* data, const Ecore_Exe* exe) *Ecore_Exe_Cb;

/**< Spawned Exe add event */
/**< Spawned Exe exit event */
/**< Lines from a child process */
/**< Data from a child process */

struct Ecore_Exe_Event_Add    /** Process add event */
{
   Ecore_Exe *exe; /**< The handle to the added process */
   void      *ext_data; /**< Extension data - not used */
}

struct Ecore_Exe_Event_Del    /** Process exit event */
{
   pid_t      pid; /**< The process ID of the process that exited */
   int        exit_code; /**< The exit code of the process */
   Ecore_Exe *exe; /**< The handle to the exited process, or @c NULL if not found */
   int        exit_signal; /** < The signal that caused the process to exit */
   Eina_Bool  exited;//    : 1; /** < set to 1 if the process exited of its own accord */
   Eina_Bool  signalled;// : 1; /** < set to 1 id the process exited due to uncaught signal */
   void      *ext_data; /**< Extension data - not used */
//#if !defined (_WIN32) && !defined (__lv2ppu__) && !defined (EXOTIC_NO_SIGNAL)
   siginfo_t  data; /**< Signal info */
//#endif
}

struct Ecore_Exe_Event_Data_Line    /**< Lines from a child process */
{
   char *line;
   int   size;
}

struct Ecore_Exe_Event_Data    /** Data from a child process event */
{
   Ecore_Exe                 *exe; /**< The handle to the process */
   void                      *data; /**< the raw binary data from the child process that was received */
   int                        size; /**< the size of this data in bytes */
   Ecore_Exe_Event_Data_Line *lines; /**< an array of line data if line buffered, the last one has it's line member set to @c NULL */
}

void ecore_exe_run_priority_set(int pri);
int ecore_exe_run_priority_get();
Ecore_Exe *ecore_exe_run(const char *exe_cmd, const void *data);
Ecore_Exe *ecore_exe_pipe_run(const char *exe_cmd, Ecore_Exe_Flags flags, const void *data);
void ecore_exe_callback_pre_free_set(Ecore_Exe *exe, Ecore_Exe_Cb func);
Eina_Bool ecore_exe_send(Ecore_Exe *exe, const void *data, int size);
void ecore_exe_close_stdin(Ecore_Exe *exe);
void ecore_exe_auto_limits_set(Ecore_Exe *exe, int start_bytes, int end_bytes, int start_lines, int end_lines);
Ecore_Exe_Event_Data *ecore_exe_event_data_get(Ecore_Exe *exe, Ecore_Exe_Flags flags);
void ecore_exe_event_data_free(Ecore_Exe_Event_Data *data);
void *ecore_exe_free(Ecore_Exe *exe);
pid_t ecore_exe_pid_get(const Ecore_Exe *exe);
void ecore_exe_tag_set(Ecore_Exe *exe, const char *tag);
char *ecore_exe_tag_get(const Ecore_Exe *exe);
char *ecore_exe_cmd_get(const Ecore_Exe *exe);
void *ecore_exe_data_get(const Ecore_Exe *exe);
void *ecore_exe_data_set(Ecore_Exe *exe, void *data);
Ecore_Exe_Flags ecore_exe_flags_get(const Ecore_Exe *exe);
void ecore_exe_pause(Ecore_Exe *exe);
void ecore_exe_continue(Ecore_Exe *exe);
void ecore_exe_interrupt(Ecore_Exe *exe);
void ecore_exe_quit(Ecore_Exe *exe);
void ecore_exe_terminate(Ecore_Exe *exe);
void ecore_exe_kill(Ecore_Exe *exe);
void ecore_exe_signal(Ecore_Exe *exe, int num);
void ecore_exe_hup(Ecore_Exe *exe);

/**
 * @}
 *
/**
 * @defgroup Ecore_FD_Handler_Group File Descriptor Handling Functions
 *
 * @brief Functions that deal with file descriptor handlers.
 *
 * File descriptor handlers facilitate reading, writing and checking for errors
 * without blocking the program or doing expensive pooling. This can be used to
 * monitor a socket, pipe, or other stream for which an FD can be had.
 *
 * @warning File descriptor handlers can't be used to monitor for file creation,
 * modification or deletion, see @ref Ecore_File_Group for this.
 *
 * One common FD to be monitored is the standard input(stdin), monitoring it for
 * reading requires a single call:
 * @code
 * static Eina_Bool
 * _my_cb_func(void *data, Ecore_Fd_Handler *handler)
 * {
 *    char c;
 *    scanf("%c", &c); //Guaranteed not to block
 *    ... do stuff with c ...
 * }
 * ecore_main_fd_handler_add(STDIN_FILENO, ECORE_FD_READ, _my_cb_func, NULL, NULL, NULL);
 * @endcode
 *
 * When using a socket, pipe or other stream it's important to remember that
 * errors may occur and as such to monitor not only for reading/writing but also
 * for errors using the @ref ECORE_FD_ERROR flag.
 *
 * Example of use of a file descriptor handler:
 * @li @ref ecore_fd_handler_example_c
 *
 * @ingroup Ecore_Main_Loop_Group
 *
 * @{
 */

struct Ecore_Fd_Handler;  /**< A handle for Fd handlers */

/**
 * @enum _Ecore_Fd_Handler_Flags
 * What to monitor the file descriptor for: reading, writing or error.
 */
enum Ecore_Fd_Handler_Flags
{
   ECORE_FD_READ = 1, /**< Fd Read mask */
   ECORE_FD_WRITE = 2, /**< Fd Write mask */
   ECORE_FD_ERROR = 4 /**< Fd Error mask */
}

/**
 * @typedef Ecore_Fd_Cb Ecore_Fd_Cb
 * A callback used by an @ref Ecore_Fd_Handler.
 */
alias Eina_Bool function(void *data, Ecore_Fd_Handler *fd_handler) *Ecore_Fd_Cb;

/**
 * @typedef Ecore_Fd_Prep_Cb Ecore_Fd_Prep_Cb
 * A callback used by an @ref Ecore_Fd_Handler.
 */
alias void function(void *data, Ecore_Fd_Handler *fd_handler) *Ecore_Fd_Prep_Cb;

/**
 * @typedef Ecore_Win32_Handle_Cb Ecore_Win32_Handle_Cb
 * A callback used by an @ref Ecore_Win32_Handler.
 */
alias Eina_Bool function(void *data, Ecore_Win32_Handler *wh) *Ecore_Win32_Handle_Cb;

/**
 * @brief Adds a callback for activity on the given file descriptor.
 *
 * @param fd The file descriptor to watch.
 * @param flags To monitor it for reading use @c ECORE_FD_READ, for writing @c
 * ECORE_FD_WRITE, and for error @c ECORE_FD_ERROR. Values bay |(ored).
 * @param func The callback function.
 * @param data The data to pass to the callback.
 * @param buf_func The function to call to check if any data has been buffered
 * and already read from the fd. May be @c NULL.
 * @param buf_data The data to pass to the @p buf_func function.
 * @return A fd handler handle on success, @c NULL otherwise.
 *
 * @a func will be called during the execution of @ref Ecore_Main_Loop_Page
 * when the file descriptor is available for reading, writing, or there has been
 * an error(depending on the given @a flags).
 *
 * When @a func returns ECORE_CALLBACK_CANCEL, it indicates that the
 * handler should be marked for deletion (identical to calling @ref
 * ecore_main_fd_handler_del).
 *
 * @warning @a buf_func is meant for @b internal use only and should be @b
 * avoided.
 *
 * The return value of @a buf_func has a different meaning, when it returns
 * ECORE_CALLBACK_CANCEL, it indicates that @a func @b shouldn't be called, and
 * when it returns ECORE_CALLBACK_RENEW it indicates @a func should be called.
 * The return value of @a buf_func will not cause the FD handler to be deleted.
 *
 * @a buf_func is called during event loop handling to check if data that has
 * been read from the file descriptor is in a buffer and is available to read.
 * Some systems, notably xlib, handle their own buffering, and would otherwise
 * not work with select(). These systems should use a @a buf_func. This is a
 * most annoying hack, only ecore_x uses it, so refer to that for an example.
 */
Ecore_Fd_Handler *ecore_main_fd_handler_add(int fd, Ecore_Fd_Handler_Flags flags, Ecore_Fd_Cb func, const void *data, Ecore_Fd_Cb buf_func, const void *buf_data);

/**
 * @brief Set the prepare callback with data for a given #Ecore_Fd_Handler
 *
 * @param fd_handler The fd handler
 * @param func The prep function
 * @param data The data to pass to the prep function
 *
 * This function will be called prior to any fd handler's callback function
 * (even the other fd handlers), before entering the main loop select function.
 *
 * @note Once a prepare callback is set for a fd handler, it cannot be changed.
 * You need to delete the fd handler and create a new one, to set another
 * callback.
 * @note You probably don't need this function. It is only necessary for very
 * uncommon cases that need special behavior.
 */
void ecore_main_fd_handler_prepare_callback_set(Ecore_Fd_Handler *fd_handler, Ecore_Fd_Prep_Cb func, const void *data);

/**
 * @brief Marks an FD handler for deletion.
 * @param fd_handler The FD handler.
 * @return The data pointer set using @ref ecore_main_fd_handler_add, for
 * @a fd_handler on success, @c NULL otherwise.
 * This function marks an fd handler to be deleted during an iteration of the
 * main loop. It does NOT close the associated fd!
 *
 * @warning If the underlying fd is already closed ecore may complain if the
 * main loop is using epoll internally, and also in some rare cases this may
 * cause crashes and instability. Remember to delete your fd handlers before the
 * fds they listen to are closed.
 */
void *ecore_main_fd_handler_del(Ecore_Fd_Handler *fd_handler);

/**
 * @brief Retrieves the file descriptor that the given handler is handling.
 * @param fd_handler The given FD handler.
 * @return The file descriptor the handler is watching.
 */
int ecore_main_fd_handler_fd_get(Ecore_Fd_Handler *fd_handler);

/**
 * @brief Gets which flags are active on an FD handler.
 * @param fd_handler The given FD handler.
 * @param flags The flags, @c ECORE_FD_READ, @c ECORE_FD_WRITE or
 * @c ECORE_FD_ERROR to query.
 * @return @c EINA_TRUE if any of the given flags are active, @c EINA_FALSE
 * otherwise.
 */
Eina_Bool ecore_main_fd_handler_active_get(Ecore_Fd_Handler *fd_handler, Ecore_Fd_Handler_Flags flags);

/**
 * @brief Set what active streams the given FD handler should be monitoring.
 * @param fd_handler The given FD handler.
 * @param flags The flags to be watching.
 */
void ecore_main_fd_handler_active_set(Ecore_Fd_Handler *fd_handler, Ecore_Fd_Handler_Flags flags);

Ecore_Win32_Handler *ecore_main_win32_handler_add(void *h, Ecore_Win32_Handle_Cb func, const void *data);
void *ecore_main_win32_handler_del(Ecore_Win32_Handler *win32_handler);

/**
 * @}
 *
/**
 * @defgroup Ecore_Poller_Group Ecore Poll functions
 *
 * Ecore poller provides infrastructure for the creation of pollers. Pollers
 * are, in essence, callbacks that share a single timer per type. Because not
 * all pollers need to be called at the same frequency the user may specify the
 * frequency in ticks(each expiration of the shared timer is called a tick, in
 * ecore poller parlance) for each added poller. Ecore pollers should only be
 * used when the poller doesn't have specific requirements on the exact times
 * to poll.
 *
 * This architecture means that the main loop is only woken up once to handle
 * all pollers of that type, this will save power as the CPU has more of a
 * chance to go into a low power state the longer it is asleep for, so this
 * should be used in situations where power usage is a concern.
 *
 * For now only 1 core poller type is supported: ECORE_POLLER_CORE, the default
 * interval for ECORE_POLLER_CORE is 0.125(or 1/8th) second.
 *
 * The creation of a poller is extremely simple and only requires one line:
 * @code
 * ecore_poller_add(ECORE_POLLER_CORE, 1, my_poller_function, NULL);
 * @endcode
 * This sample creates a poller to call @c my_poller_function at every tick with
 * @c NULL as data.
 *
 * Example:
 * @li @ref ecore_poller_example_c
 *
 * @ingroup Ecore_Main_Loop_Group
 *
 * @{
 *
/**
 * @enum _Ecore_Poller_Type
 * Defines the frequency of ticks for the poller.
 */
enum Ecore_Poller_Type    /* Poller types */
{
   ECORE_POLLER_CORE = 0 /**< The core poller interval */
}

struct Ecore_Poller; /**< A handle for pollers */

/**
 * @brief Sets the time(in seconds) between ticks for the given poller type.
 * @param type The poller type to adjust.
 * @param poll_time The time(in seconds) between ticks of the timer.
 *
 * This will adjust the time between ticks of the given timer type defined by
 * @p type to the time period defined by @p poll_time.
 */
void ecore_poller_poll_interval_set(Ecore_Poller_Type type, double poll_time);

/**
 * @brief Gets the time(in seconds) between ticks for the given poller type.
 * @param type The poller type to query.
 * @return The time in seconds between ticks of the poller timer.
 *
 * This will get the time between ticks of the specified poller timer.
 */
double ecore_poller_poll_interval_get(Ecore_Poller_Type type);

/**
 * @brief Changes the polling interval rate of @p poller.
 * @param poller The Ecore_Poller to change the interval of.
 * @param interval The tick interval to set; must be a power of 2 and <= 32768.
 * @return Returns true on success, false on failure.
 *
 * This allows the changing of a poller's polling interval. It is useful when
 * you want to alter a poll rate without deleting and re-creating a poller.
 */
Eina_Bool ecore_poller_poller_interval_set(Ecore_Poller *poller, int interval);

/**
 * @brief Gets the polling interval rate of @p poller.
 * @param poller The Ecore_Poller to change the interval of.
 * @return Returns the interval, in ticks, that @p poller polls at.
 *
 * This returns a poller's polling interval, or 0 on error.
 */
int ecore_poller_poller_interval_get(Ecore_Poller *poller);

/**
 * @brief Creates a poller to call the given function at a particular tick interval.
 * @param type The ticker type to attach the poller to. Must be ECORE_POLLER_CORE.
 * @param interval The poll interval.
 * @param func The poller function.
 * @param data Data to pass to @a func when it is called.
 * @return A poller object on success, @c NULL otherwise.
 *
 * This function adds @a func as a poller callback that will be called every @a
 * interval ticks together with other pollers of type @a type. @a func will be
 * passed the @p data pointer as a parameter.
 *
 * The @p interval must be between 1 and 32768 inclusive, and must be a power of
 * 2 (i.e. 1, 2, 4, 8, 16, ... 16384, 32768). The exact tick in which @a func
 * will be called is undefined, as only the interval between calls can be
 * defined. Ecore will endeavor to keep pollers synchronized and to call as
 * many in 1 wakeup event as possible. If @a interval is not a power of two, the
 * closest power of 2 greater than @a interval will be used.
 *
 * When the poller @p func is called, it must return a value of either
 * ECORE_CALLBACK_RENEW(or 1) or ECORE_CALLBACK_CANCEL(or 0). If it
 * returns 1, it will be called again at the next tick, or if it returns
 * 0 it will be deleted automatically making any references/handles for it
 * invalid.
 */
Ecore_Poller *ecore_poller_add(Ecore_Poller_Type type, int interval, Ecore_Task_Cb func, const void *data);

/**
 * @brief Delete the specified poller from the timer list.
 * @param poller The poller to delete.
 * @return The data pointer set for the timer when @ref ecore_poller_add was
 * called on success, @c NULL otherwise.
 *
 * @note @a poller must be a valid handle. If the poller function has already
 * returned 0, the handle is no longer valid (and does not need to be deleted).
 */
void *ecore_poller_del(Ecore_Poller *poller);

/**
 * @}
 *
/**
 * @defgroup Ecore_Animator_Group Ecore Animator functions
 *
 * @brief Ecore animators are a helper to simplify creating
 * animations.
 *
 * Creating an animation is as simple as saying for how long it
 * should be run and having a callback that does the animation,
 * something like this:
 * @code
 * static Eina_Bool
 * _do_animation(void *data, double pos)
 * {
 *    evas_object_move(data, 100 * pos, 100 * pos);
 *    ... do some more animating ...
 * }
 * ...
 *ecore_animator_timeline_add(2, _do_animation, my_evas_object);
 * @endcode
 * In the sample above we create an animation to move
 * @c my_evas_object from position (0,0) to (100,100) in 2 seconds.
 *
 * If your animation will run for an unspecified amount of time you
 * can use ecore_animator_add(), which is like using
 *ecore_timer_add() with the interval being the
 * @ref ecore_animator_frametime_set "framerate". Note that this has
 * tangible benefits to creating a timer for each animation in terms
 * of performance.
 *
 * For a more detailed example that show several animation see
 * @ref tutorial_ecore_animator.
 *
 * @ingroup Ecore_Main_Loop_Group
 *
 * @{
 */

struct Ecore_Animator; /**< A handle for animators */

/**
 * @enum _Ecore_Pos_Map
 * Defines the position mappings for the animation.
 */
enum Ecore_Pos_Map    /* Position mappings */
{
   ECORE_POS_MAP_LINEAR, /**< Linear 0.0 -> 1.0 */
   ECORE_POS_MAP_ACCELERATE, /**< Start slow then speed up */
   ECORE_POS_MAP_DECELERATE, /**< Start fast then slow down */
   ECORE_POS_MAP_SINUSOIDAL, /**< Start slow, speed up then slow down at end */
   ECORE_POS_MAP_ACCELERATE_FACTOR, /**< Start slow then speed up, v1 being a power factor, 0.0 being linear, 1.0 being normal accelerate, 2.0 being much more pronounced accelerate (squared), 3.0 being cubed, etc. */
   ECORE_POS_MAP_DECELERATE_FACTOR, /**< Start fast then slow down, v1 being a power factor, 0.0 being linear, 1.0 being normal decelerate, 2.0 being much more pronounced decelerate (squared), 3.0 being cubed, etc. */
   ECORE_POS_MAP_SINUSOIDAL_FACTOR, /**< Start slow, speed up then slow down at end, v1 being a power factor, 0.0 being linear, 1.0 being normal sinusoidal, 2.0 being much more pronounced sinusoidal (squared), 3.0 being cubed, etc. */
   ECORE_POS_MAP_DIVISOR_INTERP, /**< Start at gradient * v1, interpolated via power of v2 curve */
   ECORE_POS_MAP_BOUNCE, /**< Start at 0.0 then "drop" like a ball bouncing to the ground at 1.0, and bounce v2 times, with decay factor of v1 */
   ECORE_POS_MAP_SPRING /**< Start at 0.0 then "wobble" like a spring rest position 1.0, and wobble v2 times, with decay factor of v1 */
}

/**
 * @enum _Ecore_Animator_Source
 * Defines the timing sources for animators.
 */
enum Ecore_Animator_Source    /* Timing sources for animators */
{
   ECORE_ANIMATOR_SOURCE_TIMER, /**< The default system clock/timer based animator that ticks every "frametime" seconds */
   ECORE_ANIMATOR_SOURCE_CUSTOM /**< A custom animator trigger that you need to call ecore_animator_trigger() to make it tick */
}

/**
 * @typedef Ecore_Timeline_Cb Ecore_Timeline_Cb
 * A callback run for a task (animators with runtimes)
 */
alias Eina_Bool function(void *data, double pos) *Ecore_Timeline_Cb;

/**
 * @brief Add an animator to call @p func at every animation tick during main
 * loop execution.
 *
 * @param func The function to call when it ticks off
 * @param data The data to pass to the function
 * @return A handle to the new animator
 *
 * This function adds a animator and returns its handle on success and @c NULL
 * on failure. The function @p func will be called every N seconds where N is
 * the @p frametime interval set by ecore_animator_frametime_set(). The
 * function will be passed the @p data pointer as its parameter.
 *
 * When the animator @p func is called, it must return a value of either 1 or
 * 0. If it returns 1 (or ECORE_CALLBACK_RENEW), it will be called again at
 * the next tick, or if it returns 0 (or ECORE_CALLBACK_CANCEL) it will be
 * deleted automatically making any references/handles for it invalid.
 *
 * @note The default @p frametime value is 1/30th of a second.
 *
 * @see ecore_animator_timeline_add()
 * @see ecore_animator_frametime_set()
 */
Ecore_Animator *ecore_animator_add(Ecore_Task_Cb func, const void *data);

/**
 * @brief Add a animator that runs for a limited time
 *
 * @param runtime The time to run in seconds
 * @param func The function to call when it ticks off
 * @param data The data to pass to the function
 * @return A handle to the new animator
 *
 * This function is just like ecore_animator_add() except the animator only
 * runs for a limited time specified in seconds by @p runtime. Once the
 * runtime the animator has elapsed (animator finished) it will automatically
 * be deleted. The callback function @p func can return ECORE_CALLBACK_RENEW
 * to keep the animator running or ECORE_CALLBACK_CANCEL ro stop it and have
 * it be deleted automatically at any time.
 *
 * The @p func will ALSO be passed a position parameter that will be in value
 * from 0.0 to 1.0 to indicate where along the timeline (0.0 start, 1.0 end)
 * the animator run is at. If the callback wishes not to have a linear
 * transition it can "map" this value to one of several curves and mappings
 * via ecore_animator_pos_map().
 *
 * @note The default @p frametime value is 1/30th of a second.
 *
 * @see ecore_animator_add()
 * @see ecore_animator_pos_map()
 * @since 1.1.0
 */
Ecore_Animator *ecore_animator_timeline_add(double runtime, Ecore_Timeline_Cb func, const void *data);

/**
 * @brief Delete the specified animator from the animator list.
 *
 * @param animator The animator to delete
 * @return The data pointer set for the animator on add
 *
 * Delete the specified @p animator from the set of animators that are
 * executed during main loop execution. This function returns the data
 * parameter that was being passed to the callback on success, or @c NULL on
 * failure. After this call returns the specified animator object @p animator
 * is invalid and should not be used again. It will not get called again after
 * deletion.
 */
void *ecore_animator_del(Ecore_Animator *animator);

/**
 * @brief Suspend the specified animator.
 *
 * @param animator The animator to delete
 *
 * The specified @p animator will be temporarily removed from the set of
 * animators that are executed during main loop.
 *
 * @warning Freezing an animator doesn't freeze accounting of how long that
 * animator has been running. Therefore if the animator was created with
 *ecore_animator_timeline_add() the @p pos argument given to the callback
 * will increase as if the animator hadn't been frozen and the animator may
 * have it's execution halted if @p runtime elapsed.
 */
void ecore_animator_freeze(Ecore_Animator *animator);

/**
 * @brief Restore execution of the specified animator.
 *
 * @param animator The animator to delete
 *
 * The specified @p animator will be put back in the set of animators that are
 * executed during main loop.
 */
void ecore_animator_thaw(Ecore_Animator *animator);

/**
 * @brief Set the animator call interval in seconds.
 *
 * @param frametime The time in seconds in between animator ticks.
 *
 * This function sets the time interval (in seconds) between animator ticks.
 * At every tick the callback of every existing animator will be called.
 *
 * @warning Too small a value may cause performance issues and too high a
 * value may cause your animation to seem "jerky".
 *
 * @note The default @p frametime value is 1/30th of a second.
 */
void ecore_animator_frametime_set(double frametime);

/**
 * @brief Get the animator call interval in seconds.
 *
 * @return The time in second in between animator ticks.
 *
 * This function retrieves the time in seconds between animator ticks.
 *
 * @see ecore_animator_frametime_set()
 */
double ecore_animator_frametime_get();

/**
 * @brief Maps an input position from 0.0 to 1.0 along a timeline to a
 * position in a different curve.
 *
 * @param pos The input position to map
 * @param map The mapping to use
 * @param v1 A parameter use by the mapping (pass 0.0 if not used)
 * @param v2 A parameter use by the mapping (pass 0.0 if not used)
 * @return The mapped value
 *
 * Takes an input position (0.0 to 1.0) and maps to a new position (normally
 * between 0.0 and 1.0, but it may go above/below 0.0 or 1.0 to show that it
 * has "overshot" the mark) using some interpolation (mapping) algorithm.
 *
 * This function useful to create non-linear animations. It offers a variety
 * of possible animation curves to be used:
 * @li ECORE_POS_MAP_LINEAR - Linear, returns @p pos
 * @li ECORE_POS_MAP_ACCELERATE - Start slow then speed up
 * @li ECORE_POS_MAP_DECELERATE - Start fast then slow down
 * @li ECORE_POS_MAP_SINUSOIDAL - Start slow, speed up then slow down at end
 * @li ECORE_POS_MAP_ACCELERATE_FACTOR - Start slow then speed up, v1 being a
 * power factor, 0.0 being linear, 1.0 being ECORE_POS_MAP_ACCELERATE, 2.0
 * being much more pronounced accelerate (squared), 3.0 being cubed, etc.
 * @li ECORE_POS_MAP_DECELERATE_FACTOR - Start fast then slow down, v1 being a
 * power factor, 0.0 being linear, 1.0 being ECORE_POS_MAP_DECELERATE, 2.0
 * being much more pronounced decelerate (squared), 3.0 being cubed, etc.
 * @li ECORE_POS_MAP_SINUSOIDAL_FACTOR - Start slow, speed up then slow down
 * at end, v1 being a power factor, 0.0 being linear, 1.0 being
 * ECORE_POS_MAP_SINUSOIDAL, 2.0 being much more pronounced sinusoidal
 * (squared), 3.0 being cubed, etc.
 * @li ECORE_POS_MAP_DIVISOR_INTERP - Start at gradient * v1, interpolated via
 * power of v2 curve
 * @li ECORE_POS_MAP_BOUNCE - Start at 0.0 then "drop" like a ball bouncing to
 * the ground at 1.0, and bounce v2 times, with decay factor of v1
 * @li ECORE_POS_MAP_SPRING - Start at 0.0 then "wobble" like a spring rest
 * position 1.0, and wobble v2 times, with decay factor of v1
 * @note When not listed v1 and v2 have no effect.
 *
 * @image html ecore-pos-map.png
 * @image latex ecore-pos-map.eps width=\textwidth
 *
 * One way to use this would be:
 * @code
 * double pos; // input position in a timeline from 0.0 to 1.0
 * double out; // output position after mapping
 * int x1, y1, x2, y2; // x1 & y1 are start position, x2 & y2 are end position
 * int x, y; // x & y are the calculated position
 *
 * out = ecore_animator_pos_map(pos, ECORE_POS_MAP_BOUNCE, 1.8, 7);
 * x = (x1 * out) + (x2 * (1.0 - out));
 * y = (y1 * out) + (y2 * (1.0 - out));
 * move_my_object_to(myobject, x, y);
 * @endcode
 * This will make an animation that bounces 7 each times diminishing by a
 * factor of 1.8.
 *
 * @see _Ecore_Pos_Map
 *
 * @since 1.1.0
 */
double ecore_animator_pos_map(double pos, Ecore_Pos_Map map, double v1, double v2);

/**
 * @brief Set the source of animator ticks for the mainloop
 *
 * @param source The source of animator ticks to use
 *
 * This sets the source of animator ticks. When an animator is active the
 * mainloop will "tick" over frame by frame calling all animators that are
 * registered until none are. The mainloop will tick at a given rate based
 * on the animator source. The default source is the system clock timer
 * source - ECORE_ANIMATOR_SOURCE_TIMER. This source uses the system clock
 * to tick over every N seconds (specified by ecore_animator_frametime_set(),
 * with the default being 1/30th of a second unless set otherwise). You can
 * set a custom tick source by setting the source to
 * ECORE_ANIMATOR_SOURCE_CUSTOM and then drive it yourself based on some input
 * tick source (like another application via ipc, some vertical blanking
 * interrupt interrupt etc.) using
 *ecore_animator_custom_source_tick_begin_callback_set() and
 *ecore_animator_custom_source_tick_end_callback_set() to set the functions
 * that will be called to start and stop the ticking source, which when it
 * gets a "tick" should call ecore_animator_custom_tick() to make the "tick" over 1
 * frame.
 */
void ecore_animator_source_set(Ecore_Animator_Source source);

/**
 * @brief Get the animator source currently set.
 *
 * @return The current animator source
 *
 * This gets the current animator source.
 *
 * @see ecore_animator_source_set()
 */
Ecore_Animator_Source ecore_animator_source_get();

/**
 * @brief Set the function that begins a custom animator tick source
 *
 * @param func The function to call when ticking is to begin
 * @param data The data passed to the tick begin function as its parameter
 *
 * The Ecore Animator infrastructure handles tracking if animators are needed
 * or not and which ones need to be called and when, but when the tick source
 * is custom, you have to provide a tick source by calling
 *ecore_animator_custom_tick() to indicate a frame tick happened. In order
 * to allow the source of ticks to be dynamically enabled or disabled as
 * needed, the @p func when set is called to enable the tick source to
 * produce tick events that call ecore_animator_custom_tick(). If @p func
 * is @c NULL then no function is called to begin custom ticking.
 *
 * @see ecore_animator_source_set()
 * @see ecore_animator_custom_source_tick_end_callback_set()
 * @see ecore_animator_custom_tick()
 */
void ecore_animator_custom_source_tick_begin_callback_set(Ecore_Cb func, const void *data);

/**
 * @brief Set the function that ends a custom animator tick source
 *
 * @param func The function to call when ticking is to end
 * @param data The data passed to the tick end function as its parameter
 *
 * This function is a matching pair to the function set by
 * ecore_animator_custom_source_tick_begin_callback_set() and is called
 * when ticking is to stop. If @p func is @c NULL then no function will be
 * called to stop ticking. For more information please see
 * ecore_animator_custom_source_tick_begin_callback_set().
 *
 * @see ecore_animator_source_set()
 * @see ecore_animator_custom_source_tick_begin_callback_set()
 * @see ecore_animator_custom_tick()
 */
void ecore_animator_custom_source_tick_end_callback_set(Ecore_Cb func, const void *data);

/**
 * @brief Trigger a custom animator tick
 *
 * When animator source is set to ECORE_ANIMATOR_SOURCE_CUSTOM, then calling
 * this function triggers a run of all animators currently registered with
 * Ecore as this indicates a "frame tick" happened. This will do nothing if
 * the animator source(set by ecore_animator_source_set()) is not set to
 * ECORE_ANIMATOR_SOURCE_CUSTOM.
 *
 * @see ecore_animator_source_set()
 * @see ecore_animator_custom_source_tick_begin_callback_set
 * @see ecore_animator_custom_source_tick_end_callback_set()()
 */
void ecore_animator_custom_tick();

/**
 * @}
 *
/**
 * @defgroup Ecore_Time_Group Ecore time functions
 *
 * These are function to retrieve time in a given format.
 *
 * Examples:
 * @li @ref ecore_time_functions_example_c
 * @{
 */
double ecore_time_get();
double ecore_time_unix_get();
double ecore_loop_time_get();

/**
 * @}
 *
/**
 * @defgroup Ecore_Timer_Group Ecore Timer functions
 *
 * Ecore provides very flexible timer functionality. The basic usage of timers,
 * to call a certain function at a certain interval can be achieved with a
 * single line:
 * @code
 * Eina_Bool my_func(void *data) {
 *    do_funky_stuff_with_data(data);
 *    return EINA_TRUE;
 * }
 * ecore_timer_add(interval_in_seconds, my_func, data_given_to_function);
 * @endcode
 * @note If the function was to be executed only once simply return
 * @c EINA_FALSE instead.
 *
 * An example that shows the usage of a lot of these:
 * @li @ref ecore_timer_example_c
 *
 * @ingroup Ecore_Main_Loop_Group
 *
 * @{
 */
struct Ecore_Timer; /**< A handle for timers */

Ecore_Timer *ecore_timer_add(double Ein, Ecore_Task_Cb func, const void *data);
Ecore_Timer *ecore_timer_loop_add(double Ein, Ecore_Task_Cb func, const void *data);
void *ecore_timer_del(Ecore_Timer *timer);
void ecore_timer_interval_set(Ecore_Timer *timer, double Ein);
double ecore_timer_interval_get(Ecore_Timer *timer);
void ecore_timer_freeze(Ecore_Timer *timer);
void ecore_timer_thaw(Ecore_Timer *timer);
void ecore_timer_delay(Ecore_Timer *timer, double add);
void ecore_timer_reset(Ecore_Timer *timer);
double ecore_timer_pending_get(Ecore_Timer *timer);
double ecore_timer_precision_get();
void ecore_timer_precision_set(double precision);
char *ecore_timer_dump();

/**
 * @}
 *
/**
 * @defgroup Ecore_Idle_Group Ecore Idle functions
 *
 * The idler functionality in Ecore allows for callbacks to be called when the
 * program isn't handling @ref Ecore_Event_Group "events", @ref Ecore_Timer_Group
 * "timers" or @ref Ecore_FD_Handler_Group "fd handlers".
 *
 * There are three types of idlers: Enterers, Idlers(proper) and Exiters. They
 * are called, respectively, when the program is about to enter an idle state,
 * when the program is in an idle state and when the program has just left an
 * idle state and will begin processing @ref Ecore_Event_Group "events", @ref
 * Ecore_Timer_Group "timers" or @ref Ecore_FD_Handler_Group "fd handlers".
 *
 * Enterer callbacks are good for updating your program's state, if
 * it has a state engine.  Once all of the enterer handlers are
 * called, the program will enter a "sleeping" state.
 *
 * Idler callbacks are called when the main loop has called all
 * enterer handlers.  They are useful for interfaces that require
 * polling and timers would be too slow to use.
 *
 * Exiter callbacks are called when the main loop wakes up from an idle state.
 *
 * If no idler callbacks are specified, then the process literally
 * goes to sleep.  Otherwise, the idler callbacks are called
 * continuously while the loop is "idle", using as much CPU as is
 * available to the process.
 *
 * @note Idle state doesn't mean that the @b program is idle, but
 * that the <b>main loop</b> is idle. It doesn't have any timers,
 * events, fd handlers or anything else to process (which in most
 * <em>event driven</em> programs also means that the @b program is
 * idle too, but it's not a rule). The program itself may be doing
 * a lot of processing in the idler, or in another thread, for
 * example.
 *
 * Example with functions that deal with idle state:
 *
 * @li @ref ecore_idler_example_c
 *
 * @ingroup Ecore_Main_Loop_Group
 *
 * @{
 */
struct Ecore_Idler; /**< A handle for idlers */
struct Ecore_Idle_Enterer; /**< A handle for idle enterers */
struct Ecore_Idle_Exiter; /**< A handle for idle exiters */

/**
 * Add an idler handler.
 * @param  func The function to call when idling.
 * @param  data The data to be passed to this @p func call.
 * @return A idler handle if successfully added, @c NULL otherwise.
 *
 * Add an idler handle to the event loop, returning a handle on
 * success and @c NULL otherwise. The function @p func will be called
 * repeatedly while no other events are ready to be processed, as
 * long as it returns @c 1 (or ECORE_CALLBACK_RENEW). A return of @c 0
 * (or ECORE_CALLBACK_CANCEL) deletes the idler.
 *
 * Idlers are useful for progressively prossessing data without blocking.
 */
Ecore_Idler *ecore_idler_add(Ecore_Task_Cb func, const void *data);

/**
 * Delete an idler callback from the list to be executed.
 * @param  idler The handle of the idler callback to delete
 * @return The data pointer passed to the idler callback on success, @c NULL
 *         otherwise.
 */
void *ecore_idler_del(Ecore_Idler *idler);

Ecore_Idle_Enterer *ecore_idle_enterer_add(Ecore_Task_Cb func, const void *data);
Ecore_Idle_Enterer *ecore_idle_enterer_before_add(Ecore_Task_Cb func, const void *data);
void *ecore_idle_enterer_del(Ecore_Idle_Enterer *idle_enterer);

Ecore_Idle_Exiter *ecore_idle_exiter_add(Ecore_Task_Cb func, const void *data);
void *ecore_idle_exiter_del(Ecore_Idle_Exiter *idle_exiter);

/**
 * @}
 *
/**
 * @defgroup Ecore_Thread_Group Ecore Thread functions
 *
 * Facilities to run heavy tasks in different threads to avoid blocking
 * the main loop.
 *
 * The EFL is, for the most part, not thread safe. This means that if you
 * have some task running in another thread and you have, for example, an
 * Evas object to show the status progress of this task, you cannot update
 * the object from within the thread. This can only be done from the main
 * thread, the one running the main loop. This problem can be solved
 * by running a thread that sends messages to the main one using an
 * @ref Ecore_Pipe_Group "Ecore_Pipe", but when you need to handle other
 * things like cancelling the thread, your code grows in complexity and gets
 * much harder to maintain.
 *
 * Ecore Thread is here to solve that problem. It is @b not a simple wrapper
 * around standard POSIX threads (or the equivalent in other systems) and
 * it's not meant to be used to run parallel tasks throughout the entire
 * duration of the program, especially when these tasks are performance
 * critical, as Ecore manages these tasks using a pool of threads based on
 * system configuration.
 *
 * What Ecore Thread does, is make it a lot easier to dispatch a worker
 * function to perform some heavy task and then get the result once it
 * completes, without blocking the application's UI. In addition, cancelling
 * and rescheduling comes practically for free and the developer needs not
 * worry about how many threads are launched, since Ecore will schedule
 * them according to the number of processors the system has and maximum
 * amount of concurrent threads set for the application.
 *
 * At the system level, Ecore will start a new thread on an as-needed basis
 * until the maximum set is reached. When no more threads can be launched,
 * new worker functions will be queued in a waiting list until a thread
 * becomes available. This way, system threads will be shared throughout
 * different worker functions, but running only one at a time. At the same
 * time, a worker function that is rescheduled may be run on a different
 * thread the next time.
 *
 * The ::Ecore_Thread handler has two meanings, depending on what context
 * it is on. The one returned when starting a worker with any of the
 * functions ecore_thread_run() or ecore_thread_feedback_run() is an
 * identifier of that specific instance of the function and can be used from
 * the main loop with the ecore_thread_cancel() and ecore_thread_check()
 * functions. This handler must not be shared with the worker function
 * function running in the thread. This same handler will be the one received
 * on the @c end, @c cancel and @c feedback callbacks.
 *
 * The worker function, that's the one running in the thread, also receives
 * an ::Ecore_Thread handler that can be used with ecore_thread_cancel() and
 *ecore_thread_check(), sharing the flag with the main loop. But this
 * handler is also associated with the thread where the function is running.
 * This has strong implications when working with thread local data.
 *
 * There are two kinds of worker threads Ecore handles: simple, or short,
 * workers and feedback workers.
 *
 * The first kind is for simple functions that perform a
 * usually small but time consuming task. Ecore will run this function in
 * a thread as soon as one becomes available and notify the calling user of
 * its completion once the task is done.
 *
 * The following image shows the flow of a program running four tasks on
 * a pool of two threads.
 *
 * @image html ecore_thread.png
 * @image rtf ecore_thread.png
 * @image latex ecore_thread.eps width=\textwidth
 *
 * For larger tasks that may require continuous communication with the main
 * program, the feedback workers provide the same functionality plus a way
 * for the function running in the thread to send messages to the main
 * thread.
 *
 * The next diagram omits some details shown in the previous one regarding
 * how threads are spawned and tasks are queued, but illustrates how feedback
 * jobs communicate with the main loop and the special case of threads
 * running out of pool.
 *
 * @image html ecore_thread_feedback.png
 * @image rtf ecore_thread_feedback.png
 * @image latex ecore_thread_feedback.eps width=\textwidth
 *
 * See an overview example in @ref ecore_thread_example_c.
 *
 * @ingroup Ecore_Main_Loop_Group
 *
 * @{
 */

struct Ecore_Thread; /**< A handle for threaded jobs */

/**
 * @typedef Ecore_Thread_Cb Ecore_Thread_Cb
 * A callback used by Ecore_Thread helper.
 */
alias void function(void *data, Ecore_Thread *thread) *Ecore_Thread_Cb;

/**
 * @typedef Ecore_Thread_Notify_Cb Ecore_Thread_Notify_Cb
 * A callback used by the main loop to receive data sent by an
 * @ref Ecore_Thread_Group.
 */
alias void function(void *data, Ecore_Thread *thread, void *msg_data) *Ecore_Thread_Notify_Cb;

/**
 * Schedule a task to run in a parallel thread to avoid locking the main loop
 *
 * @param func_blocking The function that should run in another thread.
 * @param func_end Function to call from main loop when @p func_blocking
 * completes its task successfully (may be NULL)
 * @param func_cancel Function to call from main loop if the thread running
 * @p func_blocking is cancelled or fails to start (may be NULL)
 * @param data User context data to pass to all callbacks.
 * @return A new thread handler, or @c NULL on failure.
 *
 * This function will try to create a new thread to run @p func_blocking in,
 * or if the maximum number of concurrent threads has been reached, will
 * add it to the pending list, where it will wait until a thread becomes
 * available. The return value will be an ::Ecore_Thread handle that can
 * be used to cancel the thread before its completion.
 *
 * @note This function should always return immediately, but in the rare
 * case that Ecore is built with no thread support, @p func_blocking will
 * be called here, actually blocking the main loop.
 *
 * Once a thread becomes available, @p func_blocking will be run in it until
 * it finishes, then @p func_end is called from the thread containing the
 * main loop to inform the user of its completion. While in @p func_blocking,
 * no functions from the EFL can be used, except for those from Eina that are
 * marked to be thread-safe. Even for the latter, caution needs to be taken
 * if the data is shared across several threads.
 *
 * @p func_end will be called from the main thread when @p func_blocking ends,
 * so here it's safe to use anything from the EFL freely.
 *
 * The thread can also be cancelled before its completion calling
 *ecore_thread_cancel(), either from the main thread or @p func_blocking.
 * In this case, @p func_cancel will be called, also from the main thread
 * to inform of this happening. If the thread could not be created, this
 * function will be called and it's @c thread parameter will be NULL. It's
 * also safe to call any EFL function here, as it will be running in the
 * main thread.
 *
 * Inside @p func_blocking, it's possible to call ecore_thread_reschedule()
 * to tell Ecore that this function should be called again.
 *
 * Be aware that no assumptions can be made about the order in which the
 * @p func_end callbacks for each task will be called. Once the function is
 * running in a different thread, it's the OS that will handle its running
 * schedule, and different functions may take longer to finish than others.
 * Also remember that just starting several tasks together doesn't mean they
 * will be running at the same time. Ecore will schedule them based on the
 * number of threads available for the particular system it's running in,
 * so some of the jobs started may be waiting until another one finishes
 * before it can execute its own @p func_blocking.
 *
 * @see ecore_thread_feedback_run()
 * @see ecore_thread_cancel()
 * @see ecore_thread_reschedule()
 * @see ecore_thread_max_set()
 */
Ecore_Thread *ecore_thread_run(Ecore_Thread_Cb func_blocking, Ecore_Thread_Cb func_end, Ecore_Thread_Cb func_cancel, const void *data);

/**
 * Launch a thread to run a task that can talk back to the main thread
 *
 * @param func_heavy The function that should run in another thread.
 * @param func_notify Function that receives the data sent from the thread
 * @param func_end Function to call from main loop when @p func_heavy
 * completes its task successfully
 * @param func_cancel Function to call from main loop if the thread running
 * @p func_heavy is cancelled or fails to start
 * @param data User context data to pass to all callback.
 * @param try_no_queue If you want to run outside of the thread pool.
 * @return A new thread handler, or @c NULL on failure.
 *
 * See ecore_thread_run() for a general description of this function.
 *
 * The difference with the above is that ecore_thread_run() is meant for
 * tasks that don't need to communicate anything until they finish, while
 * this function is provided with a new callback, @p func_notify, that will
 * be called from the main thread for every message sent from @p func_heavy
 * with ecore_thread_feedback().
 *
 * Like with ecore_thread_run(), a new thread will be launched to run
 * @p func_heavy unless the maximum number of simultaneous threads has been
 * reached, in which case the function will be scheduled to run whenever a
 * running task ends and a thread becomes free. But if @p try_no_queue is
 * set, Ecore will first try to launch a thread outside of the pool to run
 * the task. If it fails, it will revert to the normal behaviour of using a
 * thread from the pool as if @p try_no_queue had not been set.
 *
 * Keep in mind that Ecore handles the thread pool based on the number of
 * CPUs available, but running a thread outside of the pool doesn't count for
 * this, so having too many of them may have drastic effects over the
 * program's performance.
 *
 * @see ecore_thread_feedback()
 * @see ecore_thread_run()
 * @see ecore_thread_cancel()
 * @see ecore_thread_reschedule()
 * @see ecore_thread_max_set()
 */
Ecore_Thread *ecore_thread_feedback_run(Ecore_Thread_Cb func_heavy, Ecore_Thread_Notify_Cb func_notify,
                                             Ecore_Thread_Cb func_end, Ecore_Thread_Cb func_cancel,
                                             const void *data, Eina_Bool try_no_queue);
/**
 * Cancel a running thread.
 *
 * @param thread The thread to cancel.
 * @return Will return @c EINA_TRUE if the thread has been cancelled,
 *         @c EINA_FALSE if it is pending.
 *
 * This function can be called both in the main loop or in the running thread.
 *
 * This function cancels a running thread. If @p thread can be immediately
 * cancelled (it's still pending execution after creation or rescheduling),
 * then the @c cancel callback will be called, @p thread will be freed and
 * the function will return @c EINA_TRUE.
 *
 * If the thread is already running, then this function returns @c EINA_FALSE
 * after marking the @p thread as pending cancellation. For the thread to
 * actually be terminated, it needs to return from the user function back
 * into Ecore control. This can happen in several ways:
 * @li The function ends and returns normally. If it hadn't been cancelled,
 * @c func_end would be called here, but instead @c func_cancel will happen.
 * @li The function returns after requesting to be rescheduled with
 * ecore_thread_reschedule().
 * @li The function is prepared to leave early by checking if
 * ecore_thread_check() returns @c EINA_TRUE.
 *
 * The user function can cancel itself by calling ecore_thread_cancel(), but
 * it should always use the ::Ecore_Thread handle passed to it and never
 * share it with the main loop thread by means of shared user data or any
 * other way.
 *
 * @p thread will be freed and should not be used again if this function
 * returns @c EINA_TRUE or after the @c func_cancel callback returns.
 *
 * @see ecore_thread_check()
 */
Eina_Bool ecore_thread_cancel(Ecore_Thread *thread);

/**
 * Checks if a thread is pending cancellation
 *
 * @param thread The thread to test.
 * @return @c EINA_TRUE if the thread is pending cancellation,
 *         @c EINA_FALSE if it is not.
 *
 * This function can be called both in the main loop or in the running thread.
 *
 * When ecore_thread_cancel() is called on an already running task, the
 * thread is marked as pending cancellation. This function returns @c EINA_TRUE
 * if this mark is set for the given @p thread and can be used from the
 * main loop thread to check if a still active thread has been cancelled,
 * or from the user function running in the thread to check if it should
 * stop doing what it's doing and return early, effectively cancelling the
 * task.
 *
 * @see ecore_thread_cancel()
 */
Eina_Bool ecore_thread_check(Ecore_Thread *thread);

/**
 * Sends data from the worker thread to the main loop
 *
 * @param thread The current ::Ecore_Thread context to send data from
 * @param msg_data Data to be transmitted to the main loop
 * @return @c EINA_TRUE if @p msg_data was successfully sent to main loop,
 *         @c EINA_FALSE if anything goes wrong.
 *
 * You should use this function only in the @c func_heavy call.
 *
 * Only the address to @p msg_data will be sent and once this function
 * returns @c EINA_TRUE, the job running in the thread should never touch the
 * contents of it again. The data sent should be malloc()'ed or something
 * similar, as long as it's not memory local to the thread that risks being
 * overwritten or deleted once it goes out of scope or the thread finishes.
 *
 * Care must be taken that @p msg_data is properly freed in the @c func_notify
 * callback set when creating the thread.
 *
 * @see ecore_thread_feedback_run()
 */
Eina_Bool ecore_thread_feedback(Ecore_Thread *thread, const void *msg_data);

/**
 * Asks for the function in the thread to be called again at a later time
 *
 * @param thread The current ::Ecore_Thread context to rescheduled
 * @return @c EINA_TRUE if the task was successfully rescheduled,
 *         @c EINA_FALSE if anything goes wrong.
 *
 * This function should be called only from the same function represented
 * by @p thread.
 *
 * Calling this function will mark the thread for a reschedule, so as soon
 * as it returns, it will be added to the end of the list of pending tasks.
 * If no other tasks are waiting or there are sufficient threads available,
 * the rescheduled task will be launched again immediately.
 *
 * This should never return @c EINA_FALSE, unless it was called from the wrong
 * thread or with the wrong arguments.
 *
 * The @c func_end callback set when the thread is created will not be
 * called until the function in the thread returns without being rescheduled.
 * Similarly, if the @p thread is cancelled, the reschedule will not take
 * effect.
 */
Eina_Bool ecore_thread_reschedule(Ecore_Thread *thread);

/**
 * Gets the number of active threads running jobs
 *
 * @return Number of active threads running jobs
 *
 * This returns the number of threads currently running jobs of any type
 * through the Ecore_Thread API.
 *
 * @note Jobs started through the ecore_thread_feedback_run() function with
 * the @c try_no_queue parameter set to @c EINA_TRUE will not be accounted for
 * in the return of this function unless the thread creation fails and it
 * falls back to using one from the pool.
 */
int ecore_thread_active_get();

/**
 * Gets the number of short jobs waiting for a thread to run
 *
 * @return Number of pending threads running "short" jobs
 *
 * This returns the number of tasks started with ecore_thread_run() that are
 * pending, waiting for a thread to become available to run them.
 */
int ecore_thread_pending_get();

/**
 * Gets the number of feedback jobs waiting for a thread to run
 *
 * @return Number of pending threads running "feedback" jobs
 *
 * This returns the number of tasks started with ecore_thread_feedback_run()
 * that are pending, waiting for a thread to become available to run them.
 */
int ecore_thread_pending_feedback_get();

/**
 * Gets the total number of pending jobs
 *
 * @return Number of pending threads running jobs
 *
 * Same as the sum of ecore_thread_pending_get() and
 *ecore_thread_pending_feedback_get().
 */
int ecore_thread_pending_total_get();

/**
 * Gets the maximum number of threads that can run simultaneously
 *
 * @return Max possible number of Ecore_Thread's running concurrently
 *
 * This returns the maximum number of Ecore_Thread's that may be running at
 * the same time. If this number is reached, new jobs started by either
 *ecore_thread_run() or ecore_thread_feedback_run() will be added to the
 * respective pending queue until one of the running threads finishes its
 * task and becomes available to run a new one.
 *
 * By default, this will be the number of available CPUs for the
 * running program (as returned by eina_cpu_count()), or 1 if this value
 * could not be fetched.
 *
 * @see ecore_thread_max_set()
 * @see ecore_thread_max_reset()
 */
int ecore_thread_max_get();

/**
 * Sets the maximum number of threads allowed to run simultaneously
 *
 * @param num The new maximum
 *
 * This sets a new value for the maximum number of concurrently running
 * Ecore_Thread's. It @b must an integer between 1 and (2 * @c x), where @c x
 * is the number for CPUs available.
 *
 * @see ecore_thread_max_get()
 * @see ecore_thread_max_reset()
 */
void ecore_thread_max_set(int num);

/**
 * Resets the maximum number of concurrently running threads to the default
 *
 * This resets the value returned by ecore_thread_max_get() back to its
 * default.
 *
 * @see ecore_thread_max_get()
 * @see ecore_thread_max_set()
 */
void ecore_thread_max_reset();

/**
 * Gets the number of threads available for running tasks
 *
 * @return The number of available threads
 *
 * Same as doing ecore_thread_max_get() - ecore_thread_active_get().
 *
 * This function may return a negative number only in the case the user
 * changed the maximum number of running threads while other tasks are
 * running.
 */
int ecore_thread_available_get();

/**
 * Adds some data to a hash local to the thread
 *
 * @param thread The thread context the data belongs to
 * @param key The name under which the data will be stored
 * @param value The data to add
 * @param cb Function to free the data when removed from the hash
 * @param direct If true, this will not copy the key string (like
 * eina_hash_direct_add())
 * @return @c EINA_TRUE on success, @c EINA_FALSE on failure.
 *
 * Ecore Thread has a mechanism to share data across several worker functions
 * that run on the same system thread. That is, the data is stored per
 * thread and for a worker function to have access to it, it must be run
 * by the same thread that stored the data.
 *
 * When there are no more workers pending, the thread will be destroyed
 * along with the internal hash and any data left in it will be freed with
 * the @p cb function given.
 *
 * This set of functions is useful to share things around several instances
 * of a function when that thing is costly to create and can be reused, but
 * may only be used by one function at a time.
 *
 * For example, if you have a program doing requisitions to a database,
 * these requisitions can be done in threads so that waiting for the
 * database to respond doesn't block the UI. Each of these threads will
 * run a function, and each function will be dependent on a connection to
 * the database, which may not be able to handle more than one request at
 * a time so for each running function you will need one connection handle.
 * The options then are:
 * @li Each function opens a connection when it's called, does the work and
 * closes the connection when it finishes. This may be costly, wasting a lot
 * of time on resolving hostnames, negotiating permissions and allocating
 * memory.
 * @li Open the connections in the main loop and pass it to the threads
 * using the data pointer. Even worse, it's just as costly as before and now
 * it may even be kept with connections open doing nothing until a thread
 * becomes available to run the function.
 * @li Have a way to share connection handles, so that each instance of the
 * function can check if an available connection exists, and if it doesn't,
 * create one and add it to the pool. When no more connections are needed,
 * they are all closed.
 *
 * The last option is the most efficient, but it requires a lot of work to
 * implement properly. Using thread local data helps to achieve the same
 * result while avoiding doing all the tracking work on your code. The way
 * to use it would be, at the worker function, to ask for the connection
 * with ecore_thread_local_data_find() and if it doesn't exist, then open
 * a new one and save it with ecore_thread_local_data_add(). Do the work and
 * forget about the connection handle, when everything is done the function
 * just ends. The next worker to run on that thread will check if a
 * connection exists and find that it does, so the process of opening a
 * new one has been spared. When no more workers exist, the thread is
 * destroyed and the callback used when saving the connection will be called
 * to close it.
 *
 * This function adds the data @p value to the thread data under the given
 * @p key.
 * No other value in the hash may have the same @p key. If you need to
 * change the value under a @p key, or you don't know if one exists already,
 * you can use ecore_thread_local_data_set().
 *
 * Neither @p key nor @p value may be @c NULL and @p key will be copied in the
 * hash, unless @p direct is set, in which case the string used should not
 * be freed until the data is removed from the hash.
 *
 * The @p cb function will be called when the data in the hash needs to be
 * freed, be it because it got deleted with ecore_thread_local_data_del() or
 * because @p thread was terminated and the hash destroyed. This parameter
 * may be NULL, in which case @p value needs to be manually freed after
 * removing it from the hash with either ecore_thread_local_data_del() or
 * ecore_thread_local_data_set(), but it's very unlikely that this is what
 * you want.
 *
 * This function, and all of the others in the @c ecore_thread_local_data
 * family of functions, can only be called within the worker function running
 * in the thread. Do not call them from the main loop or from a thread
 * other than the one represented by @p thread.
 *
 * @see ecore_thread_local_data_set()
 * @see ecore_thread_local_data_find()
 * @see ecore_thread_local_data_del()
 */
Eina_Bool ecore_thread_local_data_add(Ecore_Thread *thread, const char *key, void *value,
                                           Eina_Free_Cb cb, Eina_Bool direct);
/**
 * Sets some data in the hash local to the given thread
 *
 * @param thread The thread context the data belongs to
 * @param key The name under which the data will be stored
 * @param value The data to add
 * @param cb Function to free the data when removed from the hash
 *
 * If no data exists in the hash under the @p key, this function adds
 * @p value in the hash under the given @p key and returns NULL.
 * The key itself is copied.
 *
 * If the hash already contains something under @p key, the data will be
 * replaced by @p value and the old value will be returned.
 *
 * @c NULL will also be returned if either @p key or @p value are @c NULL, or
 * if an error occurred.
 *
 * This function, and all of the others in the @c ecore_thread_local_data
 * family of functions, can only be called within the worker function running
 * in the thread. Do not call them from the main loop or from a thread
 * other than the one represented by @p thread.
 *
 * @see ecore_thread_local_data_add()
 * @see ecore_thread_local_data_del()
 * @see ecore_thread_local_data_find()
 */
void *ecore_thread_local_data_set(Ecore_Thread *thread, const char *key, void *value, Eina_Free_Cb cb);

/**
 * Gets data stored in the hash local to the given thread
 *
 * @param thread The thread context the data belongs to
 * @param key The name under which the data is stored
 * @return The value under the given key, or @c NULL on error.
 *
 * Finds and return the data stored in the shared hash under the key @p key.
 *
 * This function, and all of the others in the @c ecore_thread_local_data
 * family of functions, can only be called within the worker function running
 * in the thread. Do not call them from the main loop or from a thread
 * other than the one represented by @p thread.
 *
 * @see ecore_thread_local_data_add()
 * @see ecore_thread_local_data_wait()
 */
void *ecore_thread_local_data_find(Ecore_Thread *thread, const char *key);

/**
 * Deletes from the thread's hash the data corresponding to the given key
 *
 * @param thread The thread context the data belongs to
 * @param key The name under which the data is stored
 * @return @c EINA_TRUE on success, @c EINA_FALSE on failure.
 *
 * If there's any data stored associated with @p key in the global hash,
 * this function will remove it from it and return @c EINA_TRUE. If no data
 * exists or an error occurs, it returns @c EINA_FALSE.
 *
 * If the data was added to the hash with a free function, then it will
 * also be freed after removing it from the hash, otherwise it requires
 * to be manually freed by the user, which means that if no other reference
 * to it exists before calling this function, it will result in a memory
 * leak.
 *
 * This function, and all of the others in the @c ecore_thread_local_data
 * family of functions, can only be called within the worker function running
 * in the thread. Do not call them from the main loop or from a thread
 * other than the one represented by @p thread.
 *
 * @see ecore_thread_local_data_add()
 */
Eina_Bool ecore_thread_local_data_del(Ecore_Thread *thread, const char *key);

/**
 * Adds some data to a hash shared by all threads
 *
 * @param key The name under which the data will be stored
 * @param value The data to add
 * @param cb Function to free the data when removed from the hash
 * @param direct If true, this will not copy the key string (like
 * eina_hash_direct_add())
 * @return @c EINA_TRUE on success, @c EINA_FALSE on failure.
 *
 * Ecore Thread keeps a hash that can be used to share data across several
 * threads, including the main loop one, without having to manually handle
 * mutexes to do so safely.
 *
 * This function adds the data @p value to this hash under the given @p key.
 * No other value in the hash may have the same @p key. If you need to
 * change the value under a @p key, or you don't know if one exists already,
 * you can use ecore_thread_global_data_set().
 *
 * Neither @p key nor @p value may be @c NULL and @p key will be copied in the
 * hash, unless @p direct is set, in which case the string used should not
 * be freed until the data is removed from the hash.
 *
 * The @p cb function will be called when the data in the hash needs to be
 * freed, be it because it got deleted with ecore_thread_global_data_del() or
 * because Ecore Thread was shut down and the hash destroyed. This parameter
 * may be NULL, in which case @p value needs to be manually freed after
 * removing it from the hash with either ecore_thread_global_data_del() or
 *ecore_thread_global_data_set().
 *
 * Manually freeing any data that was added to the hash with a @p cb function
 * is likely to produce a segmentation fault, or any other strange
 * happenings, later on in the program.
 *
 * @see ecore_thread_global_data_del()
 * @see ecore_thread_global_data_set()
 * @see ecore_thread_global_data_find()
 */
Eina_Bool ecore_thread_global_data_add(const char *key, void *value, Eina_Free_Cb cb, Eina_Bool direct);

/**
 * Sets some data in the hash shared by all threads
 *
 * @param key The name under which the data will be stored
 * @param value The data to add
 * @param cb Function to free the data when removed from the hash
 *
 * If no data exists in the hash under the @p key, this function adds
 * @p value in the hash under the given @p key and returns NULL.
 * The key itself is copied.
 *
 * If the hash already contains something under @p key, the data will be
 * replaced by @p value and the old value will be returned.
 *
 * @c NULL will also be returned if either @p key or @p value are @c NULL, or
 * if an error occurred.
 *
 * @see ecore_thread_global_data_add()
 * @see ecore_thread_global_data_del()
 * @see ecore_thread_global_data_find()
 */
void *ecore_thread_global_data_set(const char *key, void *value, Eina_Free_Cb cb);

/**
 * Gets data stored in the hash shared by all threads
 *
 * @param key The name under which the data is stored
 * @return The value under the given key, or @c NULL on error.
 *
 * Finds and return the data stored in the shared hash under the key @p key.
 *
 * Keep in mind that the data returned may be used by more than one thread
 * at the same time and no reference counting is done on it by Ecore.
 * Freeing the data or modifying its contents may require additional
 * precautions to be considered, depending on the application's design.
 *
 * @see ecore_thread_global_data_add()
 * @see ecore_thread_global_data_wait()
 */
void *ecore_thread_global_data_find(const char *key);

/**
 * Deletes from the shared hash the data corresponding to the given key
 *
 * @param key The name under which the data is stored
 * @return @c EINA_TRUE on success, @c EINA_FALSE on failure.
 *
 * If there's any data stored associated with @p key in the global hash,
 * this function will remove it from it and return @c EINA_TRUE. If no data
 * exists or an error occurs, it returns @c EINA_FALSE.
 *
 * If the data was added to the hash with a free function, then it will
 * also be freed after removing it from the hash, otherwise it requires
 * to be manually freed by the user, which means that if no other reference
 * to it exists before calling this function, it will result in a memory
 * leak.
 *
 * Note, also, that freeing data that other threads may be using will result
 * in a crash, so appropriate care must be taken by the application when
 * that possibility exists.
 *
 * @see ecore_thread_global_data_add()
 */
Eina_Bool ecore_thread_global_data_del(const char *key);

/**
 * Gets data stored in the shared hash, or wait for it if it doesn't exist
 *
 * @param key The name under which the data is stored
 * @param seconds The amount of time in seconds to wait for the data.
 * @return The value under the given key, or @c NULL on error.
 *
 * Finds and return the data stored in the shared hash under the key @p key.
 *
 * If there's nothing in the hash under the given @p key, the function
 * will block and wait up to @p seconds seconds for some other thread to
 * add it with either ecore_thread_global_data_add() or
 * ecore_thread_global_data_set(). If after waiting there's still no data
 * to get, @c NULL will be returned.
 *
 * If @p seconds is 0, then no waiting will happen and this function works
 * like ecore_thread_global_data_find(). If @p seconds is less than 0, then
 * the function will wait indefinitely.
 *
 * Keep in mind that the data returned may be used by more than one thread
 * at the same time and no reference counting is done on it by Ecore.
 * Freeing the data or modifying its contents may require additional
 * precautions to be considered, depending on the application's design.
 *
 * @see ecore_thread_global_data_add()
 * @see ecore_thread_global_data_find()
 */
void *ecore_thread_global_data_wait(const char *key, double seconds);

/**
 * @}
 *
/**
 * @defgroup Ecore_Pipe_Group Pipe wrapper
 *
 * These functions wrap the pipe / write / read functions to easily
 * integrate its use into ecore's main loop.
 *
 * The ecore_pipe_add() function creates file descriptors (sockets
 * on Windows) and attach a handle to the ecore main loop. That
 * handle is called when data is read in the pipe. To write data in
 * the pipe, just call ecore_pipe_write(). When you are done, just
 * call ecore_pipe_del().
 *
 * For examples see here:
 * @li @ref tutorial_ecore_pipe_gstreamer_example
 * @li @ref tutorial_ecore_pipe_simple_example
 *
 * @ingroup Ecore_Main_Loop_Group
 *
 * @{
 */

struct Ecore_Pipe; /**< A handle for pipes */

/**
 * @typedef Ecore_Pipe_Cb Ecore_Pipe_Cb
 * The callback that data written to the pipe is sent to.
 */
alias void function(void *data, void *buffer, uint nbyte) *Ecore_Pipe_Cb;

Ecore_Pipe *ecore_pipe_add(Ecore_Pipe_Cb handler, const void *data);
void *ecore_pipe_del(Ecore_Pipe *p);
Eina_Bool ecore_pipe_write(Ecore_Pipe *p, const void *buffer, uint nbytes);
void ecore_pipe_write_close(Ecore_Pipe *p);
void ecore_pipe_read_close(Ecore_Pipe *p);
void ecore_pipe_thaw(Ecore_Pipe *p);
void ecore_pipe_freeze(Ecore_Pipe *p);
int ecore_pipe_wait(Ecore_Pipe *p, int message_count, double wait);

/**
 * @}
 *
/**
 * @defgroup Ecore_Job_Group Ecore Job functions
 *
 * You can queue jobs that are to be done by the main loop when the
 * current event is dealt with.
 *
 * Jobs are processed by the main loop similarly to events. They
 * also will be executed in the order in which they were added.
 *
 * A good use for them is when you don't want to execute an action
 * immediately, but want to give the control back to the main loop
 * so that it will call your job callback when jobs start being
 * processed (and if there are other jobs added before yours, they
 * will be processed first). This also gives the chance to other
 * actions in your program to cancel the job before it is started.
 *
 * Examples of using @ref Ecore_Job :
 * @li @ref ecore_job_example_c
 *
 * @ingroup Ecore_Main_Loop_Group
 *
 * @{
 */
struct Ecore_Job;    /**< A job handle */

Ecore_Job *ecore_job_add(Ecore_Cb func, const void *data);
void *ecore_job_del(Ecore_Job *job);

/**
 * @}
 *
/**
 * @defgroup Ecore_Application_Group Ecore Application functions
 *
 * @{
 */
void ecore_app_args_set(int argc, const char** argv);
void ecore_app_args_get(int* argc, char*** argv);
void ecore_app_restart();

/**
 * @}
 *
/**
 * @defgroup Ecore_Throttle_Group Ecore Throttle functions
 *
 * @ingroup Ecore_Main_Loop_Group
 *
 * @{
 */
void ecore_throttle_adjust(double amount);
double ecore_throttle_get();

/**
 * @}
 */

}
