private _allPlayers = call BIS_fnc_listPlayers;

// get random spawn position
private _pos = ["start_"] call spawner_fnc_get_random_spawn_point; 

// Port Spike team to position
{ 
 [_pos,_x,30] call spawner_fnc_random_spike_spawn; 
} foreach units independent;

[_pos,20,false] call custom_fnc_unhide_crashsite;

// Port Opfor Car and Inf on road near spike spawn
private _opfor_distance = ["OpforSpawnDist", nil] call BIS_fnc_getParamValue;
[_pos,opfor_mobile,_opfor_distance] call custom_fnc_put_on_road;
{
 	_x setPos ([getPos opfor_mobile,1,5] call BIS_fnc_findSafePos);
} forEach (units opfor_one);


// Add Opfor hint position
params ["_name","_text","_pos","_channel","_creator","_type"];
["opfor_pos","Eigene Position",getPos opfor_mobile,4,nil,"hd_objective"] remoteExec ["custom_fnc_create_map_marker",east];

// add opfor hint 
private _precision_loss = ["OpforHintPrecision", nil] call BIS_fnc_getParamValue;
private _unprecise_spike_pos = [[[_pos,_precision_loss]]] call BIS_fnc_randomPos;
["spike_pos","Spike Team",_unprecise_spike_pos,4,nil,"selector_selectedMission"] remoteExec ["custom_fnc_create_map_marker",east];


{
if (side _x == east) then {
    _random_face = selectRandom [
    "vn_o_vietnamese_03_02_face_01",
    "vn_o_vietnamese_03_02_face_02",
    "vn_o_vietnamese_03_02_face_03",
    "vn_o_vietnamese_03_02_face_04",
    "vn_o_vietnamese_03_02_face_05",
    "vn_o_vietnamese_01_02_face_01",
    "vn_o_vietnamese_01_02_face_02",
    "vn_o_vietnamese_01_02_face_03",
    "vn_o_vietnamese_01_02_face_04",
    "vn_o_vietnamese_01_02_face_05"
    ];
    [_x, _random_face] remoteExec ["setFace", 0, _x];
};
} forEach _allPlayers;