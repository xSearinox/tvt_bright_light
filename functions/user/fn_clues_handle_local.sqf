/*

     hides and shows traces dependent on if in vehicle or not

*/

if (!hasInterface) exitWith {};

params ["_unit"];

diag_log format ["handle local %1", _unit];

if (!isPlayer _unit) exitWith {};

[{
    params ["_args", "_handle"];
    _args params ["_unit"];

    // get all stored traces
    private _allTraces = missionNamespace getVariable ["GRAD_TRACES_LOCAL", []];
    private _inVehicle = !isNull (objectParent _unit);

    // make visible on death
    if (!alive _unit) then {
        _inVehicle = false;
    };

    {
      _x hideObject _inVehicle;
    } forEach _allTraces;

}, 1, [_unit]] call CBA_fnc_addPerFrameHandler;
