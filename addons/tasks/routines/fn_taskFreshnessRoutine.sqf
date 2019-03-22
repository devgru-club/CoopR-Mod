#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This routine will check all parameters the freshness of a task in the queue
 * Routine timer: COOPR_TIMER_TASK_FRESHNESS_ROUTINE
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 *
 * Scope: Server
 */

if (isServer) then {
    DEBUG("task freshness routine running");
    private _tasksToBeRemoved = [];
    {
        private _currentTime = call coopr_fnc_currentGameTime;
        private _reportedTime = [_x, COOPR_KEY_TASK_REPORT_TIME] call CBA_fnc_hashGet;
        private _freshness = _currentTime - _reportedTime;
        if (_freshness >= COOPR_TASK_MIN_FRESHNESS) then {
            DEBUG2("freshness of task %1 is too old", _x);
            DEBUG2("was: %1", _freshness);
            _tasksToBeRemoved pushBackUnique _forEachIndex;
        };
    } forEach COOPR_TASKS_QUEUE;
    DEBUG2("there are %1 tasks to be removed", count _tasksToBeRemoved);
    // reverse the array to avoid index problems on removal
    reverse _tasksToBeRemoved;
    { COOPR_TASKS_QUEUE deleteAt _x; } forEach _tasksToBeRemoved;
    DEBUG("task queue has been cleaned from old tasks");
} else {
    SERVER_ONLY_ERROR;
}

