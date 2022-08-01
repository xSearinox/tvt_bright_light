params ["_pos","_radius","_hide"];

private _eligible_objects = [
	"CraterLong_02_F",
	"Land_UH1H_Wreck_F",
	"Land_Wreck_Heli_02_Wreck_03_F",
	"Land_Wreck_Heli_02_Wreck_04_F",
	"vn_b_men_jetpilot_10"
	];
private _crashsite_objects = nearestObjects [_pos,_eligible_objects,_radius];
{
_x hideObjectGlobal _hide;
} forEach _crashsite_objects;

