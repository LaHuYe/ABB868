#ifndef __APP_LED__H_
#define __APP_LED__H_

#define SET 1
#define UNSET 0

#define ON 1
#define OFF 0

#define BIT(n) (1 << (n))

typedef enum
{
    LED_STATE_OFF = 0,
    LED_STATE_ON = !LED_STATE_OFF,
}led_state_t;

typedef enum
{
	LED_INDEX_NULL = 0,
	LED_INDEX_1    = BIT(0),    //第一盏灯
	LED_INDEX_2    = BIT(1),
	LED_INDEX_3    = BIT(2),
	LED_INDEX_4    = BIT(3),
	LED_INDEX_5    = BIT(4),
	LED_INDEX_6    = BIT(5),
	LED_INDEX_7    = BIT(6),
	LED_INDEX_8    = BIT(7),
	LED_INDEX_9    = BIT(8),
	LED_INDEX_10    = BIT(9),
	LED_INDEX_11    = BIT(10),
	LED_INDEX_12    = BIT(11),
	LED_INDEX_13    = BIT(12),
	LED_INDEX_14    = BIT(13),
	LED_INDEX_15    = BIT(14),
	LED_INDEX_16    = BIT(15),
	LED_INDEX_17    = BIT(16),
	LED_INDEX_BRUSH_LOW = LED_INDEX_15 | LED_INDEX_16 | LED_INDEX_11,
	LED_INDEX_BRUSH_MID = LED_INDEX_6 | LED_INDEX_7 | LED_INDEX_8,
	LED_INDEX_BRUSH_HIGH = LED_INDEX_BRUSH_LOW | LED_INDEX_BRUSH_MID,
	LED_INDEX_BRUSH_OFF = LED_INDEX_BRUSH_LOW | LED_INDEX_BRUSH_MID,
	LED_INDEX_18    = BIT(17),
	LED_INDEX_19    = BIT(18),
	LED_INDEX_ALL  = 0xff,
}led_index_t;

#define PWM_PERIOD 100  //决定呼吸灯的时长

#define MODE1_LED RA0
#define MODE2_LED RA1
#define MODE3_LED RA2
#define MODE4_LED RA3
#define MODEDIY_LED RA4

// #define PWM_PERIOD 130  //130 * 130 *100us  //更改此可以改变呼吸灯的持续时间
// #define  PWM_state   PWM2EN
// #define  PWM_sys_cnt    PWMD2L

void app_led_mode_set();
void app_led_water_mode_set();

void set_led_state(led_index_t index,led_state_t state);
void set_led_dirct_state(led_index_t index);
void process_led_remind_low_power(void);
void led_charge_pwm(void);
void process_led(void);

// typedef enum
// {
//     OFF = 0,
//     ON,
// } led_charge_state_t;

// typedef struct 
// {
//    unsigned char pwmNum;
//    unsigned char STATE_LED_pwmDuty;
//    led_charge_state_t led_charge_state;
// } led_charge_dis_t;



// extern unsigned int TimerLedBat;
extern unsigned int CntLedFlash;

// extern bit FlagbatLedTure;
void led_pwm();


// void LedLowBatFlash(void);
// void led_charge_run(void);
// void led_deinit(void);
// void set_work_led(work_state_t mode);
// void led_charge_pwm_dis();
 #endif