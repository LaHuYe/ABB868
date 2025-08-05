#ifndef __APP_PROCESS__H_
#define __APP_PROCESS__H_
#include "main.h"

#define SIZE_ARRAY(array)   (sizeof(array) / sizeof(array[0]))
extern bit flag_old_mode;

typedef enum
{
    WORK_STATE_POWEROFF = 0,
    WORK_STATE_WORKING,
    WORK_STATE_CHARGING,
    // WORK_STATE_CHARGED,
    // WORK_STATE_REMIND_CHARGE,
    // WORK_STATE_POWEROFF_MODE_LED,
    WORK_STATE_LOWBAT_LED,
    WORK_STATE_OLD_MODE_RUN,
    WORK_STATE_NULL
} work_state_t;





typedef void (*p_work_state_cb)(void);

typedef struct 
{
    work_state_t states;
    p_work_state_cb cb;
} work_state_action_t;


typedef enum
{
    WORK_MODE_IDEL = 0,
    WORK_MODE_ONE,
    WORK_MODE_TWO,
    WORK_MODE_THREE,
    // WORK_MODE_FOUR,
    // WORK_MODE_DIY,
} mode_t;

typedef struct 
{
    unsigned char mode;
    unsigned char mode_out_put;
    unsigned int work_mode_count;
    unsigned char times;
    // unsigned char last_mode;
} app_process_mode_t;




extern volatile work_state_t app_work_state;
extern app_process_mode_t work_mode;
extern unsigned char work_step;

#define BATT_MV_3000 3000
#define BATT_MV_3300 3380
#define BATT_MV_3340 3340
#define BATT_MV_3500 3500
#define BATT_MV_3600 3600
#define BATT_MV_3400 3400
#define BATT_MV_3430 3430
#define BATT_MV_3700 3700
#define BATT_MV_4000 4000
#define BATT_MV_4100 4100
#define BATT_MV_4200 4170

void app_process_set_work_state(work_state_t states);

void app_process_power_off(void);
void app_process_work(void);
void app_process_go_to_sleep(void);
void turn_off(void);





#endif