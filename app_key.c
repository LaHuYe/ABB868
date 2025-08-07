#include "main.h"

key_type_t key_brush_pwrtype = KEY_TYPE_IDLE;
key_type_t key_water_pwr_type = KEY_TYPE_IDLE;
key_type_t key_water_mode_type = KEY_TYPE_IDLE;
//key_type_t key_mode_type = KEY_TYPE_IDLE;

//bit flag_no_charge;

volatile uchar KeyPressCnt1 = 0;
volatile uchar KeyRelaxCnt1 = 0;

volatile uchar KeyPressCnt2 = 0;
volatile uchar KeyRelaxCnt2 = 0;

volatile uchar KeyPressCnt3 = 0;
volatile uchar KeyRelaxCnt3 = 0;

volatile uchar KeyContinuousTriggerCnt = 0; // <--- �������������������ļ�ʱ��

void key_brush_pwr_check()
{
	if(!IO_KEY_BRUSH_PWR)
	{
		// --- 1. ��ʼ������ʱ ---
		if(KeyPressCnt1 <= 30) // ��ʱ��0.3��
		{
			KeyPressCnt1++;
			if(KeyPressCnt1 == 30)  // ��һ�δﵽ0.3��
			{	
				key_brush_pwrtype = KEY_TYPE_LONG; // ������һ�γ����¼�
			}
		}
		// --- 2. ��������������ʱ ---
		else // KeyPressCnt1 > 30��˵���Ѿ����볤��״̬
		{
			KeyContinuousTriggerCnt++; // ��������������ʱ��

            // ÿ��20��*10ms = 200ms (0.2��) ����һ��
			if (KeyContinuousTriggerCnt >= 30) 
			{
				KeyContinuousTriggerCnt = 0; // �����ʱ����׼����һ�δ���
				key_brush_pwrtype = KEY_TYPE_LONG; // �ٴδ��������¼�
			}
		}

		if(KeyPressCnt1 >= 2)
		{
			KeyRelaxCnt1 = 0;
		}
		
		/*
		if(KeyPressCnt1 < 100)
		{
			KeyPressCnt1++;
		}
		if(KeyPressCnt1 >= 2)
		{
			KeyRelaxCnt1 = 0;
		}
		// if (KeyPressCnt1 == 50)   //diy
		// {
		// 	key_brush_pwrtype = KEY_TYPE_LONG;
		// }
		if(KeyPressCnt1 == 100)  //����1s
		{	
			KeyPressCnt1 = 101;
			//����ڶ�������û���£�������Ч
			key_brush_pwrtype = KEY_TYPE_LONG;
		}*/
	}
	else
	{
		if(KeyRelaxCnt1 < 2)
		{
			KeyRelaxCnt1++;
		}
		else
		{	
			if(KeyPressCnt1 >= 3 && KeyPressCnt1 <= 30)
			{
				//����
                key_brush_pwrtype = KEY_TYPE_SHORT;
			}
			KeyPressCnt1 = 0;
			 KeyContinuousTriggerCnt = 0; // ����ʱ������������������ʱ��
		}
	}
} 

void key_water_pwr_check()
{
	if(!IO_KEY_WATER_PWR)
	{
		if(KeyPressCnt2 < 200)
		{
			KeyPressCnt2++;
		}
		if(KeyPressCnt2 >= 2)
		{
			KeyRelaxCnt2 = 0;
		}
		// if (KeyPressCnt1 == 50)   //diy
		// {
		// 	key_water_pwr_type = KEY_TYPE_LONG;
		// }
		if(KeyPressCnt2 == 200)  //����5s
		{	
			KeyPressCnt2 = 201;
			//����ڶ�������û���£�������Ч
			key_water_pwr_type = KEY_TYPE_LONG_LONG;
		}
	}
	else
	{
		if(KeyRelaxCnt2 < 2)
		{
			KeyRelaxCnt2++;
		}
		else
		{	
			if(KeyPressCnt2 >= 3 && KeyPressCnt2 <= 50)
			{
				//����
                key_water_pwr_type = KEY_TYPE_SHORT;
			}
			KeyPressCnt2 = 0;
		}
	}
} 
void key_water_mode_check()
{
	if(!IO_KEY_WATER_MODE)
	{
		if(KeyPressCnt3 < 200)
		{
			KeyPressCnt3++;
		}
		if(KeyPressCnt3 >= 2)
		{
			KeyRelaxCnt3 = 0;
		}
		// if (KeyPressCnt1 == 50)   //diy
		// {
		// 	key_water_mode_type = KEY_TYPE_LONG;
		// }
		if(KeyPressCnt3 == 200)  //����5s
		{	
			KeyPressCnt3 = 201;
			//����ڶ�������û���£�������Ч
			key_water_mode_type = KEY_TYPE_LONG_LONG;
		}
	}
	else
	{
		if(KeyRelaxCnt3 < 2)
		{
			KeyRelaxCnt3++;
		}
		else
		{	
			if(KeyPressCnt3 >= 3 && KeyPressCnt3 <= 50)
			{
				//����
                key_water_mode_type = KEY_TYPE_SHORT;
			}
			KeyPressCnt3 = 0;
		}
	}
} 

void charge_or_lowBat_check()
{
    if (app_charge.Charge)  //���
    {
		// if (!flag_old_mode)
		// {
		// 	if (key_brush_pwrtype == KEY_TYPE_LONG_LONG)
		// 	{
		// 		if (app_timer.charge_to_oldmode_count)
		// 		{
		// 			flag_old_mode = 1;
		// 			app_process_set_work_state(WORK_STATE_OLD_MODE_RUN); 
		// 			app_process_set_mode_init();
		// 		}
		// 	}
		// }
		key_brush_pwrtype = KEY_TYPE_IDLE;
		key_water_pwr_type = KEY_TYPE_IDLE;
		key_water_mode_type = KEY_TYPE_IDLE;
    } 
    else if (app_charge.LowPower) //�͵�
    {
        if (key_brush_pwrtype || key_water_pwr_type || key_water_mode_type)
        {
			app_charge.LowLed = TURE;
			app_charge.LowLed_cnt = 0;
            key_brush_pwrtype = KEY_TYPE_IDLE;
			key_water_pwr_type = KEY_TYPE_IDLE;
			key_water_mode_type = KEY_TYPE_IDLE;
        }
    }

	// if (!app_charge.Charge)
	// {
	// 	if (flag_old_mode)
	// 	{
	// 		if (key_brush_pwrtype == KEY_TYPE_SHORT)
	// 		{
	// 			key_brush_pwrtype = KEY_TYPE_IDLE;
	// 			app_process_set_work_state(WORK_STATE_POWEROFF);
	// 		}
	// 	}
	// }
	
	
	// if(key_brush_pwrtype == KEY_TYPE_LONG_LONG)
	// {
	// 	key_brush_pwrtype = KEY_TYPE_IDLE;
	// }
}

void handle_key_pwr()
{
    switch (key_brush_pwrtype)
    {
    case KEY_TYPE_SHORT:
		// �����ǰ�ǡ�������״̬����ػ�
        if (app_work_state == WORK_STATE_WORKING)
        {
            if (water_work_state == WATER_WORK_STATE_POWEROFF && app_charge.Remind)
            {
                app_charge.flag_remind_delay_10s = 1;
                app_charge.remind_delay_10s_timer = 0;
            }
            app_process_set_work_state(WORK_STATE_POWEROFF);
        }
        // ����ǡ��ػ����򡰽���ʾLED��״̬���򿪻�����
        else if (app_work_state == WORK_STATE_POWEROFF || app_work_state == WORK_STATE_MODE_LED)
        {
            app_charge.flag_remind_delay_10s = 0;
            // ������ʹ�õ�ǰ�Ѿ�ѡ�õ�ģʽ
            app_process_set_work_state(WORK_STATE_WORKING); 
            app_process_set_mode_init(); // ��ʼ����������ͼ�ʱ��
        }
		/*
		if (app_work_state == WORK_STATE_POWEROFF || app_charge.flag_remind_delay_10s)
		{
			app_charge.flag_remind_delay_10s = 0;
			app_process_set_work_state(WORK_STATE_WORKING); 
			app_process_set_mode_init();
		}
		else if (app_work_state == WORK_STATE_WORKING)
		{
			// if (app_timer.work_updown_count)
			// {
			// 	app_process_set_mode_next();
			// }
	 		// else
			// {
				if (water_work_state == WATER_WORK_STATE_POWEROFF)
				{
					if (app_charge.Remind)
					{
						app_charge.flag_remind_delay_10s = 1;
						app_charge.remind_delay_10s_timer = 0;
					}
				}
				app_process_set_work_state(WORK_STATE_POWEROFF);
			// }
		}*/
        break;
		
    case KEY_TYPE_LONG:
		// if (app_work_state == WORK_STATE_WORKING)
		// {
		// 	if (water_work_state == WATER_WORK_STATE_POWEROFF)
		// 	{
		// 		if (app_charge.Remind)
		// 		{
		// 			app_charge.flag_remind_delay_10s = 1;
		// 			app_charge.remind_delay_10s_timer = 0;
		// 		}
		// 	}
		// 	app_process_set_work_state(WORK_STATE_POWEROFF);
		// }
        app_process_set_mode_next();
		// 2. ���ݵ�ǰ�Ĺ���״̬��������һ����ʲô
        if (app_work_state == WORK_STATE_WORKING)
        {
            // ����������ǿ���״̬����ôʲôҲ��������
            // ���������һ��PWM�����Զ������µĲ���������ֹͣ��
        }
        else // ���� WORK_STATE_POWEROFF �� WORK_STATE_MODE_LED ״̬
        {
            // ���ԭ���ǹػ������ʾLED��״̬��
            // ��ô�л�ģʽ�󣬽��루��ˢ�£�������ʾLED��״̬
            app_process_set_work_state(WORK_STATE_MODE_LED);
        }
        

        break;
    default:
        break;
    }
	key_brush_pwrtype = KEY_TYPE_IDLE;
}

void handle_key_water()
{
	switch (key_water_pwr_type)
    {
    case KEY_TYPE_SHORT:
		if (water_work_state == WATER_WORK_STATE_WORKING)
		{
			if (app_work_state == WORK_STATE_POWEROFF)
			{
				if (app_charge.Remind)
				{
					app_charge.flag_remind_delay_10s = 1;
					app_charge.remind_delay_10s_timer = 0;
				}
			}
			app_process_set_water_state(WATER_WORK_STATE_POWEROFF); 
		}
		else if (water_work_state == WATER_WORK_STATE_POWEROFF  || app_charge.flag_remind_delay_10s || water_work_state == WATER_WORK_STATE_MODE_LED)//����
		{
			app_charge.flag_remind_delay_10s = 0;
			app_led_water_mode_set();
			water_motor();
			app_process_set_water_state(WATER_WORK_STATE_WORKING);
		}
		key_water_pwr_type = KEY_TYPE_IDLE;
        break;
		
    default:
        break;
    }
	key_water_pwr_type = KEY_TYPE_IDLE;
	//----------------------water_mode---------------------------//
	switch (key_water_mode_type)
    {
    case KEY_TYPE_SHORT:
		if (water_work_state == WATER_WORK_STATE_WORKING)
		{
			app_process_set_water_mode_next();
			app_led_water_mode_set();
			water_motor();
		}
		else if (water_work_state == WATER_WORK_STATE_POWEROFF)
		{
			app_process_set_water_state(WATER_WORK_STATE_MODE_LED);
			app_led_water_mode_set();
		}
		else if (water_work_state == WATER_WORK_STATE_MODE_LED)
		{
			app_process_set_water_state(WATER_WORK_STATE_MODE_LED);
			app_process_set_water_mode_next();
			app_led_water_mode_set();
		}
		key_water_mode_type = KEY_TYPE_IDLE;
        break;
    case KEY_TYPE_LONG:
		// app_charge.flag_remind_delay_10s = 0;
		// app_process_set_water_state(WATER_WORK_STATE_POWEROFF);
        break;
    default:
        break;
    }
	key_water_mode_type = KEY_TYPE_IDLE;
}

void app_process_key()
{
	key_brush_pwr_check();
	key_water_pwr_check();
	key_water_mode_check();
    charge_or_lowBat_check();
    handle_key_pwr();
	handle_key_water();
}









