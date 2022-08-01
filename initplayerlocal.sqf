if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];


["SR Vietnam", "Remove Tracer Ammo",
{
  // Get all the passed parameters
  params [["_positionASL", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];



 if (isNull _objectUnderCursor) exitWith {};
{
  private _unit = _x;
  private _tracer_mags = magazines _unit select {(_x find '_t_mag')!=-1};
  
  if ((count _tracer_mags)!=0) then {
    {
    _unit unassignItem _x;
    _unit removeItem _x;
    _unit addItem (_x select[0,(_x find "_t_mag")+1]) + "mag";
    } forEach _tracer_mags;
  };
 
 if (((currentMagazine _unit) find "_t_mag")!=-1) then {
   
 };

} forEach (units _objectUnderCursor);

}] call zen_custom_modules_fnc_register;