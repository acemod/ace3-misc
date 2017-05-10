/*
 * Author: Kingsley
 * Gets the cost for the given side and classname.
 *
 * Arguments:
 * 0: Side <SIDE>
 * 1: Classname <STRING>
 *
 * Return Value:
 * Cost <NUMERIC>
 *
 * Example:
 * TODO
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_side", "_classname"];

private _objects = missionNamespace getVariable [format ["ACEX_Fortify_Objects_%1", _side], []];

(((_objects select {(_x select 0) == _classname}) param [0, []]) param [1, 0])