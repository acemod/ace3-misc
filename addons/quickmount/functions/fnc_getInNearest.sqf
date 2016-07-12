/*
 * Author: Kingsley
 * Mount the given player in the nearest eligible vehicle based on their distance and direction to the vehicle
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call acex_quickmount_fnc_getInNearest;
 *
 * Public: No
 */

#include "script_component.hpp"

if (!GVAR(enabled)) exitWith {};
if (isNull ACE_player || {vehicle ACE_player != ACE_player} || {!alive ACE_player}) exitWith {};

private _start = AGLtoASL positionCameraToWorld [0,0,0];
private _end = (_start vectorAdd (getCameraViewDirection ACE_player vectorMultiply GVAR(distance)));
private _objects = lineIntersectsWith [_start, _end, ACE_player, objNull, true];
reverse _objects;
private _target = _objects param [0, objNull];

if (!isNull _target && {alive _target} && {{_target isKindOf _x} count ["Air","LandVehicle","Ship","StaticMortar"] > 0}) then {
    {
        if (_target emptyPositions _x > 0) exitWith {
            ACE_player action ["GetIn" + _x, _target];
        };
        if (_forEachIndex == 3) then {
            [localize LSTRING(VehicleFull)] call ACEFUNC(common,displayTextStructured);
        };
    } forEach ["Driver", "Gunner", "Commander", "Cargo"];
};

nil
