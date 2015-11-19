class CfgFunctions
{
	class Core
	{
		class Utility
		{
			file = "Core\Utility";

			class parkingmeter {};
			class parkingmetertopup {};
		};
	};
};
class CfgSounds
{
	sounds[] = {};
	class coin1
	{
		name = "coin_insert";  //coin insert sound
		sound[] = {"Resources\Insert_Coin_Sound_Effect.ogg", 1, 1};
		titles[] = {0, ""};
	};
};