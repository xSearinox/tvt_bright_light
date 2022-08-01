params ["_pos","_unit","_search_radius",["_pedestrian_only",false]];

_roads = (_pos nearRoads _search_radius);
_roads = _roads select {not (getRoadInfo _x select 2)};
_road = if (count _roads == 0) then {  
	_roads = (_pos nearRoads 3000); 
	_roads = _roads select {not (getRoadInfo _x select 2)};
	_distances = _roads apply {_pos distance _x};  
	_roads select (_distances findIf {_x == selectMin _distances});   
} else {  
	_distances = _roads apply {_pos distance _x};  
	_roads select (_distances findIf {_x == selectMax _distances});  
}; 
private _info = getRoadInfo _road;   
private _dir = (_info select 6) getDir (_info select 7);  
_unit setDir _dir;  
_unit setPos getPos _road; 





