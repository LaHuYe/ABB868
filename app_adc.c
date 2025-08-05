
#include "main.h"

volatile unsigned int	adresult;
volatile unsigned long adsum;
volatile unsigned int admin,admax;
volatile unsigned char adtimes;
volatile uint adresultvdd = 0;
volatile uint adresultvdd_back = 0;
volatile unsigned char BatStates = 5;
volatile unsigned char BatAdcCnt;
volatile unsigned char CntLowPowerOff;
volatile uint adresultmotor;
volatile uchar motor_lock_cnt = 0;
// unsigned char FlagOldMode;
unsigned char bat_remind_delay;

//u16 BatAdValue = 0;
u8	BatAdSumCnt = 0;
u16 BatAdTmp = 0;
u32 BatAdSum = 0;


#define _XTAL_FREQ 16000000UL		//如果用16M晶振则改为16000000UL


static uint AdcOneChk(uchar adch,uchar adldo)	//ADC单次采样
{
	volatile uchar i = 0;
	volatile uint ad_result;
	
	//ADCON1 = adldo;//0B00001100;						//左对齐，用2.4V做AD参考 
	__delay_us(20);		//延时100us 					//延时20us
	//ADCON0 = 0X41 | (adch << 2);	//16分频
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	GODONE = 1;						//开始转换

	while(GODONE)
	{
		asm("clrwdt");
		if(0 == (--i))
			return 0;				//转换超时
	}
	ad_result=ADRESH;
	ad_result= (ad_result<<4);
	ad_result +=(ADRESL>>4);	//计算12位AD值
	//ad_result=(ADRESH<<4)+(ADRESL>>4);	//计算12位AD值;
	return ad_result;
}

uint AdcResultChk(uchar adch,uchar adldo)//ADC多次采样
{
	volatile uchar i = 0;
	volatile uint ad_value;
	volatile uint ad_value_max;
	volatile uint ad_value_min;
	
	volatile uint ad_temp;
	
	ad_value = AdcOneChk(adch,adldo);
    return ad_value;
	
	// ad_value_max = ad_value;//获取最大值
	// ad_value_min = ad_value;//获取最小值
	// ad_temp = ad_value;
	// for(i = 9;i > 0;i--)
	// {
	// 	ad_value = AdcOneChk(adch,adldo);
	// 	if(ad_value > ad_value_max)
	// 	{
	// 		ad_temp += ad_value_max;
	// 		ad_value_max = ad_value;
	// 	}
	// 	else if(ad_value < ad_value_min)
	// 	{
	// 		ad_temp += ad_value_min;
	// 		ad_value_min = ad_value;
	// 	}
	// 	else
	// 	{
	// 		ad_temp += ad_value;
	// 	}
	// }

	// ad_temp -= ad_value_max;
	// ad_temp -= ad_value_min;

	// return (ad_temp>>3);	//平均值
}


//bit flag_charge_force_full;
bit flag_charge_force_full_24hour;
unsigned long charge_force_full_cnt;
void app_adc_bat_voltage_check()
{
    ADCON0 = 0b00111101;   //AN15
    __delay_us(20);		//延时100us 	
    ADCON1 = 0b00000000;   //VDD
    __delay_us(20);		//延时100us 

    adresultvdd = AdcResultChk(ANVdd,VREFVdd);
    // BatAdTmp = AdcResultChk(ANVdd,VREFVdd);
    // if(BatAdSumCnt < 32)
	// {
	// 	BatAdSumCnt++;
	// 	BatAdSum += BatAdTmp;
	// }
	// else
	// {
	// 	adresultvdd = BatAdSum >> 5;
		
	// 	BatAdSum = 0;
	// 	BatAdSumCnt = 0;
	// }

    if(app_charge.Charge)		//充电
    {
        if(adresultvdd < Voltage3V2)      //3.0V  //// / 1.2V/3.0*4096=1638
        {
            CntLowPowerOff++;
            if(CntLowPowerOff > 250)
            {
                CntLowPowerOff = 0;
                app_charge.Remind = 0;
                app_charge.LowLed = 0;
                app_charge.LowPower = 0;
            }		 
        }
        else
        {
            CntLowPowerOff = 0;
        }
    }           //用电
    else
    {
        if(adresultvdd > Voltage2V9 - 20)      //3.0V  //// / 1.2V/3.0*4096=1638
        {
            CntLowPowerOff++;
            if(CntLowPowerOff > 100)
            {
                CntLowPowerOff = 0;
                app_charge.Remind = FLASE;

                if (!app_charge.LowPower)
                {
                    app_process_set_work_state(WORK_STATE_POWEROFF);
                    app_process_set_water_state(WATER_WORK_STATE_POWEROFF);
                    app_charge.LowPower = 1;
                    app_charge.LowLed = TURE;
                    app_charge.LowLed_cnt = 0;
                }
            }		 
        }
        else
        {
            CntLowPowerOff = 0;
        }

        if(adresultvdd > Voltage3V4 -15)
        {
            bat_remind_delay++;
            if(bat_remind_delay > 100)
            {
                bat_remind_delay = 0;
                app_charge.Remind = 1;
            }
        }
        else
        {
            bat_remind_delay = 0;
        }
        
    }
}		

void MotorAdcIChk(void)
{
    // if (app_work_state == WORK_STATE_WORKING)
    // {
        adresultmotor = AdcResultChk(ANI_DET,VREF2_0V);
        {
            if(adresultmotor > MOTORIOVER)
            {
                if(motor_lock_cnt <= MS(200))
                {
                    motor_lock_cnt++;
                }
                else
                {
                    app_process_set_work_state(WORK_STATE_POWEROFF);
                }
            }
            else
            {
                motor_lock_cnt = 0;
                // if(motor_lock_cnt > 20)
                // {
                // 	motor_lock_cnt--;
                // }
                // 	else
                // 	{
                // 		motor_lock_cnt = 0;
                // 	}
            }
        }
    // }
}

void app_adc_process()
{
    //MotorAdcIChk();
    app_adc_bat_voltage_check();
}
























// volatile unsigned int adresultmotor;
// volatile unsigned int adresultvdd;
// volatile unsigned long adsum;
// volatile unsigned int admin,admax;
// volatile unsigned char adtimes;

// volatile unsigned char BatStates = 4;

// volatile unsigned char CntLowPowerOff;


// volatile unsigned char BatAdcCnt;


// unsigned char CntOverCurrent;
// volatile unsigned char Mode2ADCDelay;

// bool FlagAdcSwitch;
// bool FlagAdcVddOver;
// bool FlagAdcMotorOver;


// bool FlagCharge = 0;
// bool FlagAdcSwitch=0;
// bool FlagAdcMotorOver;
// bool FlagAdcVddOver;
// bool FlagLowPower;
// bool FlagFullCharge;
// bool FlagLowLed = 0;;


// void AdcChkVdd()
// {
// 	volatile unsigned int ad_temp;	

// 	GODONE = 1;						//开始转换

// 	unsigned char i = 0;
// 	while(GODONE)
// 	{
// 		if(0 == (--i))
// 		return;
// 	}
// 	ad_temp=ADRESH;
// 	ad_temp= (ad_temp<<4);
// 	ad_temp +=(ADRESL>>4);	//计算12位AD值
	
// 	if(0 == admax)
// 	{
// 		admax = ad_temp;
// 		admin = ad_temp;
// 	}
// 	else if(ad_temp > admax)
// 		admax = ad_temp;				//AD采样最大值
// 	else if(ad_temp < admin)
// 		admin = ad_temp;				//AD采样最小值
	
// 	adsum += ad_temp;
// 	//Flag10ms_Adc=1;
// 	if(++adtimes >= 10)
// 	{
// 		adsum -= admax;
// 		if(adsum >= admin)	adsum -= admin;
// 		else	adsum = 0;
// 		if(FlagAdcSwitch==0)
// 		{
// 			adresultvdd = (unsigned int)(adsum >> 3);		//8次平均值作为最终结果	
// 			FlagAdcVddOver=TURE;
// 			ADCON0 = 0b00000001;   //AN0
// 			ADCON1 = 0b00000101;   //2.0V
// 			//需要转换ADC始终频率
// 				// ADCON0 = 0xc0;  //改变时钟分频，//转换通道检测AN0， 1100 0001
// 				// LDOEN = 1;       //设置参考电压LDO
// 			FlagAdcSwitch=1;		  
// 		}
// 		else
// 		{
// 			adresultmotor = (unsigned int)(adsum >> 3);		//8次平均值作为最终结果	
// 			FlagAdcMotorOver=TURE;
// 			ADCON0 = 0b00111101;   //AN15
//           	ADCON1 = 0b00000000;   //VDD
// 			//需要转换ADC始终频率
// 			// ADCON0 = 0x7d;  //改变时钟分频，//转换通道检测基准电压 0111 1101
// 			// LDOEN = 0;       //设置参考电压VDD
// 		  	FlagAdcSwitch=0;		  
// 		}										
// 		adsum = 0;
// 		admin = 0;
// 		admax = 0;
// 		adtimes = 0;
// 	}
// }

// bool get_bat_low_state()
// {
//     return FlagLowLed;
// }
// void clear_bat_low_state()
// {
//     FlagLowLed = FLASE;
// }

// void voltage_check()  //低压检测
// {
// 	if(FlagAdcVddOver==TURE)
//     {
// 		FlagAdcVddOver=FLASE;
	   
// 		if(FlagCharge)		//充电
// 		{
// 			// if(adresultvdd < Voltage3V3)      //3.0V  //// / 1.2V/3.0*4096=1638
// 			// {
// 			// 	CntLowPowerOff++;
// 			// 	if(CntLowPowerOff > 2)
// 			// 	{
// 			// 		CntLowPowerOff = 0;
// 			// 		//if(!FlagLowPower)
// 			// 		//{
// 			// 			//	FlagLowLed = 1;
// 			// 		//}
// 			// 		FlagLowPower = FLASE;
					
// 			// 		//BatStates = 1;
// 			// 	}		 
// 			// }
// 			// else
// 			// {
// 			// 	CntLowPowerOff = 0;
// 			// }
			
// 			if(BatStates == 1)
// 			{
// 				if(adresultvdd < Voltage3V4)  
// 				{
// 					BatAdcCnt++;
// 					if(BatAdcCnt > 2)
// 					{
// 						BatAdcCnt = 0;
// 						BatStates = 2; //大于3.3V

// 						if(!FlagLowPower)
// 						//{
// 							//	FlagLowLed = 1;
// 						//}
// 						FlagLowPower = FLASE;
// 						FlagLowLed = FLASE;
// 						//BatStates = 1;
// 					}
// 				}
// 				else
// 				{
// 					BatAdcCnt = 0;
// 				}
// 			}
// 			else if(BatStates == 2)
// 			{
// 				if(adresultvdd < Voltage3V7)	
// 				{
// 					BatAdcCnt++;
// 					if(BatAdcCnt > 2)
// 					{
// 						BatAdcCnt = 0;
// 						BatStates = 3;	//大于3.7V
// 					}
// 				}
// 				else
// 				{
// 					BatAdcCnt = 0;
// 				}
// 			}
// 			else if(BatStates == 3)
// 			{
// 				if(adresultvdd < Voltage3V9)
// 				{
// 					BatAdcCnt++;
// 					if(BatAdcCnt > 2)
// 					{
// 						BatAdcCnt = 0;
// 						BatStates = 4;	//大于3.9V
// 					}
// 				}
// 				else
// 				{
// 					BatAdcCnt = 0;
// 				}
// 			}
// 		}
// 		else    //用电
// 		{
// 			if(adresultvdd > Voltage3V0)      //3.0V  //// / 1.2V/3.0*4096=1638
// 			{
// 				CntLowPowerOff++;
// 				if(CntLowPowerOff > 2)
// 				{
// 					CntLowPowerOff = 0;
// 					if(!FlagLowPower)
// 					{
// 						FlagLowLed = TURE;

// 						// led_deinit();
// 						// motor_PwmOut(0);
// 						// CntLedFlash = 0;
// 						set_work_state(WORK_STATE_LOWBAT_LED);
// 					}
// 					FlagLowPower = TURE;
// 					BatStates = 1;
// 					set_work_state(WORK_STATE_POWEROFF);
// 					// if(!FlagLowPower)
// 					// {
// 					// 	FlagLowLed = TURE;

// 					// 	// led_deinit();
// 					// 	// motor_PwmOut(0);
// 					// 	// CntLedFlash = 0;
// 					// 	// set_work_state(WORK_STATE_LOWBAT_LED);
// 					// }
// 					// FlagLowPower = TURE;
					
// 				}		 
// 			}
// 			else
// 			{
// 				CntLowPowerOff = 0;
// 			}
			
// 			if(BatStates == 4)		         //3.9~4.2V
// 			{
// 				if(adresultvdd > Voltage3V9)  
// 				{
// 					BatAdcCnt++;
// 					if(BatAdcCnt > 2)
// 					{
// 						BatAdcCnt = 0;
// 						BatStates = 3; 
// 					}
// 				}
// 				else
// 				{
// 					BatAdcCnt = 0;
// 				}
// 			}
// 			else if(BatStates == 3)			//3.6~3.9V
// 			{
// 				if(adresultvdd > Voltage3V6)
// 				{
// 					BatAdcCnt++;
// 					if(BatAdcCnt > 2)
// 					{
// 						BatAdcCnt = 0;
// 						BatStates = 2;
// 					}
// 				}
// 				else
// 				{
// 					BatAdcCnt = 0;
// 				}
// 			}
// 			else if(BatStates == 2)			//3.3~3.6V
// 			{
// 				if(adresultvdd > Voltage3V3)
// 				{
// 					BatAdcCnt++;
// 					if(BatAdcCnt > 2)
// 					{
// 						BatAdcCnt = 0;
// 						BatStates = 1;     //小于3.3V

// 						// if(!FlagLowPower)
// 						// {
// 						// 	FlagLowLed = TURE;

// 						// 	// led_deinit();
// 						// 	// motor_PwmOut(0);
// 						// 	// CntLedFlash = 0;
// 						// 	set_work_state(WORK_STATE_LOWBAT_LED);
// 						// }
// 						// FlagLowPower = TURE;
// 						// BatStates = 1;
// 					}
// 				}
// 				else
// 				{
// 					BatAdcCnt = 0;
// 				}
// 			}
// 			// else if(BatStates == 1)			//已经小于3.0
// 			// {
// 			// 	if(adresultvdd > Voltage3V0)
// 			// 	{
// 			// 		BatAdcCnt++;
// 			// 		if(BatAdcCnt > 2)
// 			// 		{
// 			// 			BatAdcCnt = 0;

// 			// 			if(!FlagLowPower)
// 			// 			{
// 			// 				FlagLowLed = TURE;

// 			// 				// led_deinit();
// 			// 				// motor_PwmOut(0);
// 			// 				// CntLedFlash = 0;
// 			// 				set_work_state(WORK_STATE_LOWBAT_LED);
// 			// 			}
// 			// 			FlagLowPower = TURE;
// 			// 			BatStates = 1;
// 			// 		}
// 			// 	}
// 			// 	else
// 			// 	{
// 			// 		BatAdcCnt = 0;
// 			// 	}
// 			// }
// 		}
// 	}		
// }


// void MotorOverCurrentProtect() //电压过大保护
// {
// //   if(States==2)
// //   {
// 	if(FlagAdcMotorOver)
// 	{
// 		FlagAdcMotorOver=FLASE;
// 		if(adresultmotor>ProtectSet) //电压  todo...
// 		{
// 			if (ModeDuty)
// 			{
// 				Mode2ADCDelay++;
// 				if (Mode2ADCDelay >= 1)
// 				{
// 					Mode2ADCDelay = 0;
// 					CntOverCurrent++;
// 				}
// 			} 
// 			else
// 			{

// 			}
				
// 			if(CntOverCurrent>2)
// 			{
// 				CntOverCurrent=0; 
// 				set_work_state(WORK_STATE_POWEROFF);
// 			}				
// 	  	}
// 		else
// 		{
// 			//CntOverCurrent=0;			
// 		}			
// 	}	
//   //}	
// }

// void process_adc_check()
// {
// 	AdcChkVdd();
// 	voltage_check();
// 	MotorOverCurrentProtect();
// }

