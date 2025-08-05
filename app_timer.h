#ifndef __APP_TIMER__H_
#define __APP_TIMER__H_


typedef struct 
{
    unsigned int mode_select_time;
    unsigned long work_updown_count;
    unsigned int work_change_count;
    unsigned int charge_to_oldmode_count;
} app_timer_t;

typedef enum
{
    TIMING_3S = 300,
    TIMING_5S = 500,
    TIMING_8S = 800,
    TIMING_10S = 1000,
    TIMING_20S = 1000,
    TIMING_15S = 1500,
    TIMING_30S = 3000,
    TIMING_120S = 12000,
} TIMING_t;

#define ONE_SECOND 100UL
#define MS(n) ((n) / 10)
#define SECOND(n) (ONE_SECOND * (n))
#define MINUTE(n) (SECOND(60) * (n))


extern app_timer_t app_timer;
extern app_timer_t app_water_timer;
extern bit flag_save_old_mode;

void app_process_timing(void);
void charge_to_oldmode_timing();

void clear_count(void);
void timing_deint(void);
void update_work_timing(unsigned long count);
void update_change_updown_timing(unsigned int counts);

void work_chang_timing();
void oldmodeCountDownOff();
#endif