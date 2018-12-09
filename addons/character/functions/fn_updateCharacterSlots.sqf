#include "script_component.hpp"

params  ["_playerUid", "_characterSlots"];

LSTART("UPDATING PROFILE");
FLOG("update profile for player %1", _playerUid);

private _allProfiles = call coopr_fnc_getAllProfiles;
[_allProfiles, _playerUid, _characterSlots] call CBA_fnc_hashSet;
profileNamespace setVariable [KEY_PLAYER_PROFILES, _allProfiles];
saveProfileNamespace;

LEND("UPDATING PROFILE");