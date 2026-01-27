// ---- Medical Training Config -----------------------------------------------
// Edite aquí las estaciones de entrenamiento. El formato es [ nombre_panel, nombre_spawn_dummy]
sfsmedtrn_stations = [
	[ medtrn_station_01, medtrn_spawn_01 ],
	[ medtrn_station_02, medtrn_spawn_02 ],
	[ medtrn_station_03, medtrn_spawn_03 ],
	[ medtrn_station_04, medtrn_spawn_04 ]
];

// ---- Medical Training Init Code --------------------------------------------
// NO TOCAR ESTA SECCION!!!
if (isServer) then {
	private _medtrn_options = [
		["<t color='#f54242'>Entrenamiento Médico:</t> Herida Aleatoria", "randomWound"],
		["<t color='#f54242'>Entrenamiento Médico:</t> Herida por Explosión", "explosionWound"],
		["<t color='#f54242'>Entrenamiento Médico:</t> Herida por Arma de Fuego", "gunshotWound"],
		["<t color='#f54242'>Entrenamiento Médico:</t> Herida por Impacto", "impactWound"],
		["<t color='#f54242'>Entrenamiento Médico:</t> Herida por Apuñalamiento", "stabWound"]
	];

	{
		private _medstation = _x select 0;
		private _medspawn = _x select 1;
		{
			[
				_medstation, 
				[_x select 0, "SFS\extra\Tib_PractisePatient\Tib_Medical.sqf", [_medspawn, _x select 1]]
			] remoteExec ["addaction", 0];
		} forEach _medtrn_options;
	} forEach sfsmedtrn_stations;
};