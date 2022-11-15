/*

    loops on server to follow group tracee and place markers time by time

*/

if (!isServer) exitWith {}; // only execute once on server

// loop to place new markers
[{
    params ["_args", "_handle"];

    if (!(missionNamespace getVariable ["GRAD_INTROCAM_DONE", false])) exitWith {};

    private _distanceToNext = missionNamespace getVariable ["GRAD_TRACE_DISTANCE_CURRENT", selectRandom [3,7,15]];
    private _tracedUnits = missionNamespace getVariable ["GRAD_TRACED_UNITS", []];

    {
        private _unit = _x;

        // prevent team split up in blufor, if they do, track each leader separately
        if (_unit == leader group _unit) then {
            if ((_unit distance trace_marker) >= _distanceToNext) then {

                if (!isNull objectParent _unit) then {

                    private _select = selectRandom [0,1];
                    private _type = ["a3\characters_f\footstep_r.p3d", "a3\characters_f\footstep_l.p3d"] select _select;
                    private _where = [[0.2,0,0],[0,0.2,0]] select _select;
                    private _position = AGLtoASL (_unit modelToWorldVisual _where);
                    private _direction = getDir _unit;

                    [_position, _type, _direction] remoteExec ["custom_fnc_clue_drop_local", east];

                    // store distance for next
                    missionNamespace setVariable ["GRAD_TRACE_DISTANCE_CURRENT", selectRandom [3,7,15]];
                };
            };
        };
    } forEach _tracedUnits;

}, 1, []] call CBA_fnc_addPerFrameHandler;
