#ifndef __ADC__H_
#define __ADC__H_

#define Voltage2V9     1694    //3.0V   //3.4V/1445 voltage more high,
#define Voltage3V0     1638    //3.0V   //3.4V/1445 voltage more high,
                                        //the value more small //1.2/3.0*4095
#define Voltage3V2     1535    //3.3V   //1.2/3.3*4095                                         
#define Voltage3V3     1489    //3.3V   //1.2/3.3*4095
#define Voltage3V4     1445    //3.3V   //1.2/3.4*4095
#define Voltage3V5     1404    //3.3V   //1.2/3.4*4095
#define Voltage3V6     1365    //3.3V   //1.2/3.6*4095
#define Voltage3V7     1328    //3.3V   //1.2/3.7*4095
#define Voltage3V8     1293    //3.3V   //1.2/3.7*4095
#define Voltage3V9     1260    //3.3V   //1.2/3.9*4095
#define Voltage4V0     1228    //3.3V   //1.2/3.9*4095
#define Voltage4V05    1213       //4.1V   //1.2/4.1*
#define Voltage4V1     1199       //4.1V   //1.2/4.1*
#define Voltage4V15    1180
#define Voltage4V2     1170       //4.2V   //1.2/4.2*4095

#define 	ANI_DET			13		//
#define 	ANVdd			15		//1.2v
#define 	VREFVdd			0
#define 	CHARGE_AN12			12
#define 	VREF2_4V		4
#define 	VREF2_0V		5

#define 	MOTORIOVER		72//62		//3A  0.01R  VERF2V  

#define POWER_RATIO (4095UL*1200)

#define BATT_MV_3400 3400
#define BATT_ADC_VALUE(vdd) (POWER_RATIO / vdd)

#define IS_BATT_VOLTAGE_LOWER_THAN(vdd) (adresultvdd > BATT_ADC_VALUE(vdd))


extern volatile unsigned char BatStates;
extern volatile unsigned char motor_lock_cnt;
//extern unsigned char FlagOldMode;


unsigned int AdcResultChk(unsigned char adch,unsigned char adldo);//ADC多次采样
void app_adc_process();
void MotorAdcIChk(void);

extern volatile unsigned int adresultvdd;
extern volatile unsigned int adresultvdd_back;


// #define Voltage3V0     1638    //3.0V   //3.4V/1445 voltage more high,
//                                         //the value more small //1.2/3.0*4095
// #define Voltage3V3     1489    //3.3V   //1.2/3.3*4095
// #define Voltage3V4     1445    //3.3V   //1.2/3.4*4095
// #define Voltage3V5     1404    //3.3V   //1.2/3.4*4095
// #define Voltage3V6     1365    //3.3V   //1.2/3.6*4095
// #define Voltage3V7     1328    //3.3V   //1.2/3.7*4095
// #define Voltage3V8     1293    //3.3V   //1.2/3.7*4095
// #define Voltage3V9     1260    //3.3V   //1.2/3.9*4095
// #define Voltage4V0     1228    //3.3V   //1.2/3.9*4095
// #define Voltage4V1     1200    //3.3V   //1.2/4.0*4095

// #define ProtectSet 287

// #define bool bit
// extern bool FlagLowLed;
// extern volatile unsigned char BatStates;

// bool get_adc_vdd_state(void);
// bool get_adc_motor_state(void);
// bool get_bat_low_state(void);
// void clear_bat_low_state(void);
// void process_adc_check(void);

#endif