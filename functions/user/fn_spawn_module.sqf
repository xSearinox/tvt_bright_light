params ["_pos","_module_name",["_init",nil]];

private _module_init =  if (isNil _init) then {"this setVariable ['BIS_fnc_initModules_disableAutoActivation', false, true];"} else {_init};

private _moduleGroup = createGroup sideLogic; 
_module_name createUnit [ 
 _pos, 
 _moduleGroup, 
 str _module_init
];