//Group Markers
[] execVM "scripts\QS_icons.sqf";
//Recruit Units
[] execVM "bon_recruit_units\init.sqf";
//IED
execVM"ied.sqf";
//AI Spawn System
[]execVM "eos\OpenMe.sqf";
//Ear Plugs
_handle = []execVM "scripts\earplugs.sqf"
//Traffic
call compile preprocessFileLineNumbers "Engima\Traffic\Init.sqf";
//Stamina
if (hasinterface) then 
{
waitUntil {!isnull player};
player enableStamina false;
player setCustomAimCoef 0;
player addEventHandler ["Respawn", {player enableStamina  false}];
player addEventHandler ["Respawn", {player setCustomAimCoef  0}];
};