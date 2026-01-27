
_spawnpos = (_this select 3) select 0;
_mode = (_this select 3) select 1;

_dir = random 360;
_counter = 0;
_woundcount = 0;

	_Grp = createGroup civilian;
	"3_T_Tan" createUnit [_spawnpos, _Grp,"victim0 = this"];
	removeGoggles victim0;
	[victim0, true] call ACE_captives_fnc_setHandcuffed;
	
	[victim0, "FSM"] remoteExec ["disableAI", 2];
	null = [victim0, _mode] execVM "SFS\extra\Tib_PractisePatient\Tib_Check.sqf";	
	[victim0,["<t color='#f54242'>Entrenamiento Médico:</t> Finalizar Práctica", "SFS\extra\Tib_PractisePatient\Tib_Delete.sqf"]] remoteExec ["addaction", 0];