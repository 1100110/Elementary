module Eeze_Net;

import Eina;
import Ecore;

/**
 * @file Eeze_Net.h
 * @brief Network manipulation
 *
 * Eeze net functions allow you to gather information about network objects
 *
 * @addtogroup net Net
 * @{
 */

struct Eeze_Net Eeze_Net;

enum Eeze_Net_Addr_Type
{
   EEZE_NET_ADDR_TYPE_IP,
   EEZE_NET_ADDR_TYPE_IP6,
   EEZE_NET_ADDR_TYPE_BROADCAST,
   EEZE_NET_ADDR_TYPE_BROADCAST6,
   EEZE_NET_ADDR_TYPE_NETMASK,
   EEZE_NET_ADDR_TYPE_NETMASK6,
}

extern (C) {

Eeze_Net   function(const char *name) *eeze_net_new;
void       function(Eeze_Net   *net) eeze_net_free;
const char function(Eeze_Net   *net) *eeze_net_mac_get;
int        function(Eeze_Net   *net) eeze_net_idx_get;
Eina_Bool  function(Eeze_Net   *net) eeze_net_scan;
const char function(Eeze_Net   *net, Eeze_Net_Addr_Type type) *eeze_net_addr_get;
const char function(Eeze_Net   *net, const char *attr) *eeze_net_attribute_get;
const char function(Eeze_Net   *net) *eeze_net_syspath_get;
Eina_List  function()          *eeze_net_list;

}
/** @} */
