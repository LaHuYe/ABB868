 #include "main.h"

uint8_t work_step;
volatile work_state_t app_work_state =  WORK_STATE_POWEROFF;
uint16_t bat_remind_timer;	

app_process_mode_t work_mode = 
{
    WORK_MODE_TWO,0,0,0
    // WORK_MODE_ONE,
    // WORK_MODE_ONE
};

//uint8_t power_off_led_timer;
//uint8_t blink_cnt;



bit flag_old_mode;

app_timer_t app_timer = 
{
	0
};

void turn_off()//这是牙刷的
{
	work_mode.work_mode_count = 0;
	work_mode.times = 0;
    work_mode.mode_out_put = WORK_MODE_IDEL;
	set_led_state(LED_INDEX_1 | LED_INDEX_2 | LED_INDEX_3, LED_STATE_OFF);
}

void app_process_set_work_state(work_state_t states)
{
    app_work_state = states;
    work_step = 0;
}

u16 times;
void app_process_working()
{
    if (!work_step)
    {
        //turn_off();
        work_step++;
    }
    else
    {
        work_chang_timing();//5s      
        work_mode.work_mode_count++;
        if (work_mode.work_mode_count == SECOND(30))
        {
            work_mode.mode_out_put = WORK_MODE_IDEL;
        }
        else if (work_mode.work_mode_count >= SECOND(30) + MS(200))
        {
            work_mode.work_mode_count = 0;
			work_mode.times++;
			if(work_mode.times >=  4)   
			{
				work_mode.times = 0;
                if (app_charge.Remind)
                {
                    app_charge.flag_remind_delay_10s = 1;
				    app_charge.remind_delay_10s_timer = 0;
                }
                app_process_set_work_state(WORK_STATE_POWEROFF);
            }
            else
            {
                work_mode.mode_out_put = work_mode.mode;
            }
        }
    }
}

void app_process_power_off()
{
    work_mode.work_mode_count = 0;
	work_mode.times = 0;
    work_mode.mode_out_put = WORK_MODE_IDEL;
	set_led_state(LED_INDEX_1 | LED_INDEX_2 | LED_INDEX_3, LED_STATE_OFF);
}

void app_process_go_to_sleep()
{
    if (app_work_state == WORK_STATE_POWEROFF && water_work_state == WATER_WORK_STATE_POWEROFF && !app_charge.flag_remind_delay_10s && !app_charge.LowLed)
    {
        GotoSleep();
    }
    else
    {
        CntSleep = 0;
    }
}


void app_process_charing()
{
   if (!work_step)
    {
        app_process_power_off();
        app_process_set_water_state(WATER_WORK_STATE_POWEROFF);
        app_timer.charge_to_oldmode_count = SECOND(8);
        work_step++;
    }
    else
    {
        // charge_to_oldmode_timing();
        // if (app_charge.flag_charge_force_full_24hour)
        // {
        //     set_led_state(LED_INDEX_9 | LED_INDEX_10,LED_STATE_OFF);
        // }
        // else if (app_charge.FullCharge || app_charge.ForceFullCharge)
        // {
        //     set_led_state(LED_INDEX_9,LED_STATE_ON);
        //     set_led_state(LED_INDEX_10,LED_STATE_OFF);
        // }
        // else
        // {
        //     set_led_state(LED_INDEX_10,LED_STATE_ON);
        //     set_led_state(LED_INDEX_9,LED_STATE_OFF);
        // }
	}
}

// void process_lowBat_led()
// {
//     switch (work_step)
//     {
//     case 0:
//         flag_discharge_once = 0;
//         flag_old_mode = 0;
//         turn_off();
//         work_step++;
//         power_off_led_timer = 0;
//         blink_cnt = 6;//  烁十  
//         break;
//     case 1:
//         power_off_led_timer++;
//         if (power_off_led_timer / MS(300))
//         {
//             power_off_led_timer = 0;
//             if (blink_cnt)
//             {
//                 blink_cnt--;
//                 if (!blink_cnt)
//                 {
//                     work_step++;
//                 }
//             }
//         }
//         break;
//     case 2:
//         app_process_set_work_state(WORK_STATE_POWEROFF);
//         break;
//     default:
//         break;
//     }
// }

// void process_old_mode_run()
// {
//     static u16 old_mode_count;
//     switch (work_step)
//     {
//     case 0:
//         turn_off();
//         work_step++;
//         break;
//     case 1:
//         old_mode_count++;
//         if (old_mode_count == MINUTE(2))
//         {
//             work_mode.mode_out_put = work_mode.mode;
//         }
//         else if(old_mode_count >= MINUTE(2))
// 		{
//             work_mode.mode_out_put = WORK_MODE_IDEL;
//             INA = 0;
//             INB = 0;
// 			old_mode_count = 0;
// 		}
//         break;
//     default:
//         break;
//     }
// }

void process_null()
{

}

work_state_action_t work_state_action_tab[] = 
{
    {WORK_STATE_POWEROFF,app_process_power_off},
    {WORK_STATE_WORKING,app_process_working},
    {WORK_STATE_CHARGING,app_process_charing},
    //{WORK_STATE_CHARGED,process_charged},
    //{WORK_STATE_REMIND_CHARGE,process_remind_charge},
    //{WORK_STATE_POWEROFF_MODE_LED,process_power_off_mode_led},
    //{WORK_STATE_LOWBAT_LED,process_lowBat_led},
    //{WORK_STATE_OLD_MODE_RUN,process_old_mode_run},
    //{WORK_STATE_NULL,process_null},
};

void app_process_work()
{
	// uint8_t i = 0;
    // for ( ; i < SIZE_ARRAY(work_state_action_tab); i++)
    // {
    //     if(work_state_action_tab[i].states == app_work_state)
    //     {
    //         work_state_action_tab[i].cb();
    //         break;
    //     }
    // }
    if (app_work_state == WORK_STATE_POWEROFF)
    {
        app_process_power_off();
    }
    if (app_work_state == WORK_STATE_WORKING)
    {
        app_process_working();
    }
    if (app_work_state == WORK_STATE_CHARGING)
    {
        app_process_charing();
    }
    // if (app_work_state == WORK_STATE_OLD_MODE_RUN)
    // {
    //     process_old_mode_run();
    // }
}


























