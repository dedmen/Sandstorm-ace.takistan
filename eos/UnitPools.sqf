private ["_tempArray","_InfPool","_MotPool","_ACHPool","_CHPool","_uavPool","_stPool","_shipPool","_diverPool","_crewPool","_heliCrew","_ArmPool"];
_faction=(_this select 0);
_type=(_this select 1);
_tempArray=[];

// EAST CSAT FACTION
	if (_faction==0) then {
	_InfPool=	["CUP_O_TK_SpecOps_TL","CUP_O_TK_SpecOps","CUP_O_TK_SpecOps_MG","CUP_O_TK_INS_Commander","CUP_O_TK_INS_Soldier_TL","CUP_O_TK_INS_Sniper","CUP_O_TK_INS_Soldier_AT","CUP_O_TK_INS_Soldier_AAT","CUP_O_TK_INS_Soldier_Enfield","CUP_O_TK_INS_Soldier_FNFAL","CUP_O_TK_INS_Soldier","CUP_O_TK_INS_Soldier_GL","CUP_O_TK_INS_Mechanic","CUP_O_TK_INS_Bomber","CUP_O_TK_INS_Soldier_MG","CUP_O_TK_INS_Guerilla_Medic","CUP_O_TK_INS_Soldier_AR","CUP_O_TK_INS_Soldier_AA"];	
	_ArmPool=	["O_MBT_02_cannon_F", "O_MBT_04_cannon_F","O_MBT_04_command_F"];
	_MotPool=	["O_Truck_03_covered_F","O_G_Van_02_transport_F","O_G_Van_02_vehicle_F","O_G_Van_01_transport_F","O_G_Offroad_01_repair_F","O_G_Offroad_01_armed_F","O_G_Offroad_01_F"];
	_ACHPool=	["O_Heli_Light_02_dynamicLoadout_F"];
	_CHPool=	["O_Heli_Light_02_unarmed_F"];
	_uavPool=	[];
	_stPool=	["CUP_O_ZU23_TK_INS","CUP_O_TK_INS_Soldier","CUP_O_2b14_82mm_TK_INS","CUP_O_DSHkM_MiniTriPod_TK_INS","CUP_O_DSHKM_TK_INS","CUP_O_D30_AT_TK_INS","CUP_O_D30_TK_INS","CUP_O_AGS_TK_INS"];
	_shipPool=	[];
	_diverPool=	[];
	_crewPool=	["O_crew_F"];
	_heliCrew=	["O_Pilot_F","O_crew_F"];
};
// WEST NATO FACTION	
	if (_faction==1) then {
	_InfPool=	["B_sniper_F","B_Soldier_A_F","B_Soldier_AA_F","B_Soldier_AAA_F","B_Soldier_AAR_F","B_Soldier_AAT_F","B_Soldier_AR_F","B_Soldier_AT_F","B_soldier_exp_F","B_Soldier_F","B_engineer_F","B_medic_F","B_recon_exp_F","B_recon_F","B_recon_JTAC_F","B_recon_LAT_F","B_recon_M_F","B_recon_medic_F","B_recon_TL_F"];	
	_ArmPool=	["B_MBT_01_arty_F","B_MBT_01_cannon_F","B_MBT_01_mlrs_F","B_APC_Tracked_01_AA_F","B_APC_Tracked_01_CRV_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F","B_MBT_02_cannon_F"];
	_MotPool=	["B_Truck_01_covered_F","B_Truck_01_transport_F","B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_Truck_01_medical_F"];
	_ACHPool=	["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"];
	_CHPool=	["B_Heli_Light_01_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F"];
	_uavPool=	["B_UAV_01_F","B_UAV_01_CAS_F","B_UGV_01_rcws_F"];
	_stPool=	["B_Mortar_01_F","B_static_AT_F","B_static_AA_F"];
	_shipPool=	["B_Boat_Armed_01_minigun_F","B_Boat_Transport_01_F"];
	_diverPool=	["B_diver_exp_F","B_diver_F","B_diver_TL_F"];
	_crewPool=	["B_crew_F"];
	_heliCrew=	["B_helicrew_F","B_helipilot_F"];
};
// INDEPENDENT AAF FACTION	
	if (_faction==2) then {
	_InfPool=	["I_engineer_F","I_Soldier_A_F","I_Soldier_AA_F","I_Soldier_AAA_F","I_Soldier_AAR_F","I_Soldier_AAT_F","I_Soldier_AR_F","I_Soldier_AT_F","I_Soldier_exp_F","I_soldier_F","I_Soldier_GL_F","I_Soldier_repair_F"];	
	_ArmPool=	["I_APC_Wheeled_03_cannon_F"];
	_MotPool=	["I_MRAP_03_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_Truck_02_medical_F"];
	_ACHPool=	[];
	_CHPool=	["I_Heli_Transport_02_F","B_Heli_Light_02_unarmed_F"];
	_uavPool=	["I_UAV_01_F","I_UAV_02_CAS_F","I_UGV_01_rcws_F"];
	_stPool=	["I_Mortar_01_F"];
	_shipPool=	["I_Boat_Transport_01_F","I_G_Boat_Transport_01_F","I_Boat_Armed_01_minigun_F"];
	_diverPool=	["I_diver_exp_F","I_diver_F","I_diver_TL_F"];
	_crewPool=	["I_crew_F"];
	_heliCrew=	["I_helicrew_F","I_helipilot_F"];
};
// CIVILIAN	
	if (_faction==3) then {
	_InfPool=	["C_Man_ConstructionWorker_01_Red_F","C_Man_ConstructionWorker_01_Vrana_F","C_Man_ConstructionWorker_01_Black_F","C_Man_ConstructionWorker_01_Blue_F","C_Man_Paramedic_01_F","C_Man_UtilityWorker_01_F","C_Man_Fisherman_01_F","C_Man_Messenger_01_F","C_Story_Mechanic_01_F","C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_hunter_1_F","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_pilot_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_man_w_worker_F"];	
	_ArmPool=	["C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Quadbike_01_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F"];
	_MotPool=	["C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Quadbike_01_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F"];
	_ACHPool=	["C_Heli_Light_01_civil_F"];
	_CHPool=	["C_Heli_Light_01_civil_F"];
	_uavPool=	[];
	_stPool=	[];
	_shipPool=	["C_Boat_Civil_01_F","C_Boat_Civil_01_rescue_F","C_Boat_Civil_04_F","C_Rubberboat"];
	_diverPool=	[];
	_crewPool=	["C_man_1"];
	_heliCrew=	["C_man_pilot_F"];
};
// WEST FIA FACTION
	if (_faction==4) then {
	_InfPool=	["B_G_engineer_F","B_G_medic_F","B_G_officer_F","B_G_Soldier_A_F","B_G_Soldier_AR_F","B_G_Soldier_exp_F","B_G_Soldier_F","B_G_Soldier_GL_F","B_G_Soldier_LAT_F","B_G_Soldier_lite_F","B_G_Soldier_M_F","B_G_Soldier_SL_F","B_G_Soldier_TL_F"];	
	_ArmPool=	[];
	_MotPool=	["B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_G_Van_01_transport_F","B_G_Van_01_fuel_F"];
	_ACHPool=	[];
	_CHPool=	[];
	_uavPool=	[];
	_stPool=	["B_G_Mortar_01_F"];
	_shipPool=	["B_G_Boat_Transport_01_F"];
	_diverPool=	[];
	_crewPool=	[];
	_heliCrew=	[];
};
// ADD CLASSNAMES 
	if (_faction==5) then {
	_InfPool=	[];	
	_ArmPool=	[];
	_MotPool=	[];
	_ACHPool=	[];
	_CHPool=	[];
	_uavPool=	[];
	_stPool=	[];
	_shipPool=	[];
	_diverPool=	[];
	_crewPool=	[];
	_heliCrew=	[];
	};
	
// ADD CLASSNAMES 	
	if (_faction==6) then {
	_InfPool=	[];	
	_ArmPool=	[];
	_MotPool=	[];
	_ACHPool=	[];
	_CHPool=	[];
	_uavPool=	[];
	_stPool=	[];
	_shipPool=	[];
	_diverPool=	[];
	_crewPool=	[];
	_heliCrew=	[];};
	
// ADD CLASSNAMES 	
	if (_faction==7) then {
	_InfPool=	[];	
	_ArmPool=	[];
	_MotPool=	[];
	_ACHPool=	[];
	_CHPool=	[];
	_uavPool=	[];
	_stPool=	[];
	_shipPool=	[];
	_diverPool=	[];
	_crewPool=	[];
	_heliCrew=	[];};
	
////////////////////////////////////////////////////////////////////////////////////////
if (_type==0) then {
		for "_i" from 0 to 5 do{
		_unit=_InfPool select (floor(random(count _InfPool)));
		_tempArray set [count _tempArray,_unit];};
						};
						
if (_type==1) then {_tempArray=_diverPool};
	
				
// CREATE ARMOUR & CREW			
if (_type==2) then {
				_tempUnit=_ArmPool select (floor(random(count _ArmPool)));
				_temparray set [count _temparray,_tempUnit];
				_crew=_crewPool select (floor(random(count _crewPool)));
				_temparray set [count _temparray,_crew];
};

// CREATE ATTACK CHOPPER & CREW	
if (_type==3) then {
				_tempUnit=_ACHPool select (floor(random(count _ACHPool)));
				_temparray set [count _temparray,_tempUnit];
				_crew=_heliCrew select (floor(random(count _heliCrew)));
				_temparray set [count _temparray,_crew];
};

// CREATE TRANSPORT CHOPPER & CREW		
if (_type==4) then {
				_tempUnit=_CHPool select (floor(random(count _CHPool)));
				_temparray set [count _temparray,_tempUnit];
				_crew=_heliCrew select (floor(random(count _heliCrew)));
				_temparray set [count _temparray,_crew];
						};
						
// CREATE STATIC & CREW						
if (_type==5) then {
				_tempUnit=_stPool select (floor(random(count _stPool)));
				_temparray set [count _temparray,_tempUnit];
				_crew=_crewPool select (floor(random(count _crewPool)));
				_temparray set [count _temparray,_crew];

};
if (_type==6) then {_tempArray=_uavPool select (floor(random(count _uavPool)));};

// CREATE TRANSPORT & CREW
if (_type==7) then {
				_tempUnit=_MotPool select (floor(random(count _MotPool)));
				_temparray set [count _temparray,_tempUnit];
				_crew=_crewPool select (floor(random(count _crewPool)));
				_temparray set [count _temparray,_crew];
				};

// CREATE BOAT & DIVER CREW
if (_type==8) then {
				_tempUnit=_shipPool select (floor(random(count _shipPool)));
				_temparray set [count _temparray,_tempUnit];
				_crew=_diverPool select (floor(random(count _diverPool)));
				_temparray set [count _temparray,_crew];
				};
				
// CREATE CARGO
if (_type==9) then {
		for "_i" from 0 to 4 do{
			_unit=_InfPool select (floor(random(count _InfPool)));
			_temparray set [count _temparray,_unit];
							};
};

// CREATE DIVER CARGO
if (_type==10) then {
		for "_i" from 0 to 4 do{
			_unit=_diverPool select (floor(random(count _diverPool)));
			_temparray set [count _temparray,_unit];
							};			
};

//hint format ["%1",_tempArray];
_tempArray