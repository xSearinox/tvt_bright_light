/*

    drops local object on position defined by server
    stores in local DB for hiding/unhiding if necessary

*/

params ["_position", "_type", "_direction"];

diag_log format ["_tracePiece %1 %2 %3", _position, _type, _direction];

private _allTraces = missionNamespace getVariable ["GRAD_TRACES_LOCAL", []];
// private _tracePiece = createSimpleObject [_type, _position, true];

private _tracePiece = "UserTexture1m_F" createVehicleLocal _position;
_tracePiece setDir _direction;
_tracePiece setObjectTexture [0,_type];


_tracePiece setObjectMaterial [0,"data\footstep.rvmat"]; // make footstep glow / better visible
_tracePiece setPos [_position#0, _position#1, 0.1]; // make sure to lift above ground
// private _vectorUp = surfaceNormal position _tracePiece;
// _tracePiece setVectorDirAndUp [[1,0,0], _vectorUp];
[_tracePiece, -90, 0] call BIS_fnc_setPitchBank;

//

private _helper = "Sign_Sphere10cm_F" createVehicle [0,0,0];

_helper setPos (_tracePiece modelToWorldVisual [0,0,-0.11]);
_helper setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,0)"];

[_helper, _direction] call custom_fnc_clueTimeStamp;

_allTraces pushbackUnique _tracePiece;
missionNamespace setVariable ["GRAD_TRACES_LOCAL", _allTraces];