params["_vehicle","_seconds_to_bingo_fuel"];
//assert (_consumption_rate > 1);
//assert (_time_unit < 0);

private _consumption_rate = 1/_seconds_to_bingo_fuel;

while {alive _vehicle} do {
	if (isEngineOn _vehicle) then {
		_vehicle setFuel ((fuel _vehicle) - _consumption_rate);
	};
	sleep 1;
};
