/**
 * Request that your elementary application needs Efreet
 *
 * This initializes the Efreet library when called and if support exists
 * it returns EINA_TRUE, otherwise returns EINA_FALSE. This must be called
 * before any efreet calls.
 *
 * @return EINA_TRUE if support exists and initialization succeeded.
 *
 * @ingroup Efreet
 */
module elm_need;

import Eina;

extern (C)  {
Eina_Bool elm_need_efreet();

/**
 * Request that your elementary application needs e_dbus
 *
 * This initializes the E_dbus library when called and if support exists
 * it returns EINA_TRUE, otherwise returns EINA_FALSE. This must be called
 * before any e_dbus calls.
 *
 * @return EINA_TRUE if support exists and initialization succeeded.
 *
 * @ingroup E_dbus
 */
Eina_Bool elm_need_e_dbus();

/**
 * Request that your elementary application needs ethumb
 *
 * This initializes the Ethumb library when called and if support exists
 * it returns EINA_TRUE, otherwise returns EINA_FALSE.
 * This must be called before any other function that deals with
 * elm_thumb objects or ethumb_client instances.
 *
 * @ingroup Thumb
 */
Eina_Bool elm_need_ethumb();

/**
 * Request that your elementary application needs web support
 *
 * This initializes the Ewebkit library when called and if support exists
 * it returns EINA_TRUE, otherwise returns EINA_FALSE.
 * This must be called before any other function that deals with
 * elm_web objects or ewk_view instances.
 *
 * @ingroup Web
 */
Eina_Bool elm_need_web();
}
