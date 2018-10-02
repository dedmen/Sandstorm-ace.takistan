params [["_minViewDistance", 0, []]];

_zoom = call CHVD_fnc_trueZoom;
if (_zoom >= 1) then {
	_minViewDistance = _minViewDistance + ((12000 / 74) * (_zoom - 1)) min viewDistance;	
};

//systemChat str _minViewDistance;
_minViewDistance