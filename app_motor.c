 #include "main.h"

// work_state_t work_mode = WORK_MODE_IDEL;
// work_state_t work_mode_old_keep;
// volatile unsigned char ModeDuty = 0;
// volatile unsigned char ModeDuty_restore = 0;
// volatile unsigned char Mode2TimeCnt = 0;
// volatile unsigned char TimerDiyShakeDelay;
// unsigned char TimerDiyDelay300ms;


u8 low_a;
u8 dead_area1;

u8 low_b;
u8 dead_area_b1;
u8 dead_area_b2;

//u8 Period;
//u8 DutyLow;
//u8 DutyHigh;
//u8 motor_time;

MOTOR_InitTypeDef MOTOR_InitStruct = { 0 };
//---------------------------------------------

app_motor_pwm_pram_t app_motor_pwm_pram = 
{
    0
};

static volatile uint16_t motor_fix_cnt;

void app_process_set_mode_init()
{
    work_mode.mode_out_put = work_mode.mode;
    app_timer.work_updown_count = SECOND(5);
    app_led_mode_set();
	app_process_motor_duty();
}

void app_process_set_mode_next(void)
{
    work_mode.mode++;
	if (work_mode.mode > WORK_MODE_THREE)
	{
		work_mode.mode = WORK_MODE_ONE;
	}
    app_timer.work_updown_count = SECOND(5);
    app_led_mode_set();
	app_process_motor_duty();
}

void app_process_motor_duty()
{
	 switch (work_mode.mode)
    {
    case WORK_MODE_ONE:
        MOTOR_InitStruct.Period = MOTOR_155Hz;
        MOTOR_InitStruct.DutyLow = MOTOR_155Hz_Duty_100;
        MOTOR_InitStruct.DutyHigh = MOTOR_155Hz_Duty_100;
        work_mode.mode_out_put = work_mode.mode;
        break;
    case WORK_MODE_TWO:
        MOTOR_InitStruct.Period = MOTOR_200Hz;
        MOTOR_InitStruct.DutyLow = MOTOR_200Hz_Duty_90;
        MOTOR_InitStruct.DutyHigh = MOTOR_200Hz_Duty_90;
         work_mode.mode_out_put = work_mode.mode;
        break;
    case WORK_MODE_THREE:
        MOTOR_InitStruct.Period = MOTOR_260Hz;
        MOTOR_InitStruct.DutyLow = MOTOR_260Hz_Duty_70;
        MOTOR_InitStruct.DutyHigh = MOTOR_260Hz_Duty_70;
        work_mode.mode_out_put = work_mode.mode;
        break;
    
    default: 
        break;
    }
	low_a = (MOTOR_InitStruct.DutyLow);//低电平的时间
    dead_area1 =  (MOTOR_InitStruct.Period);

    dead_area_b1 = MOTOR_InitStruct.DutyLow + (((MOTOR_InitStruct.Period - MOTOR_InitStruct.DutyLow) - MOTOR_InitStruct.DutyHigh) >> 1);
    low_b = MOTOR_InitStruct.DutyHigh + dead_area_b1;
    dead_area_b2 =  (MOTOR_InitStruct.Period);
}

#if 1
void Mode_control(void)	//50us
{
	//if((app_work_state == WORK_STATE_WORKING || app_work_state == WORK_STATE_OLD_MODE_RUN))
	//if(PwrOnBit && (!MotorStopBit))
	//{
		if(WORK_MODE_IDEL == work_mode.mode_out_put)
		{
			INA = 0;
			INB = 0;
			return;
		}

		motor_fix_cnt++;
		if (motor_fix_cnt <= low_a) 
		{
			INA = 0;
			// INA_OFF
		}
		else if (motor_fix_cnt <= dead_area1)
		{
			INA = 1;
			// INA_ON
		}
		else
		{
			// motor_fix_cnt = 0;
		}

		if (motor_fix_cnt <= dead_area_b1)
		{
			INB = 1;
			// INB_ON
		}
		else if (motor_fix_cnt <= low_b)
		{
			INB = 0;
			// INB_OFF
		}
		else if (motor_fix_cnt <= dead_area_b2)
		{
			INB = 1;
			// INB_ON
		}
		else
		{
			motor_fix_cnt = 0;
		}
	//}
}

#endif

// void app_motor_process()
// {
//    if (app_work_state == WORK_STATE_WORKING)
//     {
//         if (!app_charge.Charge)
//         {
//             app_motor_mode_one_set();
//             app_motor_mode_two_set();
//             app_motor_mode_three_set();
//             app_motor_pulse_mode_set();
//             app_motor_diy_mode_set();
//         }
//     }
// }



