#ifndef __MAIN__H_
#define __MAIN__H_
#include <sc.h>
#include "app_key.h"
#include "app_adc.h"
#include "app_charge.h"
#include "app_motor.h"
#include "app_process.h"
#include "app_water_process.h"
#include "app_led.h"
#include "app_timer.h"

#define  uint8_t    unsigned char
#define  uint16_t   unsigned int
#define  u8    unsigned char
#define  u16   unsigned int
#define	 u32	unsigned long
#define	 uint32_t	unsigned long

#define  uchar    unsigned char
#define  uint     unsigned int
#define  bool   bit

//#define MS(n)  (n / 10)   //∫¡√Î
// #define S(n)  MS(n) * 1000   //√Î


#define  TURE   1
#define  FLASE  0

#define IO_LED1 RA0
#define IO_LED2 RA1
#define IO_LED3 RA2
#define IO_LED4 RA3
#define IO_LED5 RA4
#define IO_LED6 RA6

#define  IO_KEY_WATER_PWR       RB0
#define  IO_KEY_WATER_MODE      RB1
#define  IO_KEY_BRUSH_PWR       RB2
#define  CHARGE_FULL            RB3
#define  CHARGE_DET             RB4
#define  INA		            RB5
#define  INB                    RB6

#define  MotorWaterOn   (RA5=1)
#define  MotorWaterOff  (RA5=0)     



extern volatile bit Flag_10ms;
extern unsigned char CntSleep;
extern volatile unsigned char CntTime200us;
void GotoSleep(void);



#endif
