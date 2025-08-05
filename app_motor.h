
#ifndef __APP_MOTOR__H_
#define __APP_MOTOR__H_
#include "main.h"

#define HZ  20000 //1000 000 / 50 = 20000

#define MOTOR_155Hz 127		//����
#define MOTOR_155Hz_Duty_100  102 / 2	//ռ�ձ� = MOTOR_170Hz_Duty / MOTOR_170Hz


// #define MOTOR_285Hz_Duty_5  4 / 2	//ռ�ձ� = MOTOR_170Hz_Duty / MOTOR_170Hz

#define MOTOR_200Hz 98		//����
#define MOTOR_200Hz_Duty_90  78 / 2	//ռ�ձ� = MOTOR_170Hz_Duty / MOTOR_170Hz

#define MOTOR_260Hz 75		//����
#define MOTOR_260Hz_Duty_70  60	/2 //ռ�ձ� = MOTOR_170Hz_Duty / MOTOR_170Hz

typedef struct
{
	unsigned char Period;   //specific frequency calculate: (1 /(Period * interrupt_time))     

	unsigned char DutyLow; //the lower duty,  duty calculate :  DutyLow/Period
							
	unsigned char DutyHigh;  //the higher duty     

    //-----warning��DutyLow + DutyHigh <= Period-----

	unsigned char normal_duty_change_value; //determine the mid change value

	unsigned char mid_duty_change_value;

	unsigned char time;  //the best value:0

	unsigned char mid_duty; //during DutyLow and DutyHigh
		
	

} MOTOR_InitTypeDef; //if select MOTOR_SOUND_WAVE ,Ensure that DutyLow and DutyHigh is the same

typedef struct 
{
   // unsigned char EmptyHigh;
    unsigned int DutyLow;
    unsigned int Period;
} app_motor_pwm_pram_t;
extern app_motor_pwm_pram_t app_motor_pwm_pram;

extern MOTOR_InitTypeDef MOTOR_InitStruct;

extern unsigned char DutyLow;
extern unsigned char DutyHigh;

void MotorLoop(void);
void Mode_control(void);	//50us
void app_process_motor_duty(void);

void app_process_set_mode_init(void);
void app_process_set_mode_next(void);

#endif
