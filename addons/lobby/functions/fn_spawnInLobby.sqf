#include "script_component.hpp"

cutText ["", "BLACK OUT", 0.001];
player setUnitLoadout EMPTY_LOADOUT;
player setPos getPos COOPR_LOBBY;
// to prevent lobby players from syncing
player setVariable [COOPR_KEY_PLAYER_LOGGEDIN, false, true];

DEBUG2("player %1 spawned in lobby", getPlayerUID player);

