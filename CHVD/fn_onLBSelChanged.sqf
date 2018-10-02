params ["_index","_varType", "_text"];

if (!CHVD_allowNoGrass) then {
	_index = _index + 1;
};

private _terrainGrid = switch (_index) do {
	case 0: {50};
	case 1: {48.99};
	case 2: {25};
	case 3: {12.5};
	case 4: {3.125};
};

if (!CHVD_allowNoGrass) then {
	_terrainGrid = _terrainGrid min 48.99;
};
ctrlSetText [_text, str _terrainGrid];

missionNamespace setVariable [_varType, _terrainGrid];
profileNamespace setVariable [str _varType, _varType]

[] call CHVD_fnc_updateTerrain;