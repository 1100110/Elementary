module elm_gen;

import Evas;
import Eina;

extern (C)  {
struct Elm_Gen_Item;

/**
 * @struct Elm_Gen_Item_Class
 *
 * Gengrid or Genlist item class definition.
 * field details.
 */
alias char* function(void *data, Evas_Object *obj, const char *part)
                                           *Elm_Gen_Item_Text_Get_Cb; /**< Label fetching class function for gen item classes. */

/**
 * Text fetching class function for Elm_Gen_Item_Class.
 * @param data The data passed in the item creation function
 * @param obj The base widget object
 * @param part The part name of the swallow
 * @return The allocated (NOT stringshared) string to set as the text
 */
alias char* function(void* data, Evas_Object* obj, const char* part)
                                                   *Elm_Gen_Item_Get_Cb;
        /**< Label fetching class function for gen item classes. */

/**
 * Content (swallowed object) fetching class function for Elm_Gen_Item_Class.
 * @param data The data passed in the item creation function
 * @param obj The base widget object
 * @param part The part name of the swallow
 * @return The content object to swallow
 */
alias Evas_Object* function(void* data, Evas_Object* obj, const char* part)
                                            *Elm_Gen_Item_Content_Get_Cb;
        /**< Content(swallowed object) fetching class function for gen item classes. */

/**
 * State fetching class function for Elm_Gen_Item_Class.
 * @param data The data passed in the item creation function
 * @param obj The base widget object
 * @param part The part name of the swallow
 * @return The hell if I know
 */
alias Eina_Bool function(void* data, Evas_Object* obj, const char* part)
                                            *Elm_Gen_Item_State_Get_Cb;
        /**< State fetching class function for gen item classes. */

/**
 * Deletion class function for Elm_Gen_Item_Class.
 * @param data The data passed in the item creation function
 * @param obj The base widget object
 */
alias void function(void* data, Evas_Object* obj) *Elm_Gen_Item_Del_Cb;
        /**< Deletion class function for gen item classes. */

struct Elm_Gen_Item_Class
{
    int             Eversion;
    /**< Set by elementary if you alloc an item class using elm_genlist/gengrid_item_class_new(),
     or if you set your own class (must be const) then set it to ELM_GENLIST/GENGRID_ITEM_CLASS_VERSION */
    uint            refcount;
    /**< Set it to 0 if you use your own const class, or its managed for you by class ref/unref calls */
    Eina_Bool       delete_me;// : 1;
    /**< Leave this alone - set it to 0 if you have a const class of your own */
    const char*     item_style;
    /**< Name of the visual style to use for this item. If you don't know use "default" */
    const char*     decorate_item_style;
    /**< Style used if item is set to a decorate mode. @see elm_genlist_item_decorate_mode_set()
     or NULL if you don't care. currently it's used only in genlist. */
    const char*     decorate_all_item_style;
    /**< Style to use when in edit mode, or NULL if you don't care. currently it's used only in genlist. */
    struct func
    {
        Elm_Gen_Item_Text_Get_Cb    text_get;
        /**< Text fetching class function for genlist/gengrid item classes.*/
        Elm_Gen_Item_Content_Get_Cb content_get;
        /**< Content fetching class function for genlist/gengrid item classes. */
        Elm_Gen_Item_State_Get_Cb   state_get;
        /**< State fetching class function for genlist/gengrid item classes. */
        Elm_Gen_Item_Del_Cb         del;
        /**< Deletion class function for genlist/gengrid item classes. */
    }
} /**< #Elm_Gen_Item_Class member definitions */

immutable ELM_GEN_ITEM_CLASS_VERSION = 2;
/// immutable ELM_GEN_ITEM_CLASS_HEADER = ELM_GEN_ITEM_CLASS_VERSION, 0, 0;
//TODO
}
