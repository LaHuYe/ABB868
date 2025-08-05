#include "main.h"

void work_chang_timing()	
{
	if (app_timer.work_updown_count)
	{
		app_timer.work_updown_count--;
		// if (!app_timer.work_updown_count)
		// {
			// app_process_set_work_state(WORK_STATE_POWEROFF);
		// }
	}	
}

void charge_to_oldmode_timing()	
{
	if (app_timer.charge_to_oldmode_count)
	{
		app_timer.charge_to_oldmode_count--;
		// if (!app_timer.charge_to_oldmode_count)
		// {

		// }
	}	
}











