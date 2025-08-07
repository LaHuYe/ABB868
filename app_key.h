#ifndef __APP_KEY__H_
#define __APP_KEY__H_


typedef enum
{
    KEY_TYPE_IDLE = 0,
    KEY_TYPE_DOWN,
    KEY_TYPE_LONG,
    KEY_TYPE_LONG_LONG,
    KEY_TYPE_LONG_BIND,
    KEY_TYPE_SHORT,
    KEY_TYPE_LONG_RELEASE,
    KEY_TYPE_LONG_LONG_RELEASE,
} key_type_t;


typedef enum
{
    MODE_CHANGING,
    POWER_OFF,
} key_states_t;

typedef struct 
{
    key_states_t state;
} key_state_t;

extern key_state_t key_state;


extern volatile unsigned char KeyPressCnt1;
extern volatile unsigned char KeyRelaxCnt1;

extern volatile unsigned char KeyPressCnt2;
extern volatile unsigned char KeyRelaxCnt2;


void app_process_key(void);



#endif