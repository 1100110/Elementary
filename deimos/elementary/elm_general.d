/**
 * @defgroup General General
 * @ingroup Elementary
 *
 * @brief General Elementary API. Functions that don't relate to
 * Elementary objects specifically.
 *
 * Here are documented functions which init/shutdown the library,
 * that apply to generic Elementary objects, that deal with
 * configuration, et cetera.
 *
 * @ref general_functions_example_page "This" example contemplates
 * some of these functions.
 */
module elm_general;

import Evas;
import Eina;
import elm_object;

extern (C)  {

/**
 * @addtogroup General
 * @{
 *
/**
 * Defines couple of standard Evas_Object layers to be used
 * with evas_object_layer_set().
 *
 * @note whenever extending with new values, try to keep some padding
 *       to siblings so there is room for further extensions.
 */
enum  Elm_Object_Layer    {
    ELM_OBJECT_LAYER_BACKGROUND = EVAS_LAYER_MIN + 64, /**< where to place backgrounds */
    ELM_OBJECT_LAYER_DEFAULT = 0, /**< Evas_Object default layer (and thus for Elementary) */
    ELM_OBJECT_LAYER_FOCUS = EVAS_LAYER_MAX - 128, /**< where focus object visualization is */
    ELM_OBJECT_LAYER_TOOLTIP = EVAS_LAYER_MAX - 64, /**< where to show tooltips */
    ELM_OBJECT_LAYER_CURSOR = EVAS_LAYER_MAX - 32, /**< where to show cursors */
    ELM_OBJECT_LAYER_LAST /**< last layer known by Elementary */
}

/**************************************************************************/
__gshared int ELM_ECORE_EVENT_ETHUMB_CONNECT;

/**
 * Emitted when the application has reconfigured elementary settings due
 * to an external configuration tool asking it to.
 */
__gshared int ELM_EVENT_CONFIG_ALL_CHANGED;

/**
 * Emitted when any Elementary's policy value is changed.
 */
__gshared int ELM_EVENT_POLICY_CHANGED;

/**
 * @typedef Elm_Event_Policy_Changed
 *
 * Data on the event when an Elementary policy has changed
 *
 *
 * @struct _Elm_Event_Policy_Changed
 *
 * Data on the event when an Elementary policy has changed
 */
struct Elm_Event_Policy_Changed
{
   uint         policy;     /**< the policy identifier */
   int          new_value;  /**< value the policy had before the change */
   int          old_value;  /**< new value the policy got */
}

/**
 * Policy identifiers.
 */
immutable enum Elm_Policy {
   ELM_POLICY_QUIT, /**< under which circumstances the application
                     * should quit automatically. @see
                     * Elm_Policy_Quit.
                     */
   ELM_POLICY_LAST
}                   /**< Elementary policy identifiers/groups enumeration.  @see elm_policy_set() */

immutable enum Elm_Policy_Quit  {
   ELM_POLICY_QUIT_NONE = 0, /**< never quit the application
                              * automatically */
   ELM_POLICY_QUIT_LAST_WINDOW_CLOSED /**< quit when the
                                       * application's last
                                       * window is closed */
}                   /**< Possible values for the #ELM_POLICY_QUIT policy */

immutable enum Elm_Focus_Direction  {
   ELM_FOCUS_PREVIOUS,
   ELM_FOCUS_NEXT
}

immutable enum Elm_Object_Select_Mode   {
   ELM_OBJECT_SELECT_MODE_DEFAULT = 0,  /**< default select mode */
   ELM_OBJECT_SELECT_MODE_ALWAYS,       /**< always select mode */
   ELM_OBJECT_SELECT_MODE_NONE,         /**< no select mode */
   ELM_OBJECT_SELECT_MODE_DISPLAY_ONLY, /**< no select mode with no finger size rule*/
   ELM_OBJECT_SELECT_MODE_MAX
}

/**
 * @typedef Elm_Object_Item
 * An Elementary Object item handle.
 * @ingroup General
 */
struct Elm_Object_Item { };

/// typedef Eina_Bool             (*Elm_Event_Cb)(void *data, Evas_Object *obj, Evas_Object *src, Evas_Callback_Type type, void *event_info);
alias Eina_Bool function(void* data, Evas_Object* obj, Evas_Object* src, Evas_Callback_Type type, void* event_info) *Elm_Event_Cb;
/**< Function prototype definition for callbacks on input events happening on Elementary widgets. @a data will receive the user data pointer passed to elm_object_event_callback_add(). @a src will be a pointer to the widget on which the input event took place. @a type will get the type of this event and @a event_info, the struct with details on this event. */
/// alias Eina_Bool function(void* data, Evas_Object* obj, Evas_Object* src,
//TODO
/// Evas_Callback_Type, void* event_info) *Elm_Event_Cb;

/// #ifndef ELM_LIB_QUICKLAUNCH
/// #define ELM_MAIN() int main(int argc, char **argv) {elm_init(argc, argv); return elm_main(argc, argv); } /**< macro to be used after the elm_main() function */
/// Call mixin(ELM_MAIN!(string "function_to_call");
/// If you don't specify, it will insert the main call for you.
/// I haven't used mixins before, they are very nice.
/// There are a fuckton of hacks right here....
/// elm_main(int argc, char** argv);
template ELM_MAIN(string e_CALL =   "return elm_main(argc, &argv); ") {
    immutable string ELM_MAIN =     "int main(string[] Targ1)    {
                                        string Targ2;
                                        foreach(string temp; Targ1[])
                                            Targ2 ~= temp;
                                        char* argv  = cast(char*)Targ2.toStringz();
                                        int argc    = cast(int)Targ1.length;
                                        elm_init(argc, &argv); "
                                        ~ e_CALL
                                    ~ "}";
}
/// #else
/// #define ELM_MAIN() int main(int argc, char **argv) {return elm_quicklaunch_fallback(argc, argv); } /**< macro to be used after the elm_main() function */
/// #endif

/**************************************************************************/
/* General calls */

/**
 * Initialize Elementary
 *
 * @param[in] argc System's argument count value
 * @param[in] argv System's pointer to array of argument strings
 * @return The init counter value.
 *
 * This function initializes Elementary and increments a counter of
 * the number of calls to it. It returns the new counter's value.
 *
 * @warning This call is exported only for use by the @c ELM_MAIN()
 * macro. There is no need to use this if you use this macro (which
 * is highly advisable). An elm_main() should contain the entry
 * point code for your application, having the same prototype as
 * elm_init(), and @b not being static (putting the @c EAPI_MAIN symbol
 * in front of its type declaration is advisable). The @c
 * ELM_MAIN() call should be placed just after it.
 *
 * Example:
 * @dontinclude bg_example_01.c
 * @skip static void
 * @until ELM_MAIN
 *
 * See the full @ref bg_example_01_c "example".
 *
 * @see elm_shutdown().
 * @ingroup General
 */
int         elm_init(int argc, char** argv);
//TODO magic to turn string[] into char** args

/**
 * Shut down Elementary
 *
 * @return The init counter value.
 *
 * This should be called at the end of your application, just
 * before it ceases to do any more processing. This will clean up
 * any permanent resources your application may have allocated via
 * Elementary that would otherwise persist.
 *
 * @see elm_init() for an example
 *
 * @ingroup General
 */
int       elm_shutdown();

/**
 * Run Elementary's main loop
 *
 * This call should be issued just after all initialization is
 * completed. This function will not return until elm_exit() is
 * called. It will keep looping, running the main
 * (event/processing) loop for Elementary.
 *
 * @see elm_init() for an example
 *
 * @ingroup General
 */
void      elm_run();

/**
 * Exit Elementary's main loop
 *
 * If this call is issued, it will flag the main loop to cease
 * processing and return back to its parent function (usually your
 * elm_main() function).
 *
 * @see elm_init() for an example. There, just after a request to
 * close the window comes, the main loop will be left.
 *
 * @note By using the appropriate #ELM_POLICY_QUIT on your Elementary
 * applications, you'll be able to get this function called automatically for you.
 *
 * @ingroup General
 */
void      elm_exit();

/**
 * Exposed symbol used only by macros and should not be used by apps
 */
/// EAPI void      elm_quicklaunch_mode_set(Eina_Bool ql_on);
//TODO chech that out...
/**
 * Exposed symbol used only by macros and should not be used by apps
 */
/// EAPI Eina_Bool elm_quicklaunch_mode_get(void);
//TODO it does say only used by macros....
/**
 * Exposed symbol used only by macros and should not be used by apps
 */
/// EAPI int       elm_quicklaunch_init(int argc, char **argv);
//TODO
/**
 * Exposed symbol used only by macros and should not be used by apps
 */
/// EAPI int       elm_quicklaunch_sub_init(int argc, char **argv);
//TODO
/**
 * Exposed symbol used only by macros and should not be used by apps
 */
/// EAPI int       elm_quicklaunch_sub_shutdown(void);
//TODO
/**
 * Exposed symbol used only by macros and should not be used by apps
 */
/// EAPI int       elm_quicklaunch_shutdown(void);
//TODO
/**
 * Exposed symbol used only by macros and should not be used by apps
 */
/// EAPI void      elm_quicklaunch_seed(void);
//TODO
/**
 * Exposed symbol used only by macros and should not be used by apps
 */
/// EAPI Eina_Bool elm_quicklaunch_prepare(int argc, char **argv);
//TODO
/**
 * Exposed symbol used only by macros and should not be used by apps
 */
/// EAPI Eina_Bool elm_quicklaunch_fork(int argc, char **argv, char *cwd, void (postfork_func) (void *data), void *postfork_data);
//TODO
/**
 * Exposed symbol used only by macros and should not be used by apps
 */
/// EAPI void      elm_quicklaunch_cleanup(void);
//TODO
/**
 * Exposed symbol used only by macros and should not be used by apps
 */
/// EAPI int       elm_quicklaunch_fallback(int argc, char **argv);
//TODO
/**
 * Exposed symbol used only by macros and should not be used by apps
 */
/// EAPI char     *elm_quicklaunch_exe_path_get(const char *exe);
//TODO

/**
 * Set a new policy's value (for a given policy group/identifier).
 *
 * @param policy policy identifier, as in @ref Elm_Policy.
 * @param value policy value, which depends on the identifier
 *
 * @return @c EINA_TRUE on success or @c EINA_FALSE, on error.
 *
 * Elementary policies define applications' behavior,
 * somehow. These behaviors are divided in policy groups (see
 * #Elm_Policy enumeration). This call will emit the Ecore event
 * #ELM_EVENT_POLICY_CHANGED, which can be hooked at with
 * handlers. An #Elm_Event_Policy_Changed struct will be passed,
 * then.
 *
 * @note Currently, we have only one policy identifier/group
 * (#ELM_POLICY_QUIT), which has two possible values.
 *
 * @ingroup General
 */
Eina_Bool elm_policy_set(uint policy, int value);

/**
 * Gets the policy value for given policy identifier.
 *
 * @param policy policy identifier, as in #Elm_Policy.
 * @return The currently set policy value, for that
 * identifier. Will be @c 0 if @p policy passed is invalid.
 *
 * @ingroup General
 */
int       elm_policy_get(uint policy);

/**
 * Change the language of the current application
 *
 * The @p lang passed must be the full name of the locale to use, for
 * example "en_US.utf8" or "es_ES@euro".
 *
 * Changing language with this function will make Elementary run through
 * all its widgets, translating strings set with
 * elm_object_domain_translatable_text_part_set(). This way, an entire
 * UI can have its language changed without having to restart the program.
 *
 * For more complex cases, like having formatted strings that need
 * translation, widgets will also emit a "language,changed" signal that
 * the user can listen to to manually translate the text.
 *
 * @param lang Language to set, must be the full name of the locale
 *
 * @ingroup General
 */
void      elm_language_set(const char* lang);

/**
 * Set the text for an objects' part, marking it as translatable.
 *
 * The string to set as @p text must be the original one. Do not pass the
 * return of @c gettext() here. Elementary will translate the string
 * internally and set it on the object using elm_object_part_text_set(),
 * also storing the original string so that it can be automatically
 * translated when the language is changed with elm_language_set().
 *
 * The @p domain will be stored along to find the translation in the
 * correct catalog. It can be NULL, in which case it will use whatever
 * domain was set by the application with @c textdomain(). This is useful
 * in case you are building a library on top of Elementary that will have
 * its own translatable strings, that should not be mixed with those of
 * programs using the library.
 *
 * @param obj The object containing the text part
 * @param part The name of the part to set
 * @param domain The translation domain to use
 * @param text The original, non-translated text to set
 *
 * @ingroup General
 */
void      elm_object_domain_translatable_text_part_set(Evas_Object* obj,
               const char *part, const char *domain, const char *text);


/// #define elm_object_domain_translatable_text_set(obj, domain, text) elm_object_domain_translatable_text_part_set((obj), NULL, (domain), (text))
//TODO

/// #define elm_object_translatable_text_set(obj, text)                elm_object_domain_translatable_text_part_set((obj), NULL, NULL, (text))
//TODO

/**
 * Gets the original string set as translatable for an object
 *
 * When setting translated strings, the function elm_object_part_text_get()
 * will return the translation returned by @c gettext(). To get the
 * original string use this function.
 *
 * @param obj The object
 * @param part The name of the part that was set
 *
 * @return The original, untranslated string
 *
 * @ingroup General
 */
char* elm_object_translatable_text_part_get(const Evas_Object *obj,
                                                    const char *part);
//TODO
/// #define elm_object_translatable_text_get(obj) elm_object_translatable_text_part_get((obj), NULL)


/**
 * @}
 */
} //extern (C)
