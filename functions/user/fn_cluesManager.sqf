/*

    loops on server to follow group tracee and place markers time by time

*/

if (!isServer) exitWith {}; // only execute once on server

// loop to place new markers
[{
    params ["_args", "_handle"];

    if (!(missionNamespace getVariable ["GRAD_INTROCAM_DONE", false])) exitWith {};

    private _distanceToNext = missionNamespace getVariable ["GRAD_TRACE_DISTANCE_CURRENT", selectRandom [1,2,3]];
    private _tracedUnits = missionNamespace getVariable ["GRAD_TRACED_UNITS", []];

    {
        private _unit = _x;

        private _positionLast = _unit getVariable ["GRAD_TRACE_POSITION_LAST", [0,0,0]];
        // prevent team split up in blufor, if they do, track each leader separately
        if (_unit == leader group _unit) then {
            if ((_unit distance _positionLast) >= _distanceToNext) then {

                if (!isNull (objectParent _unit)) then {

                    private _select = selectRandom [0,1];

                    private _type = ["data\footprint.paa", "data\footprint2.paa"] select _select;
                    private _where = [[0.2,0,0],[0,0.2,0]] select _select;
                    private _position = AGLtoASL (_unit modelToWorldVisual _where);
                    private _direction = getDir _unit;

                    [_position, _type, _direction] remoteExec ["custom_fnc_clue_drop_local", east];

                     diag_log format ["dropping clue %1", _unit];

                    // store distance for next
                    missionNamespace setVariable ["GRAD_TRACE_DISTANCE_CURRENT", selectRandom [1,2,3]];
                    _unit setVariable ["GRAD_TRACE_POSITION_LAST", _position];
                };
            };
        };
    } forEach _tracedUnits;

}, 1, []] call CBA_fnc_addPerFrameHandler;
