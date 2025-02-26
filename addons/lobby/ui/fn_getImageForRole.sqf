#include "script_component.hpp"

params [["_role", objNull]];

if (_role isEqualTo objNull) then { ERROR("_role was null") };

DEBUG2("role given was %1", _role);

switch (_role) do {
    case COOPR_ROLE_LEADER: { "group-leader-256.paa" };
    case COOPR_ROLE_MEDIC: { "medic-256.paa" };
    case COOPR_ROLE_ENGINEER: { "engineer-256.paa" };
    case COOPR_ROLE_DMR: { "designated-marksman-256.paa" };
    case COOPR_ROLE_MG: { "mg-gunner-256.paa" };
    case COOPR_ROLE_NONE: { "no-role-256.paa" };
    default { "no-role-256.paa" };
}
