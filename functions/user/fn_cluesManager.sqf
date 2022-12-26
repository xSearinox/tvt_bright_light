/*

    loops on server to follow group tracee and place markers time by time

*/

if (!isServer) exitWith {}; // only execute once on server

// loop to place new markers
[{
    params ["_args", "_handle"];

    if (!(missionNamespace getVariable ["GRAD_INTROCAM_DONE", false])) exitWith {};

    private _distanceToNext = missionNamespace getVariable ["GRAD_TRACE_DISTANCE_CURRENT", selectRandom [7,12,20]];
    private _tracedUnits = missionNamespace getVariable ["GRAD_TRACED_UNITS", []];

    {
        private _unit = _x;

        diag_log format ["unit %1 checked", _unit];

        private _positionLast = _unit getVariable ["GRAD_TRACE_POSITION_LAST", [0,0,0]];
        // prevent team split up in blufor, if they do, track each leader separately
        if (_unit == leader (group _unit)) then {

            diag_log format ["%1 is leader, distance is %2, next is %3", _unit, _unit distance _positionLast, _distanceToNext];

            if ((_unit distance _positionLast) >= _distanceToNext) then {

                if (isNull (objectParent _unit)) then {

                    diag_log format ["%1 not in vehicle", _unit];

                    private _select = _unit getVariable ["GRAD_TRACE_TRACETYPE_LAST", 0];
                    if (_select < 3) then {
                        _select = _select + 1;
                    } else {
                        _select = 0;
                    };

                    private _type = ["data\footstep1.paa", "data\footstep2.paa", "data\footstep3.paa", "data\footstep4.paa"] select _select;
                    private _where = selectRandom [[0.2,0,0],[0,0.2,0]];
                    private _position = AGLtoASL (_unit modelToWorldVisual _where);
                    private _direction = getDir _unit;

                    [_position, _type, _direction] remoteExec ["custom_fnc_clue_drop_local", east];

                    diag_log format ["dropping clue %1", _unit];

                    // store distance for next
                    missionNamespace setVariable ["GRAD_TRACE_DISTANCE_CURRENT", selectRandom [7,12,20]];
                    _unit setVariable ["GRAD_TRACE_POSITION_LAST", _position];
                    _unit setVariable ["GRAD_TRACE_TRACETYPE_LAST", _select];
                };
            };
        };
    } forEach _tracedUnits;

}, 1, []] call CBA_fnc_addPerFrameHandler;
