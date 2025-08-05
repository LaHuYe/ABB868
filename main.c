/*-------------------------------------------
/////////////////////////////////////////////////////////
//  Project: B98-K3 / 4 modes
//  Write by: yj
//  Date:     2024-03-22
//  Version:  V1
//  CheckSum:
//  MCU:      SC8P1711E/sop14
////////////////////////////////////////////////////////
//
-------------------------------------------*/

#include <sc.h>
#include "main.h"

volatile bit Flag_250us;
volatile bit Flag_1ms;
volatile bit Flag_10ms;
unsigned char Cnt250us = 0;
unsigned int Cnt10ms = 0;
unsigned int Cnt1ms = 0;
unsigned char CntSleep;

/////////////////////////////////////////// PortInit ///////////////////////////
void PortInit()
{
	TRISA = 0b00000000; // input=1,output=0
	PORTA = 0b00000000;
	WPUA = 0b00000000; // FULL引脚，充电为低，满电为高阻态
	IOCA = 0b00000000;

	TRISB = 0b00010111; // input=1,output=0
	PORTB = 0b00000000;
	ANSELH = 0b00010000;
	WPUB = 0b00000111;
	IOCB = 0b00000000; // wakeup,
}

/////////////////////////////////////////// TimerConfig ///////////////////////////
void Timer0Cofng()
{
	OPTION_REG = 0B00000000; // TMR0时钟 Fsys/4 4Mhz  预分频 /32  0.125Mhz 8us

	// 50us
	TMR0 = 165; // 215;//165;			//实测132为1ms

	T0IF = 0;
	T0IE = 1; // 使能Timer0溢出中断
}

/////////////////////////////////////////// TimerConfig ///////////////////////////
void Timer2Config()
{
	/////// timer2
	// PR2 = 24;					//=125*4*16/8M=1mS
	// TMR2IF = 0;
	// TMR2IE = 1;					//=

	// T2CON = 0X78;			//=
	// TMR2ON=1;
	/////// timer2
	PR2 = 250; // 设定Timer初始值，定时周期是250us=250
	TMR2IF = 0;
	TMR2IE = 1;			// 使能Timer2溢出中断
	T2CON = 0B00011100; // 开启Timer2,设置TMR2的预分频比为1:1，后分频1:2
}

/////////////////////////////////////////// AdcConfig ///////////////////////////
void AdcConfig()
{
	ADCON0 = 0b00111101; // AN15
	ADCON1 = 0b00000000; // VDD
}

// /////////////////////////////////////////// PwmConfig ///////////////////////////
void PwmConfig()
{
	PWMCON = 0B01100000; // PWM选择时钟源为Fosc/16   8M/800=10000,10000/64=156
	PWMTH = 0B00000000;	 // 周期的时钟分频在PWMCON选择
	PWMTL = 99;			 // 10K
}

// #define _XTAL_FREQ 8000000UL		//如果用16M晶振则改为16000000UL

void main(void)
{
	asm("nop");
	asm("clrwdt");
	OSCCON = 0X70; // 为8M/4=2M

	PortInit();
	Timer0Cofng();
	Timer2Config();
	AdcConfig();
	PwmConfig();

	asm("clrwdt");
	INTCON |= 0XC0; // 开启中断
	SWDTEN = 1;		// enable wdt

	app_process_set_work_state(WORK_STATE_POWEROFF);
	app_process_set_water_state(WATER_WORK_STATE_POWEROFF);

#if 0
	BatStates = 1;
	app_charge.Remind = 1;

#endif
	// FlagOldMode = 1;
	// app_work_state = WORK_STATE_WORKING;
	// // work_mode.mode = 3;
	// // led_pwm_ctrl(LED_INDEX_1,ON);
	// app_charge.FullCharge = 1;
	// app_charge.Charge = 1;
	//  BatStates = 2;
	//  app_work_state = WORK_STATE_WORKING;
	// app_charge.LowPower = 1;
	while (1)
	{
		asm("clrwdt");

		if (Flag_10ms)
		{
			Flag_10ms = 0;
			app_adc_process();
			app_process_charge();

			app_process_key();
			app_process_work();		  // brush
			app_water_process_work(); // water

			app_process_go_to_sleep();
			process_led_remind_low_power();
		}
	}
}

/////////////////////////////////////////// GotoSleep ///////////////////////////
void GotoSleep()
{
	if (IO_KEY_BRUSH_PWR && IO_KEY_WATER_PWR && IO_KEY_WATER_MODE)
	{

		CntSleep++;
		if (CntSleep >= 200)
		{
			CntSleep = 0;
			// ADC
			ADCON0 = 0b00000000;
			ADCON1 = 0b00000000;
			//
			SWDTEN = 0;
			WDTCON = 0x00;
			//
			GIE = 0;
			TRISB = 0b00010111; // input=1,output=0
			WPUB = 0b00000111;
			TRISA = 0b00000000; // input=1,output=0
			PORTA = 0b00000000;
			ChargePwmOut(0);
			//
			ANSELH = 0b00000000;
			//

			IOCA = 0b00000000;
			IOCB = 0b00010111; // wakeup,

			RAIE = 1;
			RBIE = 1;
			PEIE = 1;

			RAIF = 0; // clear flag
			PORTA;	  /// this must have
			RBIF = 0; // clear flag
			PORTB;	  /// this must have

			asm("clrwdt");
			asm("sleep"); /// goto sleep

			asm("nop"); /// wake up
			asm("nop");
			asm("nop");
			// ADC
			ADON = 1;
			//
			SWDTEN = 1;
			//  RB1 RB2 RA3
			IOCB = 0x00; // 0b 0000 0110
			IOCA = 0x00; // 0b 0000 1000
			//
			GIE = 1;

			SWDTEN = 1;
			AdcConfig();
			PortInit();
		}
	}
	else
	{
		CntSleep = 0;
	}
}

/***********************************************
//1ms
************************************************/
void interrupt Timer2_Isr(void)
{
	// RB5 = 1;
	//  if(T0IF)
	//  {
	//  	//RB5 = ~RB5;
	//  	T0IF = 0;

	// 	#if DEBUG
	// 	//TMR0 +=  256 - 5;
	// 	#endif
	// 	app_motor_pwm_out();
	// 	led_old_mode_pwm();
	// }
	if (PWMIF)
	{
		PWMIF = 0;
	}

	if (T0IF) // 50us中断
	{
		TMR0 = 165; // 215;//165;			//TMR0不能自动赋值
		T0IF = 0;
		Mode_control(); // 牙刷电机驱动
		led_charge_pwm();
		// Cnt250us++;
		//  if (Cnt250us >= 5)
		//  {
		//  	MotorWaterDrive();
		//  	Cnt250us = 0;
		//  	Flag_250us = 1;
		//  }
	}
	if (TMR2IF)
	{
		TMR2IF = 0;
		Cnt10ms++;
		Cnt1ms++;
		MotorWaterDrive();
		if (Cnt1ms == 4)
		{
			Cnt1ms = 0;
			process_led();
		}
		if (Cnt10ms >= 40) // 100 * 100 = 10000us = 10ms
		{
			Cnt10ms = 0;
			Flag_10ms = 1;
		}
	}
	if (RAIF)
	{
		RAIF = 0; //
		PORTA;	  //
	}
	if (RBIF)
	{
		RBIF = 0; //
		PORTB;	  //
	}
	// RB5 = 0;
}

/*
	长按按键老化的时候没有做低电处理
	充电的时候应该只关闭电机，不关闭灯

*/
