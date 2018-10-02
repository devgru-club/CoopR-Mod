#include "..\..\..\globals.hpp"
#include "..\..\constants.hpp"

params ["_profile", "_slot"];

if([_profile] call CBA_fnc_isHash and [_profile] call CBA_fnc_hashSize > 0) then {
    private _name = [_profile, KEY_NAME] call CBA_fnc_hashGet;
    private _reputation = [_profile, KEY_REPUTATION] call CBA_fnc_hashGet;
    private _money = [_profile, KEY_MONEY] call CBA_fnc_hashGet;
    private _prisoner = [_profile, KEY_IS_RENEGADE] call CBA_fnc_hashGet;

    _slot ctrlSetStructuredText composeText [localize "str.dpl.profile.info.name", _name, lineBreak,
                                             localize "str.dpl.profile.info.reputation", str _reputation, lineBreak,
                                             localize "str.dpl.profile.info.money", str _money, lineBreak,
                                             localize "str.dpl.profile.info.isprisoner", str _prisoner, lineBreak];
}else {
    _slot ctrlSetText localize "str.dpl.profiles.noprofile";
};