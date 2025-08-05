#ifndef __APP_WATER_PROCESS__H_
#define __APP_WATER_PROCESS__H_
#include "main.h"

typedef enum
{
    WATER_WORK_STATE_POWEROFF = 0,
    WATER_WORK_STATE_WORKING,
    WATER_WORK_STATE_CHARGING,
    // WORK_STATE_CHARGED,
    // WORK_STATE_REMIND_CHARGE,
    // WORK_STATE_POWEROFF_MODE_LED,
    WATER_WORK_STATE_MODE_LED,
    WATER_WORK_STATE_NULL
} water_work_state_t;

typedef enum
{
    WATER_WORK_MODE_IDEL = 0,
    WATER_WORK_MODE_ONE,
    WATER_WORK_MODE_TWO,
    WATER_WORK_MODE_THREE,
    WATER_WORK_MODE_FOUR,
    WATER_WORK_MODE_FIVE,
} water_mode_t;

typedef struct 
{
    unsigned char water_mode;
    unsigned char water_mode_out_put;
    unsigned int water_mode_count;
    unsigned char times;
    // unsigned char last_mode;
} app_process_water_mode_t;

extern volatile water_work_state_t water_work_state;
extern app_process_water_mode_t water_work_mode;

void app_process_set_water_state(water_work_state_t states);
void app_process_set_water_mode_init(void);
void app_process_set_water_mode_next(void);
void MotorWaterDrive(void);
void water_motor(void);
void app_water_process_work(void);
void water_turn_off();





#endif