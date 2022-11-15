/*

    drops local object on position defined by server
    stores in local DB for hiding/unhiding if necessary

*/

params ["_type", "_position", "_direction"];


private _allTraces = missionNamespace getVariable ["GRAD_TRACES_LOCAL", []];
private _tracePiece = createSimpleObject [_type, _position, true];
_tracePiece setDir _direction;
_tracePiece setObjectMaterial [0,"\a3\Data_f\Lights\Car_Beacon_Blue_emit.rvmat"]; // make footstep glow / better visible

private _helper = "Sign_Sphere10cm_F" createVehicle [0,0,0];

_helper setPos (_step modelToWorldVisual [0,0,-0.11]);
_helper setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,0)"];

[_helper, _direction] call custom_fnc_clueTimeStamp;

_allTraces pushbackUnique _tracePiece;
missionNamespace setVariable ["GRAD_TRACES_LOCAL", _allTraces];