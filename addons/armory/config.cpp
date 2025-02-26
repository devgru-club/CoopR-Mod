#include "script_component.hpp"

class CfgPatches {
    class coopr_armory
    {
        // Meta information for editor
        name = "CoopR Mod";
        author = "xetra11";
        url = "https://github.com/CoopR-Mod/CoopR-Mod";

        requiredVersion = 1.80;
        requiredAddons[] = {
            "coopr_core"
        };
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content unlocking.
        units[] = {
            "CoopR_ModuleSetupArmory"
        };
        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {};
    };
}

#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
// UI
#include "\x\coopr\addons\core\controls.hpp"
#include "ui\CoopR_Armory_Dialog.hpp"
