#include "..\constants.hpp"

params ["_target", "_caller"];

_caller addItem "ACE_key_west";
_target commandChat localize "str.dpl.init.chatter.keys";

FLOG("%1 has requested a vehicle key", name _caller);
