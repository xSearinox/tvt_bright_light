params ["_prefix"];

private _relevant_markers = allMapMarkers select {_prefix in _x};

getMarkerPos [(selectRandom _relevant_markers),true];