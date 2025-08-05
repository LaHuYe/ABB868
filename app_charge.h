
#ifndef __APP_CHARGE__H_
#define __APP_CHARGE__H_

#define bool bit

#define CHRG_OUT_PUT()	{TRISB3 = 0;}
#define CHRG_OUT_PUT_PWM_FULL()	{TRISB3 = 1;}
#define CHRG_OUT_PUT_FULL()	{PWM0EN = 0;TRISB3 = 0;RB3 = 0;}   

typedef struct 
{
	unsigned char Charge : 1 ;
	unsigned char FullCharge :1 ;
	unsigned char ForceFullCharge : 1 ;
	unsigned char flag_charge_force_full_24hour :1;
	unsigned char Remind :1;
	unsigned char flag_led_remind;
	unsigned char flag_remind_delay_10s;
	unsigned int remind_delay_10s_timer;
	unsigned char low_bat_3V3;
	unsigned char LowPower;
	unsigned char LowLed;
	unsigned char LowLed_cnt;
	unsigned int ChargeCnt;
	unsigned int DisChargeCnt;
	unsigned int ChargeFullCnt;
	unsigned int Old_to_Charge_cnt;
	unsigned char low_led_blink_cnt;

} app_charge_t;

extern app_charge_t app_charge;
extern bit flag_discharge_once;

//extern unsigned char ChargeCnt;


void app_process_charge(void);
void ChargePwmOut(unsigned char Duty);

#endif
