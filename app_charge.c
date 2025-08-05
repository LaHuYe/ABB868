
#include "main.h"

app_charge_t app_charge = 
{
	0
	// .Charge = 0,
	// .FullCharge = 0,
	// .low_bat_3V3 = 0,
	// .LowPower = 0,
	// .LowLed = 0,
	// .ChargeCnt = 0,
	// .ChargeFullCnt = 0,
};

bit flag_charge_once;
bit flag_discharge_once;

volatile uint adresultvdd_back = 0;

//bit flag_charge_force_full_24hour;
unsigned long charge_force_full_cnt;

unsigned char charge_full_cnt;
unsigned int charge_full_cnt1;

volatile uint adresult_chagrge_vdd = 0;
//u16 Charge_BatAdValue = 0;
u8	Charge_BatAdSumCnt = 0;
u16 Charge_BatAdTmp = 0;
u32 Charge_BatAdSum = 0;

#define CHARGE_VOL_SET_FULL   1300   //1V

#define CHARGE_VOL_SET   1700   //2.4V

#define _XTAL_FREQ 16000000UL		//如果用16M晶振则改为16000000UL
void ChargePwmOut(unsigned char Duty)
{
	if(Duty == 0)
	{
		PWM0EN = 0;
		TRISB3 = 1;
	}
	else
	{
		if(!PWM0EN)
		{
			PWM0EN = 1;
		}
		CHRG_OUT_PUT();
		PWMD0L = Duty;
	}
}

void Charge_Check(void)                       // 0001 0001
{	
	ADCON0 = 0b00110001;   //AN12 0011 0001
	__delay_us(20);		//延时100us 	
	ADCON1 = 0b00000100;   //2.4V
	__delay_us(20);		//延时100us 	
	adresult_chagrge_vdd = AdcResultChk(VREF2_4V,CHARGE_AN12);
	// if(Charge_BatAdSumCnt < 8)
	// {
	// 	Charge_BatAdSumCnt++;
	// 	Charge_BatAdSum += Charge_BatAdTmp;
	// }
	// else
	// {
	// 	adresult_chagrge_vdd = Charge_BatAdTmp >> 3;
		
	// 	Charge_BatAdSum = 0;
	// 	Charge_BatAdSumCnt = 0;
	// }
	if (adresult_chagrge_vdd < CHARGE_VOL_SET_FULL) //拔电
	{
		if (!flag_charge_once)
		{
			app_charge.DisChargeCnt++;
			if(app_charge.DisChargeCnt >= MS(500))
			{
				flag_charge_once = 1;
				flag_discharge_once = 0;

				app_charge.DisChargeCnt = 0;
				app_charge.Charge = FLASE;
				app_charge.FullCharge = FLASE;
           		set_led_state(LED_INDEX_9 | LED_INDEX_10,LED_STATE_OFF);
				ChargePwmOut(0);
				app_process_set_work_state(WORK_STATE_POWEROFF);
			}
		}
	}
	else
	{
		app_charge.DisChargeCnt = 0;
	}
	if (adresult_chagrge_vdd > CHARGE_VOL_SET)
	{
		if (!flag_discharge_once)
		{
			if (app_charge.ChargeCnt <= MS(100))
			{
				app_charge.ChargeCnt++;
			}
			else
			{
				flag_charge_once = 0;
				flag_discharge_once = 1;

				app_charge.ChargeFullCnt = 0;
				app_charge.ChargeCnt = 0;
				app_charge.Charge = TURE;
				app_charge.FullCharge = 0;

				adresultvdd_back = 4096;
				app_process_set_work_state(WORK_STATE_CHARGING);
			}
		}
	}
	else
	{
		app_charge.ChargeCnt = 0;
	}
	if(app_charge.Charge)
	{
		if(app_charge.FullCharge || app_charge.ForceFullCharge)
		{
			if (charge_force_full_cnt <= (100UL * 3600 *15 + 100UL * 3600 *9)) //再过九个小时灯灭
			// if (charge_force_full_cnt <= (100UL * 60 *2 + 100UL * 60 *1)) //再过九个小时灯灭
			{
				charge_force_full_cnt++;
			}
			else
			{
				app_charge.flag_charge_force_full_24hour = 1;
			}
			if (app_charge.flag_charge_force_full_24hour)
			{
				CHRG_OUT_PUT_FULL();//关掉充电
			}
			else
			{
				if (app_charge.ForceFullCharge)
				{
					CHRG_OUT_PUT_FULL();//关掉充电
				}
				else
				{
					if (adresultvdd > Voltage4V05)  //如果小于4.05V复冲
					{
						ChargePwmOut(60);
					}
					else if(adresultvdd <= Voltage4V15)
					{
						CHRG_OUT_PUT_FULL();//关掉充电
					}
			}
			}
			
		}
		else
		{
			//当电池电压冲到4.1V，强制充满电
			// if (adresultvdd < Voltage4V1)
			// {
			// 	SysTime30minCnt++;
			// 	if (SysTime30minCnt > 100UL * 60 * 30)//30min
			// 	{
			// 		app_charge.FullCharge = 1;
			// 	}
			// }
			// else
			// {
			// 	SysTime30minCnt = 0;
			// }	
			if (adresultvdd <= Voltage4V1) //如果大于4.15V停止充电
			{
				if (++charge_full_cnt1 >= MINUTE(30))
				{
					CHRG_OUT_PUT_FULL();//关掉充电
					app_charge.FullCharge = TURE;
				}
			} 
			if (adresultvdd <= Voltage4V2) //如果大于4.2V停止充电
			{
				if (++charge_full_cnt >= 100)
				{
					CHRG_OUT_PUT_FULL();//关掉充电
					app_charge.FullCharge = TURE;
				}
			} 
			else
			{
				charge_full_cnt = 0;
			}
			//
			if (charge_force_full_cnt <= 100UL * 3600 *15)//100 * 3600 *15  
			// if (charge_force_full_cnt <= 100UL * 60 * 2)//100 * 3600 *15  
			{
				charge_force_full_cnt++;
			}
			else
			{
				app_charge.ForceFullCharge = TURE;
			}

			if (adresultvdd_back >= adresultvdd)
			{
				adresultvdd_back = adresultvdd;
			}
			
			
			if(adresultvdd_back < Voltage4V1)
			{
				ChargePwmOut(60);
			}
			else if(adresultvdd_back < Voltage4V0)
			{
				ChargePwmOut(60);
			}
			else if(adresultvdd_back < Voltage3V4)
			{
				ChargePwmOut(80);
			}
			else
			{
				ChargePwmOut(60);   //小于3.5V就是60%的pwm输出
			}
		}
	}
	else
	{
		charge_full_cnt1 = 0;
		charge_full_cnt = 0;
		charge_force_full_cnt = 0;
		app_charge.flag_charge_force_full_24hour = 0;
		app_charge.FullCharge = 0;
		app_charge.ForceFullCharge = 0;	
		app_charge.ChargeFullCnt = 0;
	}
}

void app_process_charge()
{
    Charge_Check(); 
}