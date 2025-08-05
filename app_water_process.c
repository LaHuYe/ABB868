 #include "main.h"

uint8_t water_work_step;
uint8_t CntWaterDrive;
uint8_t MotorWaterDuty;

volatile water_work_state_t water_work_state =  WATER_WORK_STATE_POWEROFF;
app_process_water_mode_t water_work_mode = 
{
    WATER_WORK_MODE_THREE,0,0,0
};
app_timer_t app_water_timer = 
{
	0
};

void app_process_set_water_state(water_work_state_t states)
{
    water_work_state = states;
    water_work_step = 0;
}

void water_motor()
{
    if (water_work_mode.water_mode == WATER_WORK_MODE_ONE)
    {
        // MotorWaterDuty=41;
        MotorWaterDuty=36;
    }
    if (water_work_mode.water_mode == WATER_WORK_MODE_TWO)
    {
        // MotorWaterDuty=56;
        MotorWaterDuty=51;
    }
    if (water_work_mode.water_mode == WATER_WORK_MODE_THREE)
    {
        // MotorWaterDuty=71;
        MotorWaterDuty=66;
    }
    if (water_work_mode.water_mode == WATER_WORK_MODE_FOUR)
    {
        // MotorWaterDuty=86;
        MotorWaterDuty=81;
    }
    if (water_work_mode.water_mode == WATER_WORK_MODE_FIVE)
    {
        // MotorWaterDuty=101;
        MotorWaterDuty=96;
    }
    water_work_mode.water_mode_out_put = water_work_mode.water_mode;
}

// void app_process_set_water_mode_init()
// {
//     app_led_water_mode_set();
//     water_motor();
// }

void app_process_set_water_mode_next(void)
{
    water_work_mode.water_mode++;
    if (water_work_mode.water_mode > WATER_WORK_MODE_FIVE)
    {
        water_work_mode.water_mode = WATER_WORK_MODE_ONE;
    }
    // app_led_water_mode_set();
    // if (water_work_state == WATER_WORK_STATE_WORKING)
    // {
    //     water_motor();
    // }
}

void MotorWaterDrive()
{
    if(water_work_mode.water_mode_out_put == WATER_WORK_MODE_IDEL)
    {
        MotorWaterOff;
        return;
    }
    CntWaterDrive++;
    if(CntWaterDrive==1)
    {
    MotorWaterOn;
    }
    if(CntWaterDrive==MotorWaterDuty)
    {
    MotorWaterOff;
    }	 
    if(CntWaterDrive>99)
    {
    CntWaterDrive=0;
    }		
}

void app_process_water_working()
{
     if (!water_work_step)
    {
        water_work_step++;
    }
    else
    {
        water_work_mode.water_mode_count++;
        if (water_work_mode.water_mode_count == SECOND(30))
        {
            water_work_mode.water_mode_out_put = WORK_MODE_IDEL;
        }
        else if (water_work_mode.water_mode_count >= SECOND(30) + MS(200))
        {
            water_work_mode.water_mode_count = 0;
			water_work_mode.times++;
			if(water_work_mode.times >=  4)   
			{
				water_work_mode.times = 0;
                if (app_charge.Remind)
                {
                    app_charge.flag_remind_delay_10s = 1;
				    app_charge.remind_delay_10s_timer = 0;
                }
                    //关机
                app_process_set_water_state(WATER_WORK_STATE_POWEROFF);
            }
            else
            {
                water_work_mode.water_mode_out_put = water_work_mode.water_mode;
            }
        }
    }
}

void water_turn_off()
{
    water_work_mode.water_mode_count = 0;
    water_work_mode.times = 0;
    //关电机
    water_work_mode.water_mode_out_put = WATER_WORK_MODE_IDEL;
    //关灯
    set_led_state(LED_INDEX_8 | LED_INDEX_7 | LED_INDEX_6 | LED_INDEX_5 | LED_INDEX_4, LED_STATE_OFF);
}

void app_process_water_workoff()
{
    water_turn_off();
}

static uint16_t water_mode_led_cnt;
void app_process_water_mdoe_led()
{
     if (!water_work_step)
    {
        water_mode_led_cnt = SECOND(10);
        water_work_step++;
    }
    else
    {
        water_work_mode.water_mode_count++;
        if (water_mode_led_cnt)
        {
            water_mode_led_cnt--;
            if (!water_mode_led_cnt)
            {
                //关机
                app_process_set_water_state(WATER_WORK_STATE_POWEROFF);
            }
        }
    }
}

void app_water_process_work()
{
    switch (water_work_state)
    {
    case WATER_WORK_STATE_WORKING:
        app_process_water_working();
        break;
    case WATER_WORK_STATE_POWEROFF:
        app_process_water_workoff();
        break;
    case WATER_WORK_STATE_MODE_LED:
        app_process_water_mdoe_led();
        break;
    
    default:
        break;
    }
}

























