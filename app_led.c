#include "main.h"

uint16_t CntLedFlash;
// #define _XTAL_FREQ 8000000UL		//如果用16M晶振则改为16000000UL

// uint16_t PWM_Cnt;

// bit led_lock;

bit PWM_dir;
uint16_t PWM_Duty;
uint16_t PWM_Cnt;

// typedef enum
// {
//     LED_STATE_OFF = 0,
//     LED_STATE_ON = !LED_STATE_OFF,
// }led_state_t;

uint32_t led_index;
// uint8_t led_state;

// 单独的灯
void led_pwm_ctrl(led_index_t index, uint8_t state)
{
    led_index |= index;
}

void led_pwm_close(led_index_t index, uint8_t state)
{
    if ((led_index & LED_INDEX_1) == (index & LED_INDEX_1))
    {
        led_index &= ~LED_INDEX_1;
    }
    if ((led_index & LED_INDEX_1) == (index & LED_INDEX_1))
    {
        led_index &= ~LED_INDEX_2;
    }
    if ((led_index & LED_INDEX_1) == (index & LED_INDEX_1))
    {
        led_index &= ~LED_INDEX_3;
    }
    if (led_index == LED_INDEX_ALL)
    {
        led_index = 0;
    }
}

// 呼吸灯
bit PWM_dir;
uint16_t PWM_Duty = 0;
uint16_t PWM_Cnt;
#define pwm_time 200
uint16_t pwm_timer;
#define PWM_WHAT 199

bit is_charge_pwm;
void led_charge_pwm()
{
    if (WORK_STATE_CHARGING == app_work_state)
    {
        if (app_charge.Charge)
        {
             IO_LED1 = 0;
            TRISA &= ~BIT(0);
             IO_LED2 = 0;
            TRISA &= ~BIT(1);
            IO_LED6 = 0;
            TRISA &= ~BIT(6);
            if (app_charge.flag_charge_force_full_24hour)
            {
                is_charge_pwm = 0;
                set_led_state(LED_INDEX_9 | LED_INDEX_10, LED_STATE_OFF);
            }
            else if (app_charge.FullCharge || app_charge.ForceFullCharge)
            {
                is_charge_pwm = 0;
                set_led_state(LED_INDEX_9, LED_STATE_ON);
                set_led_state(LED_INDEX_10, LED_STATE_OFF);
            }
            else
            {
                is_charge_pwm = 1;
                PWM_Cnt++;
                //
                //  PWM_Duty = 50;
                if (PWM_Duty >= PWM_Cnt) // 100us进来一次    50 * 100
                {
                    IO_LED3 = 1;
                    TRISA &= ~BIT(2);
                    IO_LED5 = 0;
                    TRISA &= ~BIT(4);
                    IO_LED4 = 1;
                    TRISA &= ~BIT(3);
                }
                else
                {
                    IO_LED3 = 0;
                    TRISA &= ~BIT(2);
                    IO_LED5 = 0;
                    TRISA &= ~BIT(4);
                }
                if (PWM_Cnt >= PWM_WHAT) // 每50us PWM_Cnt加一次 ，
                {
                    PWM_Cnt = 0;
                }
                pwm_timer++;
                if (!PWM_dir)
                {
                    if (pwm_timer >= pwm_time) // 50us * 200
                    {
                        pwm_timer = 0;

                        if (PWM_Duty >= PWM_WHAT)
                        {
                            PWM_dir = 1;
                        }
                        PWM_Duty++;
                    }
                }
                else
                {
                    if (pwm_timer >= pwm_time) // 每进来一次
                    {

                        pwm_timer = 0;
                        // PWM_Cnt = 0;
                        // 换方向
                        PWM_Duty--;
                        if (!PWM_Duty)
                        {
                            PWM_dir = 0;
                        }
                    }
                }
            }
        }
    }
    else
    {
        is_charge_pwm = 0;
        PWM_Cnt = 0;
        pwm_timer = 0;
    }
}

void app_led_mode_set()
{
    if (work_mode.mode == WORK_MODE_ONE)
    {
        set_led_state(LED_INDEX_2 | LED_INDEX_3, LED_STATE_OFF);
        set_led_state(LED_INDEX_1, LED_STATE_ON);
    }
    else if (work_mode.mode == WORK_MODE_TWO)
    {
        set_led_state(LED_INDEX_1 | LED_INDEX_3, LED_STATE_OFF);
        set_led_state(LED_INDEX_2, LED_STATE_ON);
    }
    else if (work_mode.mode == WORK_MODE_THREE)
    {
        set_led_state(LED_INDEX_1 | LED_INDEX_2, LED_STATE_OFF);
        set_led_state(LED_INDEX_3, LED_STATE_ON);
    }
}

void app_led_water_mode_set()
{
    if (water_work_mode.water_mode == WATER_WORK_MODE_ONE)
    {
        set_led_state(LED_INDEX_8, LED_STATE_ON);
        set_led_state(LED_INDEX_7 | LED_INDEX_6 | LED_INDEX_5 | LED_INDEX_4, LED_STATE_OFF);
    }
    else if (water_work_mode.water_mode == WATER_WORK_MODE_TWO)
    {
        set_led_state(LED_INDEX_8 | LED_INDEX_7, LED_STATE_ON);
        set_led_state(LED_INDEX_6 | LED_INDEX_5 | LED_INDEX_4, LED_STATE_OFF);
    }
    else if (water_work_mode.water_mode == WATER_WORK_MODE_THREE)
    {
        set_led_state(LED_INDEX_8 | LED_INDEX_7 | LED_INDEX_6, LED_STATE_ON);
        set_led_state(LED_INDEX_5 | LED_INDEX_4, LED_STATE_OFF);
    }
    else if (water_work_mode.water_mode == WATER_WORK_MODE_FOUR)
    {
        set_led_state(LED_INDEX_8 | LED_INDEX_7 | LED_INDEX_6 | LED_INDEX_5, LED_STATE_ON);
        set_led_state(LED_INDEX_4, LED_STATE_OFF);
    }
    else if (water_work_mode.water_mode == WATER_WORK_MODE_FIVE)
    {
        set_led_state(LED_INDEX_8 | LED_INDEX_7 | LED_INDEX_6 | LED_INDEX_5 | LED_INDEX_4, LED_STATE_ON);
    }
}

void process_led_remind_low_power()
{
    if (app_charge.LowPower)
    {
        if (app_charge.LowLed)
        {
            app_charge.LowLed_cnt++;
            if (app_charge.LowLed_cnt <= 1)
            {
                app_process_set_work_state(WORK_STATE_POWEROFF);
                app_process_set_water_state(WATER_WORK_STATE_POWEROFF);
                app_charge.low_led_blink_cnt = 5;
                set_led_dirct_state(LED_INDEX_NULL);
            }
            else if (app_charge.LowLed_cnt < 25)
            {
                set_led_state(LED_INDEX_10, LED_STATE_ON);
            }
            else if (app_charge.LowLed_cnt < 50)
            {
                set_led_state(LED_INDEX_10, LED_STATE_OFF);
            }
            else
            {
                app_charge.low_led_blink_cnt--;
                if (!app_charge.low_led_blink_cnt)
                {
                    app_charge.LowLed = FLASE;
                }
                app_charge.LowLed_cnt = 2;
            }
        }
    }
    else if (app_charge.Remind)
    {
        if (app_work_state == WORK_STATE_WORKING || water_work_state == WATER_WORK_STATE_WORKING || app_charge.flag_remind_delay_10s)
        {
            CntLedFlash++;
            if (CntLedFlash <= MS(500))
            {
                set_led_state(LED_INDEX_10, LED_STATE_ON);
            }
            else if (CntLedFlash <= MS(1000))
            {
                set_led_state(LED_INDEX_10, LED_STATE_OFF);
            }
            else
            {
                CntLedFlash = 0;
                if (app_charge.flag_remind_delay_10s)
                {
                    //低电关机亮灯10S
                    if (++app_charge.remind_delay_10s_timer >= 10)
                    {
                        app_charge.flag_remind_delay_10s = 0;
                        // 关机
                        set_led_state(LED_INDEX_10, LED_STATE_OFF);
                        if (water_work_state != WATER_WORK_STATE_MODE_LED)
                        {
                             app_process_set_work_state(WORK_STATE_POWEROFF);
                            app_process_set_water_state(WATER_WORK_STATE_POWEROFF);
                        }
                        
                       
                    }
                }
            }
        }
    }
    else
    {
        CntLedFlash = 0;
    }
}

void set_led_state(led_index_t index, led_state_t state)
{
    if (LED_STATE_ON == state)
    {
        led_index |= index;
    }
    else if (LED_STATE_OFF == state)
    {
        led_index &= ~index;
    }
}

void set_led_dirct_state(led_index_t index)
{
    led_index = index;
}
static volatile u8 step = 0;
void process_led(void)
{
   if (is_charge_pwm)
    {
        return;
    }
    TRISA = 0b01011111;
    // PORTA = 0b00000000;
    if (step == 0)
    {
        if (led_index & LED_INDEX_1)//GREEN1
        {
            IO_LED2 = 0;
            TRISA &= ~BIT(1);
        }
        if (led_index & LED_INDEX_2)//GREEN2
        {
            IO_LED3 = 0;
            TRISA &= ~BIT(2);
        }
        if (led_index & LED_INDEX_3)//GREEN3
        {
            IO_LED4 = 0;
            TRISA &= ~BIT(3);
        }
        if (led_index & LED_INDEX_4)//BLUE4
        {
            IO_LED5 = 0;
            TRISA &= ~BIT(4);
        }
        if (led_index & LED_INDEX_5)//BLUE5
        {
            IO_LED6 = 0;
            TRISA &= ~BIT(6);
        }
        IO_LED1 = 1;
        TRISA &= ~BIT(0);
    }
    if (step == 1)
    {
        if (led_index & LED_INDEX_6)//BLUE6
        {
            IO_LED4 = 0;
            TRISA &= ~BIT(3);
        }
        if (led_index & LED_INDEX_7)//BLUE7
        {
            IO_LED6 = 0;
            TRISA &= ~BIT(6);
        }
        if (led_index & LED_INDEX_8)//BLUE8
        {
            IO_LED5 = 0;
            TRISA &= ~BIT(4);
        }
        IO_LED2 = 1;
        TRISA &= ~BIT(1);
    }
    if (step == 2)
    {
        if (led_index & LED_INDEX_9)//GREEN
        {
            IO_LED4 = 0;
            TRISA &= ~BIT(3);
        }
        IO_LED3 = 1;
        TRISA &= ~BIT(2);
    }
    if (step == 3)
    {
        if (led_index & LED_INDEX_10)//RED
        {
            IO_LED5 = 0;
            TRISA &= ~BIT(4);
        }
        IO_LED3 = 1;
        TRISA &= ~BIT(2);
    }
    step++;
    if (step > 3)
    {
        step = 0;
    }
}