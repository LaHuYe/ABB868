opt subtitle "Microchip Technology Omniscient Code Generator v1.45 (PRO mode) build 201711160504"

opt pagewidth 120

	opt pm

	processor	SC8P1712E
opt include "E:\Software\SCMCU_IDE_V2.00.16\data\include\sc8p1712e.cgen.inc"
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
	FNCALL	_main,_AdcConfig
	FNCALL	_main,_PortInit
	FNCALL	_main,_PwmConfig
	FNCALL	_main,_Timer0Cofng
	FNCALL	_main,_Timer2Config
	FNCALL	_main,_app_adc_process
	FNCALL	_main,_app_process_charge
	FNCALL	_main,_app_process_go_to_sleep
	FNCALL	_main,_app_process_key
	FNCALL	_main,_app_process_set_water_state
	FNCALL	_main,_app_process_set_work_state
	FNCALL	_main,_app_process_work
	FNCALL	_main,_app_water_process_work
	FNCALL	_main,_process_led_remind_low_power
	FNCALL	_process_led_remind_low_power,_app_process_set_water_state
	FNCALL	_process_led_remind_low_power,_app_process_set_work_state
	FNCALL	_process_led_remind_low_power,_set_led_dirct_state
	FNCALL	_process_led_remind_low_power,_set_led_state
	FNCALL	_app_water_process_work,_app_process_water_mdoe_led
	FNCALL	_app_water_process_work,_app_process_water_working
	FNCALL	_app_water_process_work,_app_process_water_workoff
	FNCALL	_app_process_water_workoff,_water_turn_off
	FNCALL	_water_turn_off,_set_led_state
	FNCALL	_app_process_water_working,_app_process_set_water_state
	FNCALL	_app_process_water_mdoe_led,_app_process_set_water_state
	FNCALL	_app_process_work,_app_process_charing
	FNCALL	_app_process_work,_app_process_power_off
	FNCALL	_app_process_work,_app_process_working
	FNCALL	_app_process_working,_app_process_set_work_state
	FNCALL	_app_process_working,_work_chang_timing
	FNCALL	_app_process_charing,_app_process_power_off
	FNCALL	_app_process_charing,_app_process_set_water_state
	FNCALL	_app_process_power_off,_set_led_state
	FNCALL	_app_process_key,_charge_or_lowBat_check
	FNCALL	_app_process_key,_handle_key_pwr
	FNCALL	_app_process_key,_handle_key_water
	FNCALL	_app_process_key,_key_brush_pwr_check
	FNCALL	_app_process_key,_key_water_mode_check
	FNCALL	_app_process_key,_key_water_pwr_check
	FNCALL	_handle_key_water,_app_led_water_mode_set
	FNCALL	_handle_key_water,_app_process_set_water_mode_next
	FNCALL	_handle_key_water,_app_process_set_water_state
	FNCALL	_handle_key_water,_water_motor
	FNCALL	_app_led_water_mode_set,_set_led_state
	FNCALL	_handle_key_pwr,_app_process_set_mode_init
	FNCALL	_handle_key_pwr,_app_process_set_mode_next
	FNCALL	_handle_key_pwr,_app_process_set_work_state
	FNCALL	_app_process_set_mode_next,_app_led_mode_set
	FNCALL	_app_process_set_mode_next,_app_process_motor_duty
	FNCALL	_app_process_set_mode_init,_app_led_mode_set
	FNCALL	_app_process_set_mode_init,_app_process_motor_duty
	FNCALL	_app_led_mode_set,_set_led_state
	FNCALL	_app_process_go_to_sleep,_GotoSleep
	FNCALL	_GotoSleep,_AdcConfig
	FNCALL	_GotoSleep,_ChargePwmOut
	FNCALL	_GotoSleep,_PortInit
	FNCALL	_app_process_charge,_Charge_Check
	FNCALL	_Charge_Check,_AdcResultChk
	FNCALL	_Charge_Check,_ChargePwmOut
	FNCALL	_Charge_Check,_app_process_set_work_state
	FNCALL	_Charge_Check,_set_led_state
	FNCALL	_app_adc_process,_app_adc_bat_voltage_check
	FNCALL	_app_adc_bat_voltage_check,_AdcResultChk
	FNCALL	_app_adc_bat_voltage_check,_app_process_set_water_state
	FNCALL	_app_adc_bat_voltage_check,_app_process_set_work_state
	FNCALL	_AdcResultChk,_AdcOneChk
	FNROOT	_main
	FNCALL	_Timer2_Isr,_Mode_control
	FNCALL	_Timer2_Isr,_MotorWaterDrive
	FNCALL	_Timer2_Isr,_led_charge_pwm
	FNCALL	_Timer2_Isr,_process_led
	FNCALL	_led_charge_pwm,i1_set_led_state
	FNCALL	intlevel1,_Timer2_Isr
	global	intlevel1
	FNROOT	intlevel1
	global	_water_work_mode
	global	_work_mode
	global	_BatStates
psect	idataBANK0,class=CODE,space=0,delta=2,noexec
global __pidataBANK0
__pidataBANK0:
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
	line	8

;initializer for _water_work_mode
	retlw	03h
	retlw	low(0)
	retlw	low(0)
	retlw	high(0)

	retlw	low(0)
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
	line	7

;initializer for _work_mode
	retlw	02h
	retlw	low(0)
	retlw	low(0)
	retlw	high(0)

	retlw	low(0)
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
	line	10

;initializer for _BatStates
	retlw	05h
	global	_Flag_10ms
	global	_Flag_1ms
	global	_Flag_250us
	global	_is_charge_pwm
	global	_PWM_dir
	global	_flag_discharge_once
	global	_flag_charge_once
	global	_led_index
	global	_water_mode_led_cnt
	global	_motor_fix_cnt
	global	_pwm_timer
	global	_PWM_Cnt
	global	_PWM_Duty
	global	_CntLedFlash
	global	_KeyPressCnt3
	global	_KeyPressCnt2
	global	_KeyPressCnt1
	global	_adresult_chagrge_vdd
	global	_adresultvdd_back
	global	_adresultvdd
	global	_MotorWaterDuty
	global	_CntWaterDrive
	global	_water_work_step
	global	_dead_area_b2
	global	_dead_area_b1
	global	_low_b
	global	_dead_area1
	global	_low_a
	global	_work_step
	global	_CntSleep
	global	_step
	global	_KeyRelaxCnt3
	global	_KeyRelaxCnt2
	global	_KeyRelaxCnt1
	global	_key_water_mode_type
	global	_key_water_pwr_type
	global	_key_brush_pwrtype
	global	_charge_full_cnt
	global	_bat_remind_delay
	global	_motor_lock_cnt
	global	_CntLowPowerOff
	global	_BatAdcCnt
	global	_adtimes
	global	_app_charge
	global	_app_timer
	global	_MOTOR_InitStruct
	global	_charge_force_full_cnt
	global	_adsum
	global	_Cnt1ms
	global	_Cnt10ms
	global	_adresultmotor
	global	_admax
	global	_admin
	global	_adresult
	global	_water_work_state
psect	nvBANK0,class=BANK0,space=1,noexec
global __pnvBANK0
__pnvBANK0:
_water_work_state:
       ds      1

	global	_app_work_state
_app_work_state:
       ds      1

	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PWMCON
_PWMCON	set	27
	global	_PWMTH
_PWMTH	set	26
	global	_PWMTL
_PWMTL	set	25
	global	_PWMD0L
_PWMD0L	set	22
	global	_T2CON
_T2CON	set	18
	global	_INTCON
_INTCON	set	11
	global	_IOCA
_IOCA	set	9
	global	_WPUA
_WPUA	set	7
	global	_PORTB
_PORTB	set	6
	global	_PORTA
_PORTA	set	5
	global	_TMR0
_TMR0	set	1
	global	_ADON
_ADON	set	248
	global	_GODONE
_GODONE	set	249
	global	_PWM0EN
_PWM0EN	set	216
	global	_TMR2IF
_TMR2IF	set	97
	global	_PWMIF
_PWMIF	set	98
	global	_RAIF
_RAIF	set	99
	global	_RBIF
_RBIF	set	88
	global	_T0IF
_T0IF	set	90
	global	_RBIE
_RBIE	set	91
	global	_T0IE
_T0IE	set	93
	global	_PEIE
_PEIE	set	94
	global	_GIE
_GIE	set	95
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RA2
_RA2	set	42
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_RA6
_RA6	set	46
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_IOCB
_IOCB	set	150
	global	_WPUB
_WPUB	set	149
	global	_ANSELH
_ANSELH	set	148
	global	_PR2
_PR2	set	146
	global	_OSCCON
_OSCCON	set	143
	global	_WDTCON
_WDTCON	set	136
	global	_TRISB
_TRISB	set	134
	global	_TRISA
_TRISA	set	133
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_TMR2IE
_TMR2IE	set	1121
	global	_RAIE
_RAIE	set	1123
	global	_SWDTEN
_SWDTEN	set	1088
	global	_TRISB3
_TRISB3	set	1075
; #config settings
	file	"SC8P171XE_IO.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bitbssCOMMON,class=COMMON,bit,space=1,noexec
global __pbitbssCOMMON
__pbitbssCOMMON:
_Flag_10ms:
       ds      1

_Flag_1ms:
       ds      1

_Flag_250us:
       ds      1

_is_charge_pwm:
       ds      1

_PWM_dir:
       ds      1

_flag_discharge_once:
       ds      1

_flag_charge_once:
       ds      1

psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_led_index:
       ds      4

_water_mode_led_cnt:
       ds      2

_motor_fix_cnt:
       ds      2

_pwm_timer:
       ds      2

_PWM_Cnt:
       ds      2

_PWM_Duty:
       ds      2

_CntLedFlash:
       ds      2

_KeyPressCnt3:
       ds      2

_KeyPressCnt2:
       ds      2

_KeyPressCnt1:
       ds      2

_adresult_chagrge_vdd:
       ds      2

_adresultvdd_back:
       ds      2

_adresultvdd:
       ds      2

_MotorWaterDuty:
       ds      1

_CntWaterDrive:
       ds      1

_water_work_step:
       ds      1

_dead_area_b2:
       ds      1

_dead_area_b1:
       ds      1

_low_b:
       ds      1

_dead_area1:
       ds      1

_low_a:
       ds      1

_work_step:
       ds      1

_CntSleep:
       ds      1

_step:
       ds      1

_KeyRelaxCnt3:
       ds      1

_KeyRelaxCnt2:
       ds      1

_KeyRelaxCnt1:
       ds      1

_key_water_mode_type:
       ds      1

_key_water_pwr_type:
       ds      1

_key_brush_pwrtype:
       ds      1

_charge_full_cnt:
       ds      1

_bat_remind_delay:
       ds      1

_motor_lock_cnt:
       ds      1

_CntLowPowerOff:
       ds      1

_BatAdcCnt:
       ds      1

_adtimes:
       ds      1

psect	dataBANK0,class=BANK0,space=1,noexec
global __pdataBANK0
__pdataBANK0:
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
	line	8
_water_work_mode:
       ds      5

psect	dataBANK0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
	line	7
_work_mode:
       ds      5

psect	dataBANK0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
	line	10
_BatStates:
       ds      1

psect	bssBANK1,class=BANK1,space=1,noexec
global __pbssBANK1
__pbssBANK1:
_app_charge:
       ds      18

_app_timer:
       ds      10

_MOTOR_InitStruct:
       ds      7

_charge_force_full_cnt:
       ds      4

_adsum:
       ds      4

_Cnt1ms:
       ds      2

_Cnt10ms:
       ds      2

_adresultmotor:
       ds      2

_admax:
       ds      2

_admin:
       ds      2

_adresult:
       ds      2

	file	"SC8P171XE_IO.as"
	line	#
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2,merge=1
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
	fcall	__pidataBANK0+4		;fetch initializer
	movwf	__pdataBANK0+4&07fh		
	fcall	__pidataBANK0+5		;fetch initializer
	movwf	__pdataBANK0+5&07fh		
	fcall	__pidataBANK0+6		;fetch initializer
	movwf	__pdataBANK0+6&07fh		
	fcall	__pidataBANK0+7		;fetch initializer
	movwf	__pdataBANK0+7&07fh		
	fcall	__pidataBANK0+8		;fetch initializer
	movwf	__pdataBANK0+8&07fh		
	fcall	__pidataBANK0+9		;fetch initializer
	movwf	__pdataBANK0+9&07fh		
	fcall	__pidataBANK0+10		;fetch initializer
	movwf	__pdataBANK0+10&07fh		
	line	#
psect clrtext,class=CODE,delta=2
global clear_ram0
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram0:
	clrwdt			;clear the watchdog before getting into this loop
clrloop0:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop0		;do the next byte

; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+037h)
	fcall	clear_ram0
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+033h)
	fcall	clear_ram0
; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_app_process_set_work_state:	; 1 bytes @ 0x0
?_app_process_set_water_state:	; 1 bytes @ 0x0
?_app_process_set_mode_init:	; 1 bytes @ 0x0
?_app_process_set_mode_next:	; 1 bytes @ 0x0
?_app_led_water_mode_set:	; 1 bytes @ 0x0
?_water_motor:	; 1 bytes @ 0x0
?_app_process_set_water_mode_next:	; 1 bytes @ 0x0
?_work_chang_timing:	; 1 bytes @ 0x0
?_GotoSleep:	; 1 bytes @ 0x0
?_app_water_process_work:	; 1 bytes @ 0x0
?_Mode_control:	; 1 bytes @ 0x0
??_Mode_control:	; 1 bytes @ 0x0
?_MotorWaterDrive:	; 1 bytes @ 0x0
??_MotorWaterDrive:	; 1 bytes @ 0x0
?_app_process_motor_duty:	; 1 bytes @ 0x0
?_app_adc_bat_voltage_check:	; 1 bytes @ 0x0
?_app_adc_process:	; 1 bytes @ 0x0
?_ChargePwmOut:	; 1 bytes @ 0x0
?_Charge_Check:	; 1 bytes @ 0x0
?_app_process_charge:	; 1 bytes @ 0x0
?_key_brush_pwr_check:	; 1 bytes @ 0x0
?_key_water_pwr_check:	; 1 bytes @ 0x0
?_key_water_mode_check:	; 1 bytes @ 0x0
?_charge_or_lowBat_check:	; 1 bytes @ 0x0
?_handle_key_pwr:	; 1 bytes @ 0x0
?_handle_key_water:	; 1 bytes @ 0x0
?_app_process_key:	; 1 bytes @ 0x0
?_led_charge_pwm:	; 1 bytes @ 0x0
?_app_led_mode_set:	; 1 bytes @ 0x0
?_process_led_remind_low_power:	; 1 bytes @ 0x0
?_process_led:	; 1 bytes @ 0x0
??_process_led:	; 1 bytes @ 0x0
?_app_process_working:	; 1 bytes @ 0x0
?_app_process_power_off:	; 1 bytes @ 0x0
?_app_process_go_to_sleep:	; 1 bytes @ 0x0
?_app_process_charing:	; 1 bytes @ 0x0
?_app_process_work:	; 1 bytes @ 0x0
?_PortInit:	; 1 bytes @ 0x0
?_Timer0Cofng:	; 1 bytes @ 0x0
?_Timer2Config:	; 1 bytes @ 0x0
?_AdcConfig:	; 1 bytes @ 0x0
?_PwmConfig:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_Timer2_Isr:	; 1 bytes @ 0x0
?_app_process_water_working:	; 1 bytes @ 0x0
?_water_turn_off:	; 1 bytes @ 0x0
?_app_process_water_workoff:	; 1 bytes @ 0x0
?_app_process_water_mdoe_led:	; 1 bytes @ 0x0
?i1_set_led_state:	; 1 bytes @ 0x0
AdcOneChk@adch:	; 1 bytes @ 0x0
	global	i1set_led_state@index
i1set_led_state@index:	; 2 bytes @ 0x0
	ds	2
	global	i1set_led_state@state
i1set_led_state@state:	; 1 bytes @ 0x2
	ds	1
??i1_set_led_state:	; 1 bytes @ 0x3
	ds	6
??_led_charge_pwm:	; 1 bytes @ 0x9
??_Timer2_Isr:	; 1 bytes @ 0x9
	ds	2
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
??_app_process_set_work_state:	; 1 bytes @ 0x0
??_app_process_set_water_state:	; 1 bytes @ 0x0
?_set_led_state:	; 1 bytes @ 0x0
??_water_motor:	; 1 bytes @ 0x0
??_app_process_set_water_mode_next:	; 1 bytes @ 0x0
?_set_led_dirct_state:	; 1 bytes @ 0x0
??_work_chang_timing:	; 1 bytes @ 0x0
??_app_process_motor_duty:	; 1 bytes @ 0x0
??_ChargePwmOut:	; 1 bytes @ 0x0
??_key_brush_pwr_check:	; 1 bytes @ 0x0
??_key_water_pwr_check:	; 1 bytes @ 0x0
??_key_water_mode_check:	; 1 bytes @ 0x0
??_charge_or_lowBat_check:	; 1 bytes @ 0x0
??_PortInit:	; 1 bytes @ 0x0
??_Timer0Cofng:	; 1 bytes @ 0x0
??_Timer2Config:	; 1 bytes @ 0x0
??_AdcConfig:	; 1 bytes @ 0x0
??_PwmConfig:	; 1 bytes @ 0x0
	global	?_AdcOneChk
?_AdcOneChk:	; 2 bytes @ 0x0
	global	AdcOneChk@adldo
AdcOneChk@adldo:	; 1 bytes @ 0x0
	global	ChargePwmOut@Duty
ChargePwmOut@Duty:	; 1 bytes @ 0x0
	global	app_process_set_work_state@states
app_process_set_work_state@states:	; 1 bytes @ 0x0
	global	app_process_set_water_state@states
app_process_set_water_state@states:	; 1 bytes @ 0x0
	global	set_led_state@index
set_led_state@index:	; 2 bytes @ 0x0
	global	set_led_dirct_state@index
set_led_dirct_state@index:	; 2 bytes @ 0x0
	ds	1
??_GotoSleep:	; 1 bytes @ 0x1
??_app_process_working:	; 1 bytes @ 0x1
??_app_process_go_to_sleep:	; 1 bytes @ 0x1
??_app_process_water_working:	; 1 bytes @ 0x1
??_app_process_water_mdoe_led:	; 1 bytes @ 0x1
	ds	1
??_set_led_dirct_state:	; 1 bytes @ 0x2
??_AdcOneChk:	; 1 bytes @ 0x2
	global	set_led_state@state
set_led_state@state:	; 1 bytes @ 0x2
	ds	1
??_set_led_state:	; 1 bytes @ 0x3
	global	AdcOneChk@i
AdcOneChk@i:	; 1 bytes @ 0x3
	ds	1
	global	AdcOneChk@ad_result
AdcOneChk@ad_result:	; 2 bytes @ 0x4
	ds	2
	global	?_AdcResultChk
?_AdcResultChk:	; 2 bytes @ 0x6
	global	AdcResultChk@adldo
AdcResultChk@adldo:	; 1 bytes @ 0x6
	ds	3
??_app_process_set_mode_init:	; 1 bytes @ 0x9
??_app_process_set_mode_next:	; 1 bytes @ 0x9
??_app_led_water_mode_set:	; 1 bytes @ 0x9
??_app_water_process_work:	; 1 bytes @ 0x9
??_AdcResultChk:	; 1 bytes @ 0x9
??_handle_key_pwr:	; 1 bytes @ 0x9
??_handle_key_water:	; 1 bytes @ 0x9
??_app_process_key:	; 1 bytes @ 0x9
??_app_led_mode_set:	; 1 bytes @ 0x9
??_process_led_remind_low_power:	; 1 bytes @ 0x9
??_app_process_power_off:	; 1 bytes @ 0x9
??_app_process_charing:	; 1 bytes @ 0x9
??_app_process_work:	; 1 bytes @ 0x9
??_water_turn_off:	; 1 bytes @ 0x9
??_app_process_water_workoff:	; 1 bytes @ 0x9
	global	AdcResultChk@adch
AdcResultChk@adch:	; 1 bytes @ 0x9
	ds	1
	global	AdcResultChk@i
AdcResultChk@i:	; 1 bytes @ 0xA
	ds	1
	global	AdcResultChk@ad_value
AdcResultChk@ad_value:	; 2 bytes @ 0xB
	ds	2
??_app_adc_bat_voltage_check:	; 1 bytes @ 0xD
??_Charge_Check:	; 1 bytes @ 0xD
	ds	1
??_app_adc_process:	; 1 bytes @ 0xE
??_app_process_charge:	; 1 bytes @ 0xE
??_main:	; 1 bytes @ 0xE
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        11
;!    BSS         106
;!    Persistent  2
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14     11      12
;!    BANK0            80     14      78
;!    BANK1            80      0      55

;!
;!Pointer List with Targets:
;!
;!    S1426$cb	PTR FTN()void  size(1) Largest target is 1
;!		 -> app_process_charing(), app_process_power_off(), app_process_working(), 
;!
;!    work_state_action_tab.cb	PTR FTN()void  size(1) Largest target is 1
;!		 -> app_process_charing(), app_process_power_off(), app_process_working(), 
;!


;!
;!Critical Paths under _main in COMMON
;!
;!    None.
;!
;!Critical Paths under _Timer2_Isr in COMMON
;!
;!    _led_charge_pwm->i1_set_led_state
;!
;!Critical Paths under _main in BANK0
;!
;!    _process_led_remind_low_power->_set_led_state
;!    _water_turn_off->_set_led_state
;!    _app_process_water_working->_app_process_set_water_state
;!    _app_process_water_mdoe_led->_app_process_set_water_state
;!    _app_process_working->_app_process_set_work_state
;!    _app_process_power_off->_set_led_state
;!    _app_led_water_mode_set->_set_led_state
;!    _app_led_mode_set->_set_led_state
;!    _GotoSleep->_ChargePwmOut
;!    _app_process_charge->_Charge_Check
;!    _Charge_Check->_AdcResultChk
;!    _app_adc_process->_app_adc_bat_voltage_check
;!    _app_adc_bat_voltage_check->_AdcResultChk
;!    _AdcResultChk->_AdcOneChk
;!
;!Critical Paths under _Timer2_Isr in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _Timer2_Isr in BANK1
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 0     0      0   23223
;!                          _AdcConfig
;!                           _PortInit
;!                          _PwmConfig
;!                        _Timer0Cofng
;!                       _Timer2Config
;!                    _app_adc_process
;!                 _app_process_charge
;!            _app_process_go_to_sleep
;!                    _app_process_key
;!        _app_process_set_water_state
;!         _app_process_set_work_state
;!                   _app_process_work
;!             _app_water_process_work
;!       _process_led_remind_low_power
;! ---------------------------------------------------------------------------------
;! (1) _process_led_remind_low_power                         0     0      0    2887
;!        _app_process_set_water_state
;!         _app_process_set_work_state
;!                _set_led_dirct_state
;!                      _set_led_state
;! ---------------------------------------------------------------------------------
;! (2) _set_led_dirct_state                                  2     0      2      75
;!                                              0 BANK0      2     0      2
;! ---------------------------------------------------------------------------------
;! (1) _app_water_process_work                               0     0      0    2812
;!         _app_process_water_mdoe_led
;!          _app_process_water_working
;!          _app_process_water_workoff
;! ---------------------------------------------------------------------------------
;! (2) _app_process_water_workoff                            0     0      0    2768
;!                     _water_turn_off
;! ---------------------------------------------------------------------------------
;! (3) _water_turn_off                                       0     0      0    2768
;!                      _set_led_state
;! ---------------------------------------------------------------------------------
;! (2) _app_process_water_working                            0     0      0      22
;!        _app_process_set_water_state
;! ---------------------------------------------------------------------------------
;! (2) _app_process_water_mdoe_led                           0     0      0      22
;!        _app_process_set_water_state
;! ---------------------------------------------------------------------------------
;! (1) _app_process_work                                     0     0      0    5580
;!                _app_process_charing
;!              _app_process_power_off
;!                _app_process_working
;! ---------------------------------------------------------------------------------
;! (2) _app_process_working                                  0     0      0      22
;!         _app_process_set_work_state
;!                  _work_chang_timing
;! ---------------------------------------------------------------------------------
;! (3) _work_chang_timing                                    0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _app_process_charing                                  0     0      0    2790
;!              _app_process_power_off
;!        _app_process_set_water_state
;! ---------------------------------------------------------------------------------
;! (2) _app_process_power_off                                0     0      0    2768
;!                      _set_led_state
;! ---------------------------------------------------------------------------------
;! (1) _app_process_key                                      0     0      0    8348
;!             _charge_or_lowBat_check
;!                     _handle_key_pwr
;!                   _handle_key_water
;!                _key_brush_pwr_check
;!               _key_water_mode_check
;!                _key_water_pwr_check
;! ---------------------------------------------------------------------------------
;! (2) _key_water_pwr_check                                  0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _key_water_mode_check                                 0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _key_brush_pwr_check                                  0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _handle_key_water                                     0     0      0    2790
;!             _app_led_water_mode_set
;!    _app_process_set_water_mode_next
;!        _app_process_set_water_state
;!                        _water_motor
;! ---------------------------------------------------------------------------------
;! (3) _water_motor                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (3) _app_process_set_water_mode_next                      0     0      0       0
;! ---------------------------------------------------------------------------------
;! (3) _app_led_water_mode_set                               0     0      0    2768
;!                      _set_led_state
;! ---------------------------------------------------------------------------------
;! (2) _handle_key_pwr                                       0     0      0    5558
;!          _app_process_set_mode_init
;!          _app_process_set_mode_next
;!         _app_process_set_work_state
;! ---------------------------------------------------------------------------------
;! (3) _app_process_set_mode_next                            0     0      0    2768
;!                   _app_led_mode_set
;!             _app_process_motor_duty
;! ---------------------------------------------------------------------------------
;! (3) _app_process_set_mode_init                            0     0      0    2768
;!                   _app_led_mode_set
;!             _app_process_motor_duty
;! ---------------------------------------------------------------------------------
;! (4) _app_process_motor_duty                               6     6      0       0
;!                                              0 BANK0      6     6      0
;! ---------------------------------------------------------------------------------
;! (4) _app_led_mode_set                                     0     0      0    2768
;!                      _set_led_state
;! ---------------------------------------------------------------------------------
;! (2) _charge_or_lowBat_check                               0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _app_process_go_to_sleep                              0     0      0      44
;!                          _GotoSleep
;! ---------------------------------------------------------------------------------
;! (2) _GotoSleep                                            0     0      0      44
;!                          _AdcConfig
;!                       _ChargePwmOut
;!                           _PortInit
;! ---------------------------------------------------------------------------------
;! (3) _PortInit                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (3) _AdcConfig                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _app_process_charge                                   0     0      0    3149
;!                       _Charge_Check
;! ---------------------------------------------------------------------------------
;! (2) _Charge_Check                                         1     1      0    3149
;!                                             13 BANK0      1     1      0
;!                       _AdcResultChk
;!                       _ChargePwmOut
;!         _app_process_set_work_state
;!                      _set_led_state
;! ---------------------------------------------------------------------------------
;! (2) _set_led_state                                        9     6      3    2768
;!                                              0 BANK0      9     6      3
;! ---------------------------------------------------------------------------------
;! (3) _ChargePwmOut                                         1     1      0      44
;!                                              0 BANK0      1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _app_adc_process                                      0     0      0     359
;!          _app_adc_bat_voltage_check
;! ---------------------------------------------------------------------------------
;! (2) _app_adc_bat_voltage_check                            1     1      0     359
;!                                             13 BANK0      1     1      0
;!                       _AdcResultChk
;!        _app_process_set_water_state
;!         _app_process_set_work_state
;! ---------------------------------------------------------------------------------
;! (2) _app_process_set_work_state                           1     1      0      22
;!                                              0 BANK0      1     1      0
;! ---------------------------------------------------------------------------------
;! (2) _app_process_set_water_state                          1     1      0      22
;!                                              0 BANK0      1     1      0
;! ---------------------------------------------------------------------------------
;! (3) _AdcResultChk                                        13    10      3     315
;!                                              6 BANK0      7     4      3
;!                          _AdcOneChk
;! ---------------------------------------------------------------------------------
;! (4) _AdcOneChk                                            7     5      2     101
;!                                              0 BANK0      6     4      2
;! ---------------------------------------------------------------------------------
;! (1) _Timer2Config                                         0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _Timer0Cofng                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _PwmConfig                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (6) _Timer2_Isr                                           2     2      0     244
;!                                              9 COMMON     2     2      0
;!                       _Mode_control
;!                    _MotorWaterDrive
;!                     _led_charge_pwm
;!                        _process_led
;! ---------------------------------------------------------------------------------
;! (7) _process_led                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (7) _led_charge_pwm                                       0     0      0     244
;!                    i1_set_led_state
;! ---------------------------------------------------------------------------------
;! (8) i1_set_led_state                                      9     6      3     244
;!                                              0 COMMON     9     6      3
;! ---------------------------------------------------------------------------------
;! (7) _MotorWaterDrive                                      0     0      0       0
;! ---------------------------------------------------------------------------------
;! (7) _Mode_control                                         2     2      0       0
;!                                              0 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 8
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _AdcConfig
;!   _PortInit
;!   _PwmConfig
;!   _Timer0Cofng
;!   _Timer2Config
;!   _app_adc_process
;!     _app_adc_bat_voltage_check
;!       _AdcResultChk
;!         _AdcOneChk
;!       _app_process_set_water_state
;!       _app_process_set_work_state
;!   _app_process_charge
;!     _Charge_Check
;!       _AdcResultChk
;!         _AdcOneChk
;!       _ChargePwmOut
;!       _app_process_set_work_state
;!       _set_led_state
;!   _app_process_go_to_sleep
;!     _GotoSleep
;!       _AdcConfig
;!       _ChargePwmOut
;!       _PortInit
;!   _app_process_key
;!     _charge_or_lowBat_check
;!     _handle_key_pwr
;!       _app_process_set_mode_init
;!         _app_led_mode_set
;!           _set_led_state
;!         _app_process_motor_duty
;!       _app_process_set_mode_next
;!         _app_led_mode_set
;!           _set_led_state
;!         _app_process_motor_duty
;!       _app_process_set_work_state
;!     _handle_key_water
;!       _app_led_water_mode_set
;!         _set_led_state
;!       _app_process_set_water_mode_next
;!       _app_process_set_water_state
;!       _water_motor
;!     _key_brush_pwr_check
;!     _key_water_mode_check
;!     _key_water_pwr_check
;!   _app_process_set_water_state
;!   _app_process_set_work_state
;!   _app_process_work
;!     _app_process_charing
;!       _app_process_power_off
;!         _set_led_state
;!       _app_process_set_water_state
;!     _app_process_power_off
;!       _set_led_state
;!     _app_process_working
;!       _app_process_set_work_state
;!       _work_chang_timing
;!   _app_water_process_work
;!     _app_process_water_mdoe_led
;!       _app_process_set_water_state
;!     _app_process_water_working
;!       _app_process_set_water_state
;!     _app_process_water_workoff
;!       _water_turn_off
;!         _set_led_state
;!   _process_led_remind_low_power
;!     _app_process_set_water_state
;!     _app_process_set_work_state
;!     _set_led_dirct_state
;!     _set_led_state
;!
;! _Timer2_Isr (ROOT)
;!   _Mode_control
;!   _MotorWaterDrive
;!   _led_charge_pwm
;!     i1_set_led_state
;!   _process_led
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BANK1               50      0      37       6       68.8%
;!BITBANK1            50      0       0       5        0.0%
;!SFR1                 0      0       0       2        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!BANK0               50      E      4E       4       97.5%
;!BITBANK0            50      0       0       3        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!COMMON               E      B       C       1       85.7%
;!BITCOMMON            E      0       1       0        7.1%
;!CODE                 0      0       0       0        0.0%
;!DATA                 0      0      91       8        0.0%
;!ABS                  0      0      91       7        0.0%
;!NULL                 0      0       0       0        0.0%
;!STACK                0      0       0       2        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 85 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_AdcConfig
;;		_PortInit
;;		_PwmConfig
;;		_Timer0Cofng
;;		_Timer2Config
;;		_app_adc_process
;;		_app_process_charge
;;		_app_process_go_to_sleep
;;		_app_process_key
;;		_app_process_set_water_state
;;		_app_process_set_work_state
;;		_app_process_work
;;		_app_water_process_work
;;		_process_led_remind_low_power
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
	line	85
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
	line	85
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	87
	
l7169:	
# 87 "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
nop ;# 
	line	88
# 88 "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
clrwdt ;# 
psect	maintext
	line	89
	
l7171:	
;main.c: 89: OSCCON = 0X70;
	movlw	low(070h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	91
	
l7173:	
;main.c: 91: PortInit();
	fcall	_PortInit
	line	92
	
l7175:	
;main.c: 92: Timer0Cofng();
	fcall	_Timer0Cofng
	line	93
	
l7177:	
;main.c: 93: Timer2Config();
	fcall	_Timer2Config
	line	94
	
l7179:	
;main.c: 94: AdcConfig();
	fcall	_AdcConfig
	line	95
	
l7181:	
;main.c: 95: PwmConfig();
	fcall	_PwmConfig
	line	97
# 97 "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
clrwdt ;# 
psect	maintext
	line	98
	
l7183:	
;main.c: 98: INTCON |= 0XC0;
	movlw	low(0C0h)
	iorwf	(11),f	;volatile
	line	99
	
l7185:	
;main.c: 99: SWDTEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1088/8)^080h,(1088)&7	;volatile
	line	101
	
l7187:	
;main.c: 101: app_process_set_work_state(WORK_STATE_POWEROFF);
	movlw	low(0)
	fcall	_app_process_set_work_state
	line	102
	
l7189:	
;main.c: 102: app_process_set_water_state(WATER_WORK_STATE_POWEROFF);
	movlw	low(0)
	fcall	_app_process_set_water_state
	line	118
;main.c: 118: while (1)
	
l3782:	
	line	120
# 120 "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
clrwdt ;# 
psect	maintext
	line	122
	
l7191:	
;main.c: 122: if (Flag_10ms)
	btfss	(_Flag_10ms/8),(_Flag_10ms)&7	;volatile
	goto	u3001
	goto	u3000
u3001:
	goto	l3782
u3000:
	line	124
	
l7193:	
;main.c: 123: {
;main.c: 124: Flag_10ms = 0;
	bcf	(_Flag_10ms/8),(_Flag_10ms)&7	;volatile
	line	125
	
l7195:	
;main.c: 125: app_adc_process();
	fcall	_app_adc_process
	line	126
;main.c: 126: app_process_charge();
	fcall	_app_process_charge
	line	128
	
l7197:	
;main.c: 128: app_process_key();
	fcall	_app_process_key
	line	129
	
l7199:	
;main.c: 129: app_process_work();
	fcall	_app_process_work
	line	130
;main.c: 130: app_water_process_work();
	fcall	_app_water_process_work
	line	132
	
l7201:	
;main.c: 132: app_process_go_to_sleep();
	fcall	_app_process_go_to_sleep
	line	133
	
l7203:	
;main.c: 133: process_led_remind_low_power();
	fcall	_process_led_remind_low_power
	goto	l3782
	global	start
	ljmp	start
	opt stack 0
	line	136
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_process_led_remind_low_power

;; *************** function _process_led_remind_low_power *****************
;; Defined at:
;;		line 194 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_app_process_set_water_state
;;		_app_process_set_work_state
;;		_set_led_dirct_state
;;		_set_led_state
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
	line	194
global __ptext1
__ptext1:	;psect for function _process_led_remind_low_power
psect	text1
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
	line	194
	global	__size_of_process_led_remind_low_power
	__size_of_process_led_remind_low_power	equ	__end_of_process_led_remind_low_power-_process_led_remind_low_power
	
_process_led_remind_low_power:	
;incstack = 0
	opt	stack 3
; Regs used in _process_led_remind_low_power: [wreg+status,2+status,0+pclath+cstack]
	line	196
	
l6953:	
;app_led.c: 196: if (app_charge.LowPower)
	bsf	status, 5	;RP0=1, select bank1
	movf	(0+(_app_charge)^080h+06h),w
	btfsc	status,2
	goto	u2521
	goto	u2520
u2521:
	goto	l2209
u2520:
	line	198
	
l6955:	
;app_led.c: 197: {
;app_led.c: 198: if (app_charge.LowLed)
	movf	(0+(_app_charge)^080h+07h),w
	btfsc	status,2
	goto	u2531
	goto	u2530
u2531:
	goto	l2231
u2530:
	line	200
	
l6957:	
;app_led.c: 199: {
;app_led.c: 200: app_charge.LowLed_cnt++;
	incf	0+(_app_charge)^080h+08h,f
	line	201
	
l6959:	
;app_led.c: 201: if (app_charge.LowLed_cnt <= 1)
	movlw	low(02h)
	subwf	0+(_app_charge)^080h+08h,w
	skipnc
	goto	u2541
	goto	u2540
u2541:
	goto	l6967
u2540:
	line	203
	
l6961:	
;app_led.c: 202: {
;app_led.c: 203: app_process_set_work_state(WORK_STATE_POWEROFF);
	movlw	low(0)
	fcall	_app_process_set_work_state
	line	204
;app_led.c: 204: app_process_set_water_state(WATER_WORK_STATE_POWEROFF);
	movlw	low(0)
	fcall	_app_process_set_water_state
	line	205
	
l6963:	
;app_led.c: 205: app_charge.low_led_blink_cnt = 5;
	movlw	low(05h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_app_charge)^080h+011h
	line	206
	
l6965:	
;app_led.c: 206: set_led_dirct_state(LED_INDEX_NULL);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(set_led_dirct_state@index)
	clrf	(set_led_dirct_state@index+1)
	fcall	_set_led_dirct_state
	line	207
;app_led.c: 207: }
	goto	l2231
	line	208
	
l6967:	
;app_led.c: 208: else if (app_charge.LowLed_cnt < 25)
	movlw	low(019h)
	subwf	0+(_app_charge)^080h+08h,w
	skipnc
	goto	u2551
	goto	u2550
u2551:
	goto	l6971
u2550:
	line	210
	
l6969:	
;app_led.c: 209: {
;app_led.c: 210: set_led_state(LED_INDEX_10, LED_STATE_ON);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	movwf	(set_led_state@index)
	movlw	02h
	movwf	((set_led_state@index))+1
	clrf	(set_led_state@state)
	incf	(set_led_state@state),f
	fcall	_set_led_state
	line	211
;app_led.c: 211: }
	goto	l2231
	line	212
	
l6971:	
;app_led.c: 212: else if (app_charge.LowLed_cnt < 50)
	movlw	low(032h)
	subwf	0+(_app_charge)^080h+08h,w
	skipnc
	goto	u2561
	goto	u2560
u2561:
	goto	l6975
u2560:
	line	214
	
l6973:	
;app_led.c: 213: {
;app_led.c: 214: set_led_state(LED_INDEX_10, LED_STATE_OFF);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	movwf	(set_led_state@index)
	movlw	02h
	movwf	((set_led_state@index))+1
	clrf	(set_led_state@state)
	fcall	_set_led_state
	line	215
;app_led.c: 215: }
	goto	l2231
	line	218
	
l6975:	
;app_led.c: 216: else
;app_led.c: 217: {
;app_led.c: 218: app_charge.low_led_blink_cnt--;
	decf	0+(_app_charge)^080h+011h,f
	line	219
	
l6977:	
;app_led.c: 219: if (!app_charge.low_led_blink_cnt)
	movf	(0+(_app_charge)^080h+011h),w
	btfss	status,2
	goto	u2571
	goto	u2570
u2571:
	goto	l6981
u2570:
	line	221
	
l6979:	
;app_led.c: 220: {
;app_led.c: 221: app_charge.LowLed = 0;
	clrf	0+(_app_charge)^080h+07h
	line	223
	
l6981:	
;app_led.c: 222: }
;app_led.c: 223: app_charge.LowLed_cnt = 2;
	movlw	low(02h)
	movwf	0+(_app_charge)^080h+08h
	goto	l2231
	line	224
	
l2214:	
	goto	l2231
	line	227
	
l2209:	
;app_led.c: 227: else if (app_charge.Remind)
	btfss	(_app_charge)^080h,4
	goto	u2581
	goto	u2580
u2581:
	goto	l7013
u2580:
	line	229
	
l6983:	
;app_led.c: 228: {
;app_led.c: 229: if (app_work_state == WORK_STATE_WORKING || water_work_state == WATER_WORK_STATE_WORKING || app_charge.flag_remind_delay_10s)
	bcf	status, 5	;RP0=0, select bank0
		decf	((_app_work_state)),w	;volatile
	btfsc	status,2
	goto	u2591
	goto	u2590
u2591:
	goto	l6989
u2590:
	
l6985:	
		decf	((_water_work_state)),w	;volatile
	btfsc	status,2
	goto	u2601
	goto	u2600
u2601:
	goto	l6989
u2600:
	
l6987:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(0+(_app_charge)^080h+02h),w
	btfsc	status,2
	goto	u2611
	goto	u2610
u2611:
	goto	l2231
u2610:
	line	231
	
l6989:	
;app_led.c: 230: {
;app_led.c: 231: CntLedFlash++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_CntLedFlash),f
	skipnz
	incf	(_CntLedFlash+1),f
	line	232
	
l6991:	
;app_led.c: 232: if (CntLedFlash <= ((500) / 10))
	movlw	0
	subwf	(_CntLedFlash+1),w
	movlw	033h
	skipnz
	subwf	(_CntLedFlash),w
	skipnc
	goto	u2621
	goto	u2620
u2621:
	goto	l6995
u2620:
	goto	l6969
	line	236
	
l6995:	
;app_led.c: 236: else if (CntLedFlash <= ((1000) / 10))
	movlw	0
	subwf	(_CntLedFlash+1),w
	movlw	065h
	skipnz
	subwf	(_CntLedFlash),w
	skipnc
	goto	u2631
	goto	u2630
u2631:
	goto	l6999
u2630:
	goto	l6973
	line	242
	
l6999:	
;app_led.c: 240: else
;app_led.c: 241: {
;app_led.c: 242: CntLedFlash = 0;
	clrf	(_CntLedFlash)
	clrf	(_CntLedFlash+1)
	line	243
	
l7001:	
;app_led.c: 243: if (app_charge.flag_remind_delay_10s)
	bsf	status, 5	;RP0=1, select bank1
	movf	(0+(_app_charge)^080h+02h),w
	btfsc	status,2
	goto	u2641
	goto	u2640
u2641:
	goto	l2231
u2640:
	line	246
	
l7003:	
;app_led.c: 244: {
;app_led.c: 246: if (++app_charge.remind_delay_10s_timer >= 10)
	incf	0+(_app_charge)^080h+03h,f
	skipnz
	incf	1+(_app_charge)^080h+03h,f
	movlw	0
	subwf	(1+(_app_charge)^080h+03h),w
	movlw	0Ah
	skipnz
	subwf	(0+(_app_charge)^080h+03h),w
	skipc
	goto	u2651
	goto	u2650
u2651:
	goto	l2231
u2650:
	line	248
	
l7005:	
;app_led.c: 247: {
;app_led.c: 248: app_charge.flag_remind_delay_10s = 0;
	clrf	0+(_app_charge)^080h+02h
	line	250
	
l7007:	
;app_led.c: 250: set_led_state(LED_INDEX_10, LED_STATE_OFF);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	movwf	(set_led_state@index)
	movlw	02h
	movwf	((set_led_state@index))+1
	clrf	(set_led_state@state)
	fcall	_set_led_state
	line	251
	
l7009:	
;app_led.c: 251: if (water_work_state != WATER_WORK_STATE_MODE_LED)
		movlw	3
	xorwf	((_water_work_state)),w	;volatile
	btfsc	status,2
	goto	u2661
	goto	u2660
u2661:
	goto	l2214
u2660:
	line	253
	
l7011:	
;app_led.c: 252: {
;app_led.c: 253: app_process_set_work_state(WORK_STATE_POWEROFF);
	movlw	low(0)
	fcall	_app_process_set_work_state
	line	254
;app_led.c: 254: app_process_set_water_state(WATER_WORK_STATE_POWEROFF);
	movlw	low(0)
	fcall	_app_process_set_water_state
	goto	l2231
	line	265
	
l7013:	
;app_led.c: 263: else
;app_led.c: 264: {
;app_led.c: 265: CntLedFlash = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_CntLedFlash)
	clrf	(_CntLedFlash+1)
	line	267
	
l2231:	
	return
	opt stack 0
GLOBAL	__end_of_process_led_remind_low_power
	__end_of_process_led_remind_low_power:
	signat	_process_led_remind_low_power,89
	global	_set_led_dirct_state

;; *************** function _set_led_dirct_state *****************
;; Defined at:
;;		line 281 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
;; Parameters:    Size  Location     Type
;;  index           2    0[BANK0 ] enum E591
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_process_led_remind_low_power
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	281
global __ptext2
__ptext2:	;psect for function _set_led_dirct_state
psect	text2
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
	line	281
	global	__size_of_set_led_dirct_state
	__size_of_set_led_dirct_state	equ	__end_of_set_led_dirct_state-_set_led_dirct_state
	
_set_led_dirct_state:	
;incstack = 0
	opt	stack 3
; Regs used in _set_led_dirct_state: [wreg]
	line	283
	
l6735:	
;app_led.c: 283: led_index = index;
	movf	(set_led_dirct_state@index),w
	movwf	(_led_index)
	movf	(set_led_dirct_state@index+1),w
	movwf	((_led_index))+1
	clrf	2+((_led_index))
	clrf	3+((_led_index))
	line	284
	
l2240:	
	return
	opt stack 0
GLOBAL	__end_of_set_led_dirct_state
	__end_of_set_led_dirct_state:
	signat	_set_led_dirct_state,4217
	global	_app_water_process_work

;; *************** function _app_water_process_work *****************
;; Defined at:
;;		line 169 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_app_process_water_mdoe_led
;;		_app_process_water_working
;;		_app_process_water_workoff
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
	line	169
global __ptext3
__ptext3:	;psect for function _app_water_process_work
psect	text3
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
	line	169
	global	__size_of_app_water_process_work
	__size_of_app_water_process_work	equ	__end_of_app_water_process_work-_app_water_process_work
	
_app_water_process_work:	
;incstack = 0
	opt	stack 1
; Regs used in _app_water_process_work: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	171
	
l7107:	
;app_water_process.c: 171: switch (water_work_state)
	goto	l7117
	line	174
	
l7109:	
;app_water_process.c: 174: app_process_water_working();
	fcall	_app_process_water_working
	line	175
;app_water_process.c: 175: break;
	goto	l4851
	line	177
	
l7111:	
;app_water_process.c: 177: app_process_water_workoff();
	fcall	_app_process_water_workoff
	line	178
;app_water_process.c: 178: break;
	goto	l4851
	line	180
	
l7113:	
;app_water_process.c: 180: app_process_water_mdoe_led();
	fcall	_app_process_water_mdoe_led
	line	181
;app_water_process.c: 181: break;
	goto	l4851
	line	171
	
l7117:	
	movf	(_water_work_state),w	;volatile
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           10     6 (fixed)
; simple_byte           10     6 (average)
; jumptable            260     6 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	4
	subwf	fsr,w
skipnc
goto l4851
movlw high(S7269)
movwf pclath
	movlw low(S7269)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S7269:
	ljmp	l7111
	ljmp	l7109
	ljmp	l4851
	ljmp	l7113
psect	text3

	line	186
	
l4851:	
	return
	opt stack 0
GLOBAL	__end_of_app_water_process_work
	__end_of_app_water_process_work:
	signat	_app_water_process_work,89
	global	_app_process_water_workoff

;; *************** function _app_process_water_workoff *****************
;; Defined at:
;;		line 141 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_water_turn_off
;; This function is called by:
;;		_app_water_process_work
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	line	141
global __ptext4
__ptext4:	;psect for function _app_process_water_workoff
psect	text4
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
	line	141
	global	__size_of_app_process_water_workoff
	__size_of_app_process_water_workoff	equ	__end_of_app_process_water_workoff-_app_process_water_workoff
	
_app_process_water_workoff:	
;incstack = 0
	opt	stack 1
; Regs used in _app_process_water_workoff: [wreg+status,2+status,0+pclath+cstack]
	line	143
	
l6867:	
;app_water_process.c: 143: water_turn_off();
	fcall	_water_turn_off
	line	144
	
l4833:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_water_workoff
	__end_of_app_process_water_workoff:
	signat	_app_process_water_workoff,89
	global	_water_turn_off

;; *************** function _water_turn_off *****************
;; Defined at:
;;		line 131 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_set_led_state
;; This function is called by:
;;		_app_process_water_workoff
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	line	131
global __ptext5
__ptext5:	;psect for function _water_turn_off
psect	text5
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
	line	131
	global	__size_of_water_turn_off
	__size_of_water_turn_off	equ	__end_of_water_turn_off-_water_turn_off
	
_water_turn_off:	
;incstack = 0
	opt	stack 1
; Regs used in _water_turn_off: [wreg+status,2+status,0+pclath+cstack]
	line	133
	
l6381:	
;app_water_process.c: 133: water_work_mode.water_mode_count = 0;
	clrf	0+(_water_work_mode)+02h
	clrf	1+(_water_work_mode)+02h
	line	134
;app_water_process.c: 134: water_work_mode.times = 0;
	clrf	0+(_water_work_mode)+04h
	line	136
;app_water_process.c: 136: water_work_mode.water_mode_out_put = WATER_WORK_MODE_IDEL;
	clrf	0+(_water_work_mode)+01h
	line	138
	
l6383:	
;app_water_process.c: 138: set_led_state(LED_INDEX_8 | LED_INDEX_7 | LED_INDEX_6 | LED_INDEX_5 | LED_INDEX_4, LED_STATE_OFF);
	movlw	0F8h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	fcall	_set_led_state
	line	139
	
l4830:	
	return
	opt stack 0
GLOBAL	__end_of_water_turn_off
	__end_of_water_turn_off:
	signat	_water_turn_off,89
	global	_app_process_water_working

;; *************** function _app_process_water_working *****************
;; Defined at:
;;		line 95 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_app_process_set_water_state
;; This function is called by:
;;		_app_water_process_work
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1,group=0
	line	95
global __ptext6
__ptext6:	;psect for function _app_process_water_working
psect	text6
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
	line	95
	global	__size_of_app_process_water_working
	__size_of_app_process_water_working	equ	__end_of_app_process_water_working-_app_process_water_working
	
_app_process_water_working:	
;incstack = 0
	opt	stack 2
; Regs used in _app_process_water_working: [wreg+status,2+status,0+pclath+cstack]
	line	97
	
l6837:	
;app_water_process.c: 97: if (!water_work_step)
	movf	((_water_work_step)),w
	btfss	status,2
	goto	u2301
	goto	u2300
u2301:
	goto	l6841
u2300:
	line	99
	
l6839:	
;app_water_process.c: 98: {
;app_water_process.c: 99: water_work_step++;
	incf	(_water_work_step),f
	line	100
;app_water_process.c: 100: }
	goto	l4827
	line	103
	
l6841:	
;app_water_process.c: 101: else
;app_water_process.c: 102: {
;app_water_process.c: 103: water_work_mode.water_mode_count++;
	incf	0+(_water_work_mode)+02h,f
	skipnz
	incf	1+(_water_work_mode)+02h,f
	line	104
	
l6843:	
;app_water_process.c: 104: if (water_work_mode.water_mode_count == (100UL * (30)))
		movlw	184
	xorwf	(0+(_water_work_mode)+02h),w
	movlw	11
	skipnz
	xorwf	(1+(_water_work_mode)+02h),w
	btfss	status,2
	goto	u2311
	goto	u2310
u2311:
	goto	l6847
u2310:
	line	106
	
l6845:	
;app_water_process.c: 105: {
;app_water_process.c: 106: water_work_mode.water_mode_out_put = WORK_MODE_IDEL;
	clrf	0+(_water_work_mode)+01h
	line	107
;app_water_process.c: 107: }
	goto	l4827
	line	108
	
l6847:	
;app_water_process.c: 108: else if (water_work_mode.water_mode_count >= (100UL * (30)) + ((200) / 10))
	movlw	0Bh
	subwf	1+(_water_work_mode)+02h,w
	movlw	0CCh
	skipnz
	subwf	0+(_water_work_mode)+02h,w
	skipc
	goto	u2321
	goto	u2320
u2321:
	goto	l4827
u2320:
	line	110
	
l6849:	
;app_water_process.c: 109: {
;app_water_process.c: 110: water_work_mode.water_mode_count = 0;
	clrf	0+(_water_work_mode)+02h
	clrf	1+(_water_work_mode)+02h
	line	111
	
l6851:	
;app_water_process.c: 111: water_work_mode.times++;
	incf	0+(_water_work_mode)+04h,f
	line	112
	
l6853:	
;app_water_process.c: 112: if(water_work_mode.times >= 4)
	movlw	low(04h)
	subwf	0+(_water_work_mode)+04h,w
	skipc
	goto	u2331
	goto	u2330
u2331:
	goto	l6865
u2330:
	line	114
	
l6855:	
;app_water_process.c: 113: {
;app_water_process.c: 114: water_work_mode.times = 0;
	clrf	0+(_water_work_mode)+04h
	line	115
	
l6857:	
;app_water_process.c: 115: if (app_charge.Remind)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(_app_charge)^080h,4
	goto	u2341
	goto	u2340
u2341:
	goto	l6863
u2340:
	line	117
	
l6859:	
;app_water_process.c: 116: {
;app_water_process.c: 117: app_charge.flag_remind_delay_10s = 1;
	clrf	0+(_app_charge)^080h+02h
	incf	0+(_app_charge)^080h+02h,f
	line	118
	
l6861:	
;app_water_process.c: 118: app_charge.remind_delay_10s_timer = 0;
	clrf	0+(_app_charge)^080h+03h
	clrf	1+(_app_charge)^080h+03h
	line	121
	
l6863:	
;app_water_process.c: 119: }
;app_water_process.c: 121: app_process_set_water_state(WATER_WORK_STATE_POWEROFF);
	movlw	low(0)
	fcall	_app_process_set_water_state
	line	122
;app_water_process.c: 122: }
	goto	l4827
	line	125
	
l6865:	
;app_water_process.c: 123: else
;app_water_process.c: 124: {
;app_water_process.c: 125: water_work_mode.water_mode_out_put = water_work_mode.water_mode;
	movf	(_water_work_mode),w
	movwf	0+(_water_work_mode)+01h
	line	129
	
l4827:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_water_working
	__end_of_app_process_water_working:
	signat	_app_process_water_working,89
	global	_app_process_water_mdoe_led

;; *************** function _app_process_water_mdoe_led *****************
;; Defined at:
;;		line 147 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_app_process_set_water_state
;; This function is called by:
;;		_app_water_process_work
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1,group=0
	line	147
global __ptext7
__ptext7:	;psect for function _app_process_water_mdoe_led
psect	text7
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
	line	147
	global	__size_of_app_process_water_mdoe_led
	__size_of_app_process_water_mdoe_led	equ	__end_of_app_process_water_mdoe_led-_app_process_water_mdoe_led
	
_app_process_water_mdoe_led:	
;incstack = 0
	opt	stack 2
; Regs used in _app_process_water_mdoe_led: [wreg+status,2+status,0+pclath+cstack]
	line	149
	
l6869:	
;app_water_process.c: 149: if (!water_work_step)
	movf	((_water_work_step)),w
	btfss	status,2
	goto	u2351
	goto	u2350
u2351:
	goto	l6875
u2350:
	line	151
	
l6871:	
;app_water_process.c: 150: {
;app_water_process.c: 151: water_mode_led_cnt = (100UL * (10));
	movlw	0E8h
	movwf	(_water_mode_led_cnt)
	movlw	03h
	movwf	((_water_mode_led_cnt))+1
	line	152
	
l6873:	
;app_water_process.c: 152: water_work_step++;
	incf	(_water_work_step),f
	line	153
;app_water_process.c: 153: }
	goto	l4842
	line	156
	
l6875:	
;app_water_process.c: 154: else
;app_water_process.c: 155: {
;app_water_process.c: 156: water_work_mode.water_mode_count++;
	incf	0+(_water_work_mode)+02h,f
	skipnz
	incf	1+(_water_work_mode)+02h,f
	line	157
	
l6877:	
;app_water_process.c: 157: if (water_mode_led_cnt)
	movf	((_water_mode_led_cnt)),w
iorwf	((_water_mode_led_cnt+1)),w
	btfsc	status,2
	goto	u2361
	goto	u2360
u2361:
	goto	l4842
u2360:
	line	159
	
l6879:	
;app_water_process.c: 158: {
;app_water_process.c: 159: water_mode_led_cnt--;
	movlw	01h
	subwf	(_water_mode_led_cnt),f
	movlw	0
	skipc
	decf	(_water_mode_led_cnt+1),f
	subwf	(_water_mode_led_cnt+1),f
	line	160
	
l6881:	
;app_water_process.c: 160: if (!water_mode_led_cnt)
	movf	((_water_mode_led_cnt)),w
iorwf	((_water_mode_led_cnt+1)),w
	btfss	status,2
	goto	u2371
	goto	u2370
u2371:
	goto	l4842
u2370:
	line	163
	
l6883:	
;app_water_process.c: 161: {
;app_water_process.c: 163: app_process_set_water_state(WATER_WORK_STATE_POWEROFF);
	movlw	low(0)
	fcall	_app_process_set_water_state
	line	167
	
l4842:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_water_mdoe_led
	__end_of_app_process_water_mdoe_led:
	signat	_app_process_water_mdoe_led,89
	global	_app_process_work

;; *************** function _app_process_work *****************
;; Defined at:
;;		line 209 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_app_process_charing
;;		_app_process_power_off
;;		_app_process_working
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
	line	209
global __ptext8
__ptext8:	;psect for function _app_process_work
psect	text8
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
	line	209
	global	__size_of_app_process_work
	__size_of_app_process_work	equ	__end_of_app_process_work-_app_process_work
	
_app_process_work:	
;incstack = 0
	opt	stack 1
; Regs used in _app_process_work: [wreg+status,2+status,0+pclath+cstack]
	line	220
	
l7075:	
;app_process.c: 220: if (app_work_state == WORK_STATE_POWEROFF)
	movf	((_app_work_state)),w	;volatile
	btfss	status,2
	goto	u2871
	goto	u2870
u2871:
	goto	l7079
u2870:
	line	222
	
l7077:	
;app_process.c: 221: {
;app_process.c: 222: app_process_power_off();
	fcall	_app_process_power_off
	line	224
	
l7079:	
;app_process.c: 223: }
;app_process.c: 224: if (app_work_state == WORK_STATE_WORKING)
		decf	((_app_work_state)),w	;volatile
	btfss	status,2
	goto	u2881
	goto	u2880
u2881:
	goto	l7083
u2880:
	line	226
	
l7081:	
;app_process.c: 225: {
;app_process.c: 226: app_process_working();
	fcall	_app_process_working
	line	228
	
l7083:	
;app_process.c: 227: }
;app_process.c: 228: if (app_work_state == WORK_STATE_CHARGING)
		movlw	2
	xorwf	((_app_work_state)),w	;volatile
	btfss	status,2
	goto	u2891
	goto	u2890
u2891:
	goto	l2790
u2890:
	line	230
	
l7085:	
;app_process.c: 229: {
;app_process.c: 230: app_process_charing();
	fcall	_app_process_charing
	line	236
	
l2790:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_work
	__end_of_app_process_work:
	signat	_app_process_work,89
	global	_app_process_working

;; *************** function _app_process_working *****************
;; Defined at:
;;		line 41 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_app_process_set_work_state
;;		_work_chang_timing
;; This function is called by:
;;		_app_process_work
;; This function uses a non-reentrant model
;;
psect	text9,local,class=CODE,delta=2,merge=1,group=0
	line	41
global __ptext9
__ptext9:	;psect for function _app_process_working
psect	text9
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
	line	41
	global	__size_of_app_process_working
	__size_of_app_process_working	equ	__end_of_app_process_working-_app_process_working
	
_app_process_working:	
;incstack = 0
	opt	stack 2
; Regs used in _app_process_working: [wreg+status,2+status,0+pclath+cstack]
	line	43
	
l6737:	
;app_process.c: 43: if (!work_step)
	movf	((_work_step)),w
	btfss	status,2
	goto	u2201
	goto	u2200
u2201:
	goto	l6741
u2200:
	line	46
	
l6739:	
;app_process.c: 44: {
;app_process.c: 46: work_step++;
	incf	(_work_step),f
	line	47
;app_process.c: 47: }
	goto	l2766
	line	50
	
l6741:	
;app_process.c: 48: else
;app_process.c: 49: {
;app_process.c: 50: work_chang_timing();
	fcall	_work_chang_timing
	line	51
	
l6743:	
;app_process.c: 51: work_mode.work_mode_count++;
	bcf	status, 5	;RP0=0, select bank0
	incf	0+(_work_mode)+02h,f
	skipnz
	incf	1+(_work_mode)+02h,f
	line	52
	
l6745:	
;app_process.c: 52: if (work_mode.work_mode_count == (100UL * (30)))
		movlw	184
	xorwf	(0+(_work_mode)+02h),w
	movlw	11
	skipnz
	xorwf	(1+(_work_mode)+02h),w
	btfss	status,2
	goto	u2211
	goto	u2210
u2211:
	goto	l6749
u2210:
	line	54
	
l6747:	
;app_process.c: 53: {
;app_process.c: 54: work_mode.mode_out_put = WORK_MODE_IDEL;
	clrf	0+(_work_mode)+01h
	line	55
;app_process.c: 55: }
	goto	l2766
	line	56
	
l6749:	
;app_process.c: 56: else if (work_mode.work_mode_count >= (100UL * (30)) + ((200) / 10))
	movlw	0Bh
	subwf	1+(_work_mode)+02h,w
	movlw	0CCh
	skipnz
	subwf	0+(_work_mode)+02h,w
	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l2766
u2220:
	line	58
	
l6751:	
;app_process.c: 57: {
;app_process.c: 58: work_mode.work_mode_count = 0;
	clrf	0+(_work_mode)+02h
	clrf	1+(_work_mode)+02h
	line	59
	
l6753:	
;app_process.c: 59: work_mode.times++;
	incf	0+(_work_mode)+04h,f
	line	60
	
l6755:	
;app_process.c: 60: if(work_mode.times >= 4)
	movlw	low(04h)
	subwf	0+(_work_mode)+04h,w
	skipc
	goto	u2231
	goto	u2230
u2231:
	goto	l6767
u2230:
	line	62
	
l6757:	
;app_process.c: 61: {
;app_process.c: 62: work_mode.times = 0;
	clrf	0+(_work_mode)+04h
	line	63
	
l6759:	
;app_process.c: 63: if (app_charge.Remind)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(_app_charge)^080h,4
	goto	u2241
	goto	u2240
u2241:
	goto	l6765
u2240:
	line	65
	
l6761:	
;app_process.c: 64: {
;app_process.c: 65: app_charge.flag_remind_delay_10s = 1;
	clrf	0+(_app_charge)^080h+02h
	incf	0+(_app_charge)^080h+02h,f
	line	66
	
l6763:	
;app_process.c: 66: app_charge.remind_delay_10s_timer = 0;
	clrf	0+(_app_charge)^080h+03h
	clrf	1+(_app_charge)^080h+03h
	line	68
	
l6765:	
;app_process.c: 67: }
;app_process.c: 68: app_process_set_work_state(WORK_STATE_POWEROFF);
	movlw	low(0)
	fcall	_app_process_set_work_state
	line	69
;app_process.c: 69: }
	goto	l2766
	line	72
	
l6767:	
;app_process.c: 70: else
;app_process.c: 71: {
;app_process.c: 72: work_mode.mode_out_put = work_mode.mode;
	movf	(_work_mode),w
	movwf	0+(_work_mode)+01h
	line	76
	
l2766:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_working
	__end_of_app_process_working:
	signat	_app_process_working,89
	global	_work_chang_timing

;; *************** function _work_chang_timing *****************
;; Defined at:
;;		line 3 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_timer.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_app_process_working
;; This function uses a non-reentrant model
;;
psect	text10,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_timer.c"
	line	3
global __ptext10
__ptext10:	;psect for function _work_chang_timing
psect	text10
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_timer.c"
	line	3
	global	__size_of_work_chang_timing
	__size_of_work_chang_timing	equ	__end_of_work_chang_timing-_work_chang_timing
	
_work_chang_timing:	
;incstack = 0
	opt	stack 2
; Regs used in _work_chang_timing: [wreg+status,2+status,0]
	line	5
	
l6361:	
;app_timer.c: 5: if (app_timer.work_updown_count)
	bsf	status, 5	;RP0=1, select bank1
	movf	3+(_app_timer)^080h+02h,w
	iorwf	2+(_app_timer)^080h+02h,w
	iorwf	1+(_app_timer)^080h+02h,w
	iorwf	0+(_app_timer)^080h+02h,w
	skipnz
	goto	u1501
	goto	u1500
u1501:
	goto	l3256
u1500:
	line	7
	
l6363:	
;app_timer.c: 6: {
;app_timer.c: 7: app_timer.work_updown_count--;
	movlw	01h
	subwf	0+(_app_timer)^080h+02h,f
	movlw	0
	skipc
	movlw	high(01h)+1
	subwf	1+(_app_timer)^080h+02h,f
	movlw	0
	skipc
	movlw	low highword(01h)+1
	subwf	2+(_app_timer)^080h+02h,f
	movlw	0
	skipc
	movlw	high highword(01h)+1
	subwf	3+(_app_timer)^080h+02h,f
	line	13
	
l3256:	
	return
	opt stack 0
GLOBAL	__end_of_work_chang_timing
	__end_of_work_chang_timing:
	signat	_work_chang_timing,89
	global	_app_process_charing

;; *************** function _app_process_charing *****************
;; Defined at:
;;		line 99 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_app_process_power_off
;;		_app_process_set_water_state
;; This function is called by:
;;		_app_process_work
;; This function uses a non-reentrant model
;;
psect	text11,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
	line	99
global __ptext11
__ptext11:	;psect for function _app_process_charing
psect	text11
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
	line	99
	global	__size_of_app_process_charing
	__size_of_app_process_charing	equ	__end_of_app_process_charing-_app_process_charing
	
_app_process_charing:	
;incstack = 0
	opt	stack 1
; Regs used in _app_process_charing: [wreg+status,2+status,0+pclath+cstack]
	line	101
	
l6829:	
;app_process.c: 101: if (!work_step)
	movf	((_work_step)),w
	btfss	status,2
	goto	u2291
	goto	u2290
u2291:
	goto	l2779
u2290:
	line	103
	
l6831:	
;app_process.c: 102: {
;app_process.c: 103: app_process_power_off();
	fcall	_app_process_power_off
	line	104
;app_process.c: 104: app_process_set_water_state(WATER_WORK_STATE_POWEROFF);
	movlw	low(0)
	fcall	_app_process_set_water_state
	line	105
	
l6833:	
;app_process.c: 105: app_timer.charge_to_oldmode_count = (100UL * (8));
	movlw	020h
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_app_timer)^080h+08h
	movlw	03h
	movwf	(0+(_app_timer)^080h+08h)+1
	line	106
	
l6835:	
;app_process.c: 106: work_step++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_work_step),f
	line	126
;app_process.c: 107: }
	
l2779:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_charing
	__end_of_app_process_charing:
	signat	_app_process_charing,89
	global	_app_process_power_off

;; *************** function _app_process_power_off *****************
;; Defined at:
;;		line 78 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_set_led_state
;; This function is called by:
;;		_app_process_charing
;;		_app_process_work
;; This function uses a non-reentrant model
;;
psect	text12,local,class=CODE,delta=2,merge=1,group=0
	line	78
global __ptext12
__ptext12:	;psect for function _app_process_power_off
psect	text12
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
	line	78
	global	__size_of_app_process_power_off
	__size_of_app_process_power_off	equ	__end_of_app_process_power_off-_app_process_power_off
	
_app_process_power_off:	
;incstack = 0
	opt	stack 2
; Regs used in _app_process_power_off: [wreg+status,2+status,0+pclath+cstack]
	line	80
	
l6365:	
;app_process.c: 80: work_mode.work_mode_count = 0;
	clrf	0+(_work_mode)+02h
	clrf	1+(_work_mode)+02h
	line	81
;app_process.c: 81: work_mode.times = 0;
	clrf	0+(_work_mode)+04h
	line	82
;app_process.c: 82: work_mode.mode_out_put = WORK_MODE_IDEL;
	clrf	0+(_work_mode)+01h
	line	83
	
l6367:	
;app_process.c: 83: set_led_state(LED_INDEX_1 | LED_INDEX_2 | LED_INDEX_3, LED_STATE_OFF);
	movlw	07h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	fcall	_set_led_state
	line	84
	
l2769:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_power_off
	__end_of_app_process_power_off:
	signat	_app_process_power_off,89
	global	_app_process_key

;; *************** function _app_process_key *****************
;; Defined at:
;;		line 309 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_charge_or_lowBat_check
;;		_handle_key_pwr
;;		_handle_key_water
;;		_key_brush_pwr_check
;;		_key_water_mode_check
;;		_key_water_pwr_check
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text13,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
	line	309
global __ptext13
__ptext13:	;psect for function _app_process_key
psect	text13
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
	line	309
	global	__size_of_app_process_key
	__size_of_app_process_key	equ	__end_of_app_process_key-_app_process_key
	
_app_process_key:	
;incstack = 0
	opt	stack 0
; Regs used in _app_process_key: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	311
	
l6897:	
;app_key.c: 311: key_brush_pwr_check();
	fcall	_key_brush_pwr_check
	line	312
;app_key.c: 312: key_water_pwr_check();
	fcall	_key_water_pwr_check
	line	313
;app_key.c: 313: key_water_mode_check();
	fcall	_key_water_mode_check
	line	314
;app_key.c: 314: charge_or_lowBat_check();
	fcall	_charge_or_lowBat_check
	line	315
	
l6899:	
;app_key.c: 315: handle_key_pwr();
	fcall	_handle_key_pwr
	line	316
	
l6901:	
;app_key.c: 316: handle_key_water();
	fcall	_handle_key_water
	line	317
	
l1663:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_key
	__end_of_app_process_key:
	signat	_app_process_key,89
	global	_key_water_pwr_check

;; *************** function _key_water_pwr_check *****************
;; Defined at:
;;		line 60 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_app_process_key
;; This function uses a non-reentrant model
;;
psect	text14,local,class=CODE,delta=2,merge=1,group=0
	line	60
global __ptext14
__ptext14:	;psect for function _key_water_pwr_check
psect	text14
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
	line	60
	global	__size_of_key_water_pwr_check
	__size_of_key_water_pwr_check	equ	__end_of_key_water_pwr_check-_key_water_pwr_check
	
_key_water_pwr_check:	
;incstack = 0
	opt	stack 3
; Regs used in _key_water_pwr_check: [wreg+status,2+status,0]
	line	62
	
l6581:	
;app_key.c: 62: if(!RB0)
	btfsc	(48/8),(48)&7	;volatile
	goto	u1871
	goto	u1870
u1871:
	goto	l6595
u1870:
	line	64
	
l6583:	
;app_key.c: 63: {
;app_key.c: 64: if(KeyPressCnt2 < 200)
	movlw	0
	subwf	(_KeyPressCnt2+1),w	;volatile
	movlw	0C8h
	skipnz
	subwf	(_KeyPressCnt2),w	;volatile
	skipnc
	goto	u1881
	goto	u1880
u1881:
	goto	l6587
u1880:
	line	66
	
l6585:	
;app_key.c: 65: {
;app_key.c: 66: KeyPressCnt2++;
	incf	(_KeyPressCnt2),f	;volatile
	skipnz
	incf	(_KeyPressCnt2+1),f	;volatile
	line	68
	
l6587:	
;app_key.c: 67: }
;app_key.c: 68: if(KeyPressCnt2 >= 2)
	movlw	0
	subwf	(_KeyPressCnt2+1),w	;volatile
	movlw	02h
	skipnz
	subwf	(_KeyPressCnt2),w	;volatile
	skipc
	goto	u1891
	goto	u1890
u1891:
	goto	l6591
u1890:
	line	70
	
l6589:	
;app_key.c: 69: {
;app_key.c: 70: KeyRelaxCnt2 = 0;
	clrf	(_KeyRelaxCnt2)	;volatile
	line	76
	
l6591:	
;app_key.c: 71: }
;app_key.c: 76: if(KeyPressCnt2 == 200)
		movlw	200
	xorwf	((_KeyPressCnt2)),w	;volatile
iorwf	((_KeyPressCnt2+1)),w	;volatile
	btfss	status,2
	goto	u1901
	goto	u1900
u1901:
	goto	l1601
u1900:
	line	78
	
l6593:	
;app_key.c: 77: {
;app_key.c: 78: KeyPressCnt2 = 201;
	movlw	0C9h
	movwf	(_KeyPressCnt2)	;volatile
	clrf	(_KeyPressCnt2+1)	;volatile
	line	80
;app_key.c: 80: key_water_pwr_type = KEY_TYPE_LONG_LONG;
	movlw	low(03h)
	movwf	(_key_water_pwr_type)
	goto	l1601
	line	85
	
l6595:	
;app_key.c: 83: else
;app_key.c: 84: {
;app_key.c: 85: if(KeyRelaxCnt2 < 2)
	movlw	low(02h)
	subwf	(_KeyRelaxCnt2),w	;volatile
	skipnc
	goto	u1911
	goto	u1910
u1911:
	goto	l6599
u1910:
	line	87
	
l6597:	
;app_key.c: 86: {
;app_key.c: 87: KeyRelaxCnt2++;
	incf	(_KeyRelaxCnt2),f	;volatile
	line	88
;app_key.c: 88: }
	goto	l1601
	line	91
	
l6599:	
;app_key.c: 89: else
;app_key.c: 90: {
;app_key.c: 91: if(KeyPressCnt2 >= 3 && KeyPressCnt2 <= 50)
	movlw	0
	subwf	(_KeyPressCnt2+1),w	;volatile
	movlw	03h
	skipnz
	subwf	(_KeyPressCnt2),w	;volatile
	skipc
	goto	u1921
	goto	u1920
u1921:
	goto	l6605
u1920:
	
l6601:	
	movlw	0
	subwf	(_KeyPressCnt2+1),w	;volatile
	movlw	033h
	skipnz
	subwf	(_KeyPressCnt2),w	;volatile
	skipnc
	goto	u1931
	goto	u1930
u1931:
	goto	l6605
u1930:
	line	94
	
l6603:	
;app_key.c: 92: {
;app_key.c: 94: key_water_pwr_type = KEY_TYPE_SHORT;
	movlw	low(05h)
	movwf	(_key_water_pwr_type)
	line	96
	
l6605:	
;app_key.c: 95: }
;app_key.c: 96: KeyPressCnt2 = 0;
	clrf	(_KeyPressCnt2)	;volatile
	clrf	(_KeyPressCnt2+1)	;volatile
	line	99
	
l1601:	
	return
	opt stack 0
GLOBAL	__end_of_key_water_pwr_check
	__end_of_key_water_pwr_check:
	signat	_key_water_pwr_check,89
	global	_key_water_mode_check

;; *************** function _key_water_mode_check *****************
;; Defined at:
;;		line 100 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_app_process_key
;; This function uses a non-reentrant model
;;
psect	text15,local,class=CODE,delta=2,merge=1,group=0
	line	100
global __ptext15
__ptext15:	;psect for function _key_water_mode_check
psect	text15
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
	line	100
	global	__size_of_key_water_mode_check
	__size_of_key_water_mode_check	equ	__end_of_key_water_mode_check-_key_water_mode_check
	
_key_water_mode_check:	
;incstack = 0
	opt	stack 3
; Regs used in _key_water_mode_check: [wreg+status,2+status,0]
	line	102
	
l6607:	
;app_key.c: 102: if(!RB1)
	btfsc	(49/8),(49)&7	;volatile
	goto	u1941
	goto	u1940
u1941:
	goto	l6621
u1940:
	line	104
	
l6609:	
;app_key.c: 103: {
;app_key.c: 104: if(KeyPressCnt3 < 200)
	movlw	0
	subwf	(_KeyPressCnt3+1),w	;volatile
	movlw	0C8h
	skipnz
	subwf	(_KeyPressCnt3),w	;volatile
	skipnc
	goto	u1951
	goto	u1950
u1951:
	goto	l6613
u1950:
	line	106
	
l6611:	
;app_key.c: 105: {
;app_key.c: 106: KeyPressCnt3++;
	incf	(_KeyPressCnt3),f	;volatile
	skipnz
	incf	(_KeyPressCnt3+1),f	;volatile
	line	108
	
l6613:	
;app_key.c: 107: }
;app_key.c: 108: if(KeyPressCnt3 >= 2)
	movlw	0
	subwf	(_KeyPressCnt3+1),w	;volatile
	movlw	02h
	skipnz
	subwf	(_KeyPressCnt3),w	;volatile
	skipc
	goto	u1961
	goto	u1960
u1961:
	goto	l6617
u1960:
	line	110
	
l6615:	
;app_key.c: 109: {
;app_key.c: 110: KeyRelaxCnt3 = 0;
	clrf	(_KeyRelaxCnt3)	;volatile
	line	116
	
l6617:	
;app_key.c: 111: }
;app_key.c: 116: if(KeyPressCnt3 == 200)
		movlw	200
	xorwf	((_KeyPressCnt3)),w	;volatile
iorwf	((_KeyPressCnt3+1)),w	;volatile
	btfss	status,2
	goto	u1971
	goto	u1970
u1971:
	goto	l1612
u1970:
	line	118
	
l6619:	
;app_key.c: 117: {
;app_key.c: 118: KeyPressCnt3 = 201;
	movlw	0C9h
	movwf	(_KeyPressCnt3)	;volatile
	clrf	(_KeyPressCnt3+1)	;volatile
	line	120
;app_key.c: 120: key_water_mode_type = KEY_TYPE_LONG_LONG;
	movlw	low(03h)
	movwf	(_key_water_mode_type)
	goto	l1612
	line	125
	
l6621:	
;app_key.c: 123: else
;app_key.c: 124: {
;app_key.c: 125: if(KeyRelaxCnt3 < 2)
	movlw	low(02h)
	subwf	(_KeyRelaxCnt3),w	;volatile
	skipnc
	goto	u1981
	goto	u1980
u1981:
	goto	l6625
u1980:
	line	127
	
l6623:	
;app_key.c: 126: {
;app_key.c: 127: KeyRelaxCnt3++;
	incf	(_KeyRelaxCnt3),f	;volatile
	line	128
;app_key.c: 128: }
	goto	l1612
	line	131
	
l6625:	
;app_key.c: 129: else
;app_key.c: 130: {
;app_key.c: 131: if(KeyPressCnt3 >= 3 && KeyPressCnt3 <= 50)
	movlw	0
	subwf	(_KeyPressCnt3+1),w	;volatile
	movlw	03h
	skipnz
	subwf	(_KeyPressCnt3),w	;volatile
	skipc
	goto	u1991
	goto	u1990
u1991:
	goto	l6631
u1990:
	
l6627:	
	movlw	0
	subwf	(_KeyPressCnt3+1),w	;volatile
	movlw	033h
	skipnz
	subwf	(_KeyPressCnt3),w	;volatile
	skipnc
	goto	u2001
	goto	u2000
u2001:
	goto	l6631
u2000:
	line	134
	
l6629:	
;app_key.c: 132: {
;app_key.c: 134: key_water_mode_type = KEY_TYPE_SHORT;
	movlw	low(05h)
	movwf	(_key_water_mode_type)
	line	136
	
l6631:	
;app_key.c: 135: }
;app_key.c: 136: KeyPressCnt3 = 0;
	clrf	(_KeyPressCnt3)	;volatile
	clrf	(_KeyPressCnt3+1)	;volatile
	line	139
	
l1612:	
	return
	opt stack 0
GLOBAL	__end_of_key_water_mode_check
	__end_of_key_water_mode_check:
	signat	_key_water_mode_check,89
	global	_key_brush_pwr_check

;; *************** function _key_brush_pwr_check *****************
;; Defined at:
;;		line 19 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_app_process_key
;; This function uses a non-reentrant model
;;
psect	text16,local,class=CODE,delta=2,merge=1,group=0
	line	19
global __ptext16
__ptext16:	;psect for function _key_brush_pwr_check
psect	text16
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
	line	19
	global	__size_of_key_brush_pwr_check
	__size_of_key_brush_pwr_check	equ	__end_of_key_brush_pwr_check-_key_brush_pwr_check
	
_key_brush_pwr_check:	
;incstack = 0
	opt	stack 3
; Regs used in _key_brush_pwr_check: [wreg+status,2+status,0]
	line	21
	
l6555:	
;app_key.c: 21: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(50/8),(50)&7	;volatile
	goto	u1801
	goto	u1800
u1801:
	goto	l6569
u1800:
	line	23
	
l6557:	
;app_key.c: 22: {
;app_key.c: 23: if(KeyPressCnt1 < 100)
	movlw	0
	subwf	(_KeyPressCnt1+1),w	;volatile
	movlw	064h
	skipnz
	subwf	(_KeyPressCnt1),w	;volatile
	skipnc
	goto	u1811
	goto	u1810
u1811:
	goto	l6561
u1810:
	line	25
	
l6559:	
;app_key.c: 24: {
;app_key.c: 25: KeyPressCnt1++;
	incf	(_KeyPressCnt1),f	;volatile
	skipnz
	incf	(_KeyPressCnt1+1),f	;volatile
	line	27
	
l6561:	
;app_key.c: 26: }
;app_key.c: 27: if(KeyPressCnt1 >= 2)
	movlw	0
	subwf	(_KeyPressCnt1+1),w	;volatile
	movlw	02h
	skipnz
	subwf	(_KeyPressCnt1),w	;volatile
	skipc
	goto	u1821
	goto	u1820
u1821:
	goto	l6565
u1820:
	line	29
	
l6563:	
;app_key.c: 28: {
;app_key.c: 29: KeyRelaxCnt1 = 0;
	clrf	(_KeyRelaxCnt1)	;volatile
	line	35
	
l6565:	
;app_key.c: 30: }
;app_key.c: 35: if(KeyPressCnt1 == 100)
		movlw	100
	xorwf	((_KeyPressCnt1)),w	;volatile
iorwf	((_KeyPressCnt1+1)),w	;volatile
	btfss	status,2
	goto	u1831
	goto	u1830
u1831:
	goto	l1590
u1830:
	line	37
	
l6567:	
;app_key.c: 36: {
;app_key.c: 37: KeyPressCnt1 = 101;
	movlw	065h
	movwf	(_KeyPressCnt1)	;volatile
	clrf	(_KeyPressCnt1+1)	;volatile
	line	39
;app_key.c: 39: key_brush_pwrtype = KEY_TYPE_LONG;
	movlw	low(02h)
	movwf	(_key_brush_pwrtype)
	goto	l1590
	line	44
	
l6569:	
;app_key.c: 42: else
;app_key.c: 43: {
;app_key.c: 44: if(KeyRelaxCnt1 < 2)
	movlw	low(02h)
	subwf	(_KeyRelaxCnt1),w	;volatile
	skipnc
	goto	u1841
	goto	u1840
u1841:
	goto	l6573
u1840:
	line	46
	
l6571:	
;app_key.c: 45: {
;app_key.c: 46: KeyRelaxCnt1++;
	incf	(_KeyRelaxCnt1),f	;volatile
	line	47
;app_key.c: 47: }
	goto	l1590
	line	50
	
l6573:	
;app_key.c: 48: else
;app_key.c: 49: {
;app_key.c: 50: if(KeyPressCnt1 >= 3 && KeyPressCnt1 <= 50)
	movlw	0
	subwf	(_KeyPressCnt1+1),w	;volatile
	movlw	03h
	skipnz
	subwf	(_KeyPressCnt1),w	;volatile
	skipc
	goto	u1851
	goto	u1850
u1851:
	goto	l6579
u1850:
	
l6575:	
	movlw	0
	subwf	(_KeyPressCnt1+1),w	;volatile
	movlw	033h
	skipnz
	subwf	(_KeyPressCnt1),w	;volatile
	skipnc
	goto	u1861
	goto	u1860
u1861:
	goto	l6579
u1860:
	line	53
	
l6577:	
;app_key.c: 51: {
;app_key.c: 53: key_brush_pwrtype = KEY_TYPE_SHORT;
	movlw	low(05h)
	movwf	(_key_brush_pwrtype)
	line	55
	
l6579:	
;app_key.c: 54: }
;app_key.c: 55: KeyPressCnt1 = 0;
	clrf	(_KeyPressCnt1)	;volatile
	clrf	(_KeyPressCnt1+1)	;volatile
	line	58
	
l1590:	
	return
	opt stack 0
GLOBAL	__end_of_key_brush_pwr_check
	__end_of_key_brush_pwr_check:
	signat	_key_brush_pwr_check,89
	global	_handle_key_water

;; *************** function _handle_key_water *****************
;; Defined at:
;;		line 245 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_app_led_water_mode_set
;;		_app_process_set_water_mode_next
;;		_app_process_set_water_state
;;		_water_motor
;; This function is called by:
;;		_app_process_key
;; This function uses a non-reentrant model
;;
psect	text17,local,class=CODE,delta=2,merge=1,group=0
	line	245
global __ptext17
__ptext17:	;psect for function _handle_key_water
psect	text17
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
	line	245
	global	__size_of_handle_key_water
	__size_of_handle_key_water	equ	__end_of_handle_key_water-_handle_key_water
	
_handle_key_water:	
;incstack = 0
	opt	stack 1
; Regs used in _handle_key_water: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	247
	
l6679:	
;app_key.c: 247: switch (key_water_pwr_type)
	goto	l6711
	line	250
	
l6681:	
;app_key.c: 250: if (water_work_state == WATER_WORK_STATE_WORKING)
		decf	((_water_work_state)),w	;volatile
	btfss	status,2
	goto	u2111
	goto	u2110
u2111:
	goto	l6693
u2110:
	line	252
	
l6683:	
;app_key.c: 251: {
;app_key.c: 252: if (app_work_state == WORK_STATE_POWEROFF)
	movf	((_app_work_state)),w	;volatile
	btfss	status,2
	goto	u2121
	goto	u2120
u2121:
	goto	l6691
u2120:
	line	254
	
l6685:	
;app_key.c: 253: {
;app_key.c: 254: if (app_charge.Remind)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(_app_charge)^080h,4
	goto	u2131
	goto	u2130
u2131:
	goto	l6691
u2130:
	line	256
	
l6687:	
;app_key.c: 255: {
;app_key.c: 256: app_charge.flag_remind_delay_10s = 1;
	clrf	0+(_app_charge)^080h+02h
	incf	0+(_app_charge)^080h+02h,f
	line	257
	
l6689:	
;app_key.c: 257: app_charge.remind_delay_10s_timer = 0;
	clrf	0+(_app_charge)^080h+03h
	clrf	1+(_app_charge)^080h+03h
	line	260
	
l6691:	
;app_key.c: 258: }
;app_key.c: 259: }
;app_key.c: 260: app_process_set_water_state(WATER_WORK_STATE_POWEROFF);
	movlw	low(0)
	fcall	_app_process_set_water_state
	line	261
;app_key.c: 261: }
	goto	l6707
	line	262
	
l6693:	
;app_key.c: 262: else if (water_work_state == WATER_WORK_STATE_POWEROFF || app_charge.flag_remind_delay_10s || water_work_state == WATER_WORK_STATE_MODE_LED)
	movf	((_water_work_state)),w	;volatile
	btfsc	status,2
	goto	u2141
	goto	u2140
u2141:
	goto	l6699
u2140:
	
l6695:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(0+(_app_charge)^080h+02h),w
	btfss	status,2
	goto	u2151
	goto	u2150
u2151:
	goto	l6699
u2150:
	
l6697:	
		movlw	3
	bcf	status, 5	;RP0=0, select bank0
	xorwf	((_water_work_state)),w	;volatile
	btfss	status,2
	goto	u2161
	goto	u2160
u2161:
	goto	l6707
u2160:
	line	264
	
l6699:	
;app_key.c: 263: {
;app_key.c: 264: app_charge.flag_remind_delay_10s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_app_charge)^080h+02h
	line	265
	
l6701:	
;app_key.c: 265: app_led_water_mode_set();
	fcall	_app_led_water_mode_set
	line	266
	
l6703:	
;app_key.c: 266: water_motor();
	fcall	_water_motor
	line	267
	
l6705:	
;app_key.c: 267: app_process_set_water_state(WATER_WORK_STATE_WORKING);
	movlw	low(01h)
	fcall	_app_process_set_water_state
	line	269
	
l6707:	
;app_key.c: 268: }
;app_key.c: 269: key_water_pwr_type = KEY_TYPE_IDLE;
	clrf	(_key_water_pwr_type)
	line	270
;app_key.c: 270: break;
	goto	l6713
	line	247
	
l6711:	
	movf	(_key_water_pwr_type),w
	; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 5 to 5
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           10     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	5^0	; case 5
	skipnz
	goto	l6681
	goto	l6713
	opt asmopt_pop

	line	275
	
l6713:	
;app_key.c: 275: key_water_pwr_type = KEY_TYPE_IDLE;
	clrf	(_key_water_pwr_type)
	line	277
;app_key.c: 277: switch (key_water_mode_type)
	goto	l6731
	line	280
	
l6715:	
;app_key.c: 280: if (water_work_state == WATER_WORK_STATE_WORKING)
		decf	((_water_work_state)),w	;volatile
	btfss	status,2
	goto	u2171
	goto	u2170
u2171:
	goto	l6719
u2170:
	line	282
	
l6717:	
;app_key.c: 281: {
;app_key.c: 282: app_process_set_water_mode_next();
	fcall	_app_process_set_water_mode_next
	line	283
;app_key.c: 283: app_led_water_mode_set();
	fcall	_app_led_water_mode_set
	line	284
;app_key.c: 284: water_motor();
	fcall	_water_motor
	line	285
;app_key.c: 285: }
	goto	l6727
	line	286
	
l6719:	
;app_key.c: 286: else if (water_work_state == WATER_WORK_STATE_POWEROFF)
	movf	((_water_work_state)),w	;volatile
	btfss	status,2
	goto	u2181
	goto	u2180
u2181:
	goto	l6723
u2180:
	line	288
	
l6721:	
;app_key.c: 287: {
;app_key.c: 288: app_process_set_water_state(WATER_WORK_STATE_MODE_LED);
	movlw	low(03h)
	fcall	_app_process_set_water_state
	line	289
;app_key.c: 289: app_led_water_mode_set();
	fcall	_app_led_water_mode_set
	line	290
;app_key.c: 290: }
	goto	l6727
	line	291
	
l6723:	
;app_key.c: 291: else if (water_work_state == WATER_WORK_STATE_MODE_LED)
		movlw	3
	xorwf	((_water_work_state)),w	;volatile
	btfss	status,2
	goto	u2191
	goto	u2190
u2191:
	goto	l6727
u2190:
	line	293
	
l6725:	
;app_key.c: 292: {
;app_key.c: 293: app_process_set_water_state(WATER_WORK_STATE_MODE_LED);
	movlw	low(03h)
	fcall	_app_process_set_water_state
	line	294
;app_key.c: 294: app_process_set_water_mode_next();
	fcall	_app_process_set_water_mode_next
	line	295
;app_key.c: 295: app_led_water_mode_set();
	fcall	_app_led_water_mode_set
	line	297
	
l6727:	
;app_key.c: 296: }
;app_key.c: 297: key_water_mode_type = KEY_TYPE_IDLE;
	clrf	(_key_water_mode_type)
	line	298
;app_key.c: 298: break;
	goto	l6733
	line	277
	
l6731:	
	movf	(_key_water_mode_type),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 2 to 5
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte           13     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	2^0	; case 2
	skipnz
	goto	l6733
	xorlw	5^2	; case 5
	skipnz
	goto	l6715
	goto	l6733
	opt asmopt_pop

	line	306
	
l6733:	
;app_key.c: 306: key_water_mode_type = KEY_TYPE_IDLE;
	clrf	(_key_water_mode_type)
	line	307
	
l1660:	
	return
	opt stack 0
GLOBAL	__end_of_handle_key_water
	__end_of_handle_key_water:
	signat	_handle_key_water,89
	global	_water_motor

;; *************** function _water_motor *****************
;; Defined at:
;;		line 23 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_handle_key_water
;; This function uses a non-reentrant model
;;
psect	text18,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
	line	23
global __ptext18
__ptext18:	;psect for function _water_motor
psect	text18
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
	line	23
	global	__size_of_water_motor
	__size_of_water_motor	equ	__end_of_water_motor-_water_motor
	
_water_motor:	
;incstack = 0
	opt	stack 2
; Regs used in _water_motor: [wreg+status,2+status,0]
	line	25
	
l6335:	
;app_water_process.c: 25: if (water_work_mode.water_mode == WATER_WORK_MODE_ONE)
		decf	((_water_work_mode)),w
	btfss	status,2
	goto	u1441
	goto	u1440
u1441:
	goto	l6339
u1440:
	line	28
	
l6337:	
;app_water_process.c: 26: {
;app_water_process.c: 28: MotorWaterDuty=36;
	movlw	low(024h)
	movwf	(_MotorWaterDuty)
	line	30
	
l6339:	
;app_water_process.c: 29: }
;app_water_process.c: 30: if (water_work_mode.water_mode == WATER_WORK_MODE_TWO)
		movlw	2
	xorwf	((_water_work_mode)),w
	btfss	status,2
	goto	u1451
	goto	u1450
u1451:
	goto	l6343
u1450:
	line	33
	
l6341:	
;app_water_process.c: 31: {
;app_water_process.c: 33: MotorWaterDuty=51;
	movlw	low(033h)
	movwf	(_MotorWaterDuty)
	line	35
	
l6343:	
;app_water_process.c: 34: }
;app_water_process.c: 35: if (water_work_mode.water_mode == WATER_WORK_MODE_THREE)
		movlw	3
	xorwf	((_water_work_mode)),w
	btfss	status,2
	goto	u1461
	goto	u1460
u1461:
	goto	l6347
u1460:
	line	38
	
l6345:	
;app_water_process.c: 36: {
;app_water_process.c: 38: MotorWaterDuty=66;
	movlw	low(042h)
	movwf	(_MotorWaterDuty)
	line	40
	
l6347:	
;app_water_process.c: 39: }
;app_water_process.c: 40: if (water_work_mode.water_mode == WATER_WORK_MODE_FOUR)
		movlw	4
	xorwf	((_water_work_mode)),w
	btfss	status,2
	goto	u1471
	goto	u1470
u1471:
	goto	l6351
u1470:
	line	43
	
l6349:	
;app_water_process.c: 41: {
;app_water_process.c: 43: MotorWaterDuty=81;
	movlw	low(051h)
	movwf	(_MotorWaterDuty)
	line	45
	
l6351:	
;app_water_process.c: 44: }
;app_water_process.c: 45: if (water_work_mode.water_mode == WATER_WORK_MODE_FIVE)
		movlw	5
	xorwf	((_water_work_mode)),w
	btfss	status,2
	goto	u1481
	goto	u1480
u1481:
	goto	l4804
u1480:
	line	48
	
l6353:	
;app_water_process.c: 46: {
;app_water_process.c: 48: MotorWaterDuty=96;
	movlw	low(060h)
	movwf	(_MotorWaterDuty)
	line	49
	
l4804:	
	line	50
;app_water_process.c: 49: }
;app_water_process.c: 50: water_work_mode.water_mode_out_put = water_work_mode.water_mode;
	movf	(_water_work_mode),w
	movwf	0+(_water_work_mode)+01h
	line	51
	
l4805:	
	return
	opt stack 0
GLOBAL	__end_of_water_motor
	__end_of_water_motor:
	signat	_water_motor,89
	global	_app_process_set_water_mode_next

;; *************** function _app_process_set_water_mode_next *****************
;; Defined at:
;;		line 59 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_handle_key_water
;; This function uses a non-reentrant model
;;
psect	text19,local,class=CODE,delta=2,merge=1,group=0
	line	59
global __ptext19
__ptext19:	;psect for function _app_process_set_water_mode_next
psect	text19
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
	line	59
	global	__size_of_app_process_set_water_mode_next
	__size_of_app_process_set_water_mode_next	equ	__end_of_app_process_set_water_mode_next-_app_process_set_water_mode_next
	
_app_process_set_water_mode_next:	
;incstack = 0
	opt	stack 2
; Regs used in _app_process_set_water_mode_next: [wreg+status,2+status,0]
	line	61
	
l6355:	
;app_water_process.c: 61: water_work_mode.water_mode++;
	incf	(_water_work_mode),f
	line	62
	
l6357:	
;app_water_process.c: 62: if (water_work_mode.water_mode > WATER_WORK_MODE_FIVE)
	movlw	low(06h)
	subwf	(_water_work_mode),w
	skipc
	goto	u1491
	goto	u1490
u1491:
	goto	l4809
u1490:
	line	64
	
l6359:	
;app_water_process.c: 63: {
;app_water_process.c: 64: water_work_mode.water_mode = WATER_WORK_MODE_ONE;
	clrf	(_water_work_mode)
	incf	(_water_work_mode),f
	line	71
	
l4809:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_set_water_mode_next
	__end_of_app_process_set_water_mode_next:
	signat	_app_process_set_water_mode_next,89
	global	_app_led_water_mode_set

;; *************** function _app_led_water_mode_set *****************
;; Defined at:
;;		line 166 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/100
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_set_led_state
;; This function is called by:
;;		_handle_key_water
;; This function uses a non-reentrant model
;;
psect	text20,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
	line	166
global __ptext20
__ptext20:	;psect for function _app_led_water_mode_set
psect	text20
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
	line	166
	global	__size_of_app_led_water_mode_set
	__size_of_app_led_water_mode_set	equ	__end_of_app_led_water_mode_set-_app_led_water_mode_set
	
_app_led_water_mode_set:	
;incstack = 0
	opt	stack 1
; Regs used in _app_led_water_mode_set: [wreg+status,2+status,0+pclath+cstack]
	line	168
	
l6315:	
;app_led.c: 168: if (water_work_mode.water_mode == WATER_WORK_MODE_ONE)
	bcf	status, 5	;RP0=0, select bank0
		decf	((_water_work_mode)),w
	btfss	status,2
	goto	u1391
	goto	u1390
u1391:
	goto	l6319
u1390:
	line	170
	
l6317:	
;app_led.c: 169: {
;app_led.c: 170: set_led_state(LED_INDEX_8, LED_STATE_ON);
	movlw	080h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	incf	(set_led_state@state),f
	fcall	_set_led_state
	line	171
;app_led.c: 171: set_led_state(LED_INDEX_7 | LED_INDEX_6 | LED_INDEX_5 | LED_INDEX_4, LED_STATE_OFF);
	movlw	078h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	fcall	_set_led_state
	line	172
;app_led.c: 172: }
	goto	l2206
	line	173
	
l6319:	
;app_led.c: 173: else if (water_work_mode.water_mode == WATER_WORK_MODE_TWO)
		movlw	2
	xorwf	((_water_work_mode)),w
	btfss	status,2
	goto	u1401
	goto	u1400
u1401:
	goto	l6323
u1400:
	line	175
	
l6321:	
;app_led.c: 174: {
;app_led.c: 175: set_led_state(LED_INDEX_8 | LED_INDEX_7, LED_STATE_ON);
	movlw	0C0h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	incf	(set_led_state@state),f
	fcall	_set_led_state
	line	176
;app_led.c: 176: set_led_state(LED_INDEX_6 | LED_INDEX_5 | LED_INDEX_4, LED_STATE_OFF);
	movlw	038h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	fcall	_set_led_state
	line	177
;app_led.c: 177: }
	goto	l2206
	line	178
	
l6323:	
;app_led.c: 178: else if (water_work_mode.water_mode == WATER_WORK_MODE_THREE)
		movlw	3
	xorwf	((_water_work_mode)),w
	btfss	status,2
	goto	u1411
	goto	u1410
u1411:
	goto	l6327
u1410:
	line	180
	
l6325:	
;app_led.c: 179: {
;app_led.c: 180: set_led_state(LED_INDEX_8 | LED_INDEX_7 | LED_INDEX_6, LED_STATE_ON);
	movlw	0E0h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	incf	(set_led_state@state),f
	fcall	_set_led_state
	line	181
;app_led.c: 181: set_led_state(LED_INDEX_5 | LED_INDEX_4, LED_STATE_OFF);
	movlw	018h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	fcall	_set_led_state
	line	182
;app_led.c: 182: }
	goto	l2206
	line	183
	
l6327:	
;app_led.c: 183: else if (water_work_mode.water_mode == WATER_WORK_MODE_FOUR)
		movlw	4
	xorwf	((_water_work_mode)),w
	btfss	status,2
	goto	u1421
	goto	u1420
u1421:
	goto	l6331
u1420:
	line	185
	
l6329:	
;app_led.c: 184: {
;app_led.c: 185: set_led_state(LED_INDEX_8 | LED_INDEX_7 | LED_INDEX_6 | LED_INDEX_5, LED_STATE_ON);
	movlw	0F0h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	incf	(set_led_state@state),f
	fcall	_set_led_state
	line	186
;app_led.c: 186: set_led_state(LED_INDEX_4, LED_STATE_OFF);
	movlw	08h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	fcall	_set_led_state
	line	187
;app_led.c: 187: }
	goto	l2206
	line	188
	
l6331:	
;app_led.c: 188: else if (water_work_mode.water_mode == WATER_WORK_MODE_FIVE)
		movlw	5
	xorwf	((_water_work_mode)),w
	btfss	status,2
	goto	u1431
	goto	u1430
u1431:
	goto	l2200
u1430:
	line	190
	
l6333:	
;app_led.c: 189: {
;app_led.c: 190: set_led_state(LED_INDEX_8 | LED_INDEX_7 | LED_INDEX_6 | LED_INDEX_5 | LED_INDEX_4, LED_STATE_ON);
	movlw	0F8h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	incf	(set_led_state@state),f
	fcall	_set_led_state
	goto	l2206
	line	192
	
l2200:	
	
l2206:	
	return
	opt stack 0
GLOBAL	__end_of_app_led_water_mode_set
	__end_of_app_led_water_mode_set:
	signat	_app_led_water_mode_set,89
	global	_handle_key_pwr

;; *************** function _handle_key_pwr *****************
;; Defined at:
;;		line 192 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_app_process_set_mode_init
;;		_app_process_set_mode_next
;;		_app_process_set_work_state
;; This function is called by:
;;		_app_process_key
;; This function uses a non-reentrant model
;;
psect	text21,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
	line	192
global __ptext21
__ptext21:	;psect for function _handle_key_pwr
psect	text21
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
	line	192
	global	__size_of_handle_key_pwr
	__size_of_handle_key_pwr	equ	__end_of_handle_key_pwr-_handle_key_pwr
	
_handle_key_pwr:	
;incstack = 0
	opt	stack 0
; Regs used in _handle_key_pwr: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	194
	
l6647:	
;app_key.c: 194: switch (key_brush_pwrtype)
	goto	l6675
	line	197
	
l6649:	
;app_key.c: 197: if (app_work_state == WORK_STATE_POWEROFF || app_charge.flag_remind_delay_10s)
	movf	((_app_work_state)),w	;volatile
	btfsc	status,2
	goto	u2061
	goto	u2060
u2061:
	goto	l6653
u2060:
	
l6651:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(0+(_app_charge)^080h+02h),w
	btfsc	status,2
	goto	u2071
	goto	u2070
u2071:
	goto	l6659
u2070:
	line	199
	
l6653:	
;app_key.c: 198: {
;app_key.c: 199: app_charge.flag_remind_delay_10s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_app_charge)^080h+02h
	line	200
	
l6655:	
;app_key.c: 200: app_process_set_work_state(WORK_STATE_WORKING);
	movlw	low(01h)
	fcall	_app_process_set_work_state
	line	201
	
l6657:	
;app_key.c: 201: app_process_set_mode_init();
	fcall	_app_process_set_mode_init
	line	202
;app_key.c: 202: }
	goto	l6677
	line	203
	
l6659:	
;app_key.c: 203: else if (app_work_state == WORK_STATE_WORKING)
	bcf	status, 5	;RP0=0, select bank0
		decf	((_app_work_state)),w	;volatile
	btfss	status,2
	goto	u2081
	goto	u2080
u2081:
	goto	l6677
u2080:
	line	211
	
l6661:	
;app_key.c: 204: {
;app_key.c: 211: if (water_work_state == WATER_WORK_STATE_POWEROFF)
	movf	((_water_work_state)),w	;volatile
	btfss	status,2
	goto	u2091
	goto	u2090
u2091:
	goto	l6669
u2090:
	line	213
	
l6663:	
;app_key.c: 212: {
;app_key.c: 213: if (app_charge.Remind)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(_app_charge)^080h,4
	goto	u2101
	goto	u2100
u2101:
	goto	l6669
u2100:
	line	215
	
l6665:	
;app_key.c: 214: {
;app_key.c: 215: app_charge.flag_remind_delay_10s = 1;
	clrf	0+(_app_charge)^080h+02h
	incf	0+(_app_charge)^080h+02h,f
	line	216
	
l6667:	
;app_key.c: 216: app_charge.remind_delay_10s_timer = 0;
	clrf	0+(_app_charge)^080h+03h
	clrf	1+(_app_charge)^080h+03h
	line	219
	
l6669:	
;app_key.c: 217: }
;app_key.c: 218: }
;app_key.c: 219: app_process_set_work_state(WORK_STATE_POWEROFF);
	movlw	low(0)
	fcall	_app_process_set_work_state
	goto	l6677
	line	237
	
l6671:	
;app_key.c: 237: app_process_set_mode_next();
	fcall	_app_process_set_mode_next
	line	238
;app_key.c: 238: break;
	goto	l6677
	line	194
	
l6675:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_key_brush_pwrtype),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 2 to 5
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte           13     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	2^0	; case 2
	skipnz
	goto	l6671
	xorlw	5^2	; case 5
	skipnz
	goto	l6649
	goto	l6677
	opt asmopt_pop

	line	242
	
l6677:	
;app_key.c: 242: key_brush_pwrtype = KEY_TYPE_IDLE;
	clrf	(_key_brush_pwrtype)
	line	243
	
l1636:	
	return
	opt stack 0
GLOBAL	__end_of_handle_key_pwr
	__end_of_handle_key_pwr:
	signat	_handle_key_pwr,89
	global	_app_process_set_mode_next

;; *************** function _app_process_set_mode_next *****************
;; Defined at:
;;		line 42 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_motor.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_app_led_mode_set
;;		_app_process_motor_duty
;; This function is called by:
;;		_handle_key_pwr
;; This function uses a non-reentrant model
;;
psect	text22,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_motor.c"
	line	42
global __ptext22
__ptext22:	;psect for function _app_process_set_mode_next
psect	text22
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_motor.c"
	line	42
	global	__size_of_app_process_set_mode_next
	__size_of_app_process_set_mode_next	equ	__end_of_app_process_set_mode_next-_app_process_set_mode_next
	
_app_process_set_mode_next:	
;incstack = 0
	opt	stack 0
; Regs used in _app_process_set_mode_next: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	44
	
l6303:	
;app_motor.c: 44: work_mode.mode++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_work_mode),f
	line	45
	
l6305:	
;app_motor.c: 45: if (work_mode.mode > WORK_MODE_THREE)
	movlw	low(04h)
	subwf	(_work_mode),w
	skipc
	goto	u1381
	goto	u1380
u1381:
	goto	l6309
u1380:
	line	47
	
l6307:	
;app_motor.c: 46: {
;app_motor.c: 47: work_mode.mode = WORK_MODE_ONE;
	clrf	(_work_mode)
	incf	(_work_mode),f
	line	49
	
l6309:	
;app_motor.c: 48: }
;app_motor.c: 49: app_timer.work_updown_count = (100UL * (5));
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	movwf	3+(_app_timer)^080h+02h
	movlw	0
	movwf	2+(_app_timer)^080h+02h
	movlw	01h
	movwf	1+(_app_timer)^080h+02h
	movlw	0F4h
	movwf	0+(_app_timer)^080h+02h

	line	50
	
l6311:	
;app_motor.c: 50: app_led_mode_set();
	fcall	_app_led_mode_set
	line	51
	
l6313:	
;app_motor.c: 51: app_process_motor_duty();
	fcall	_app_process_motor_duty
	line	52
	
l4295:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_set_mode_next
	__end_of_app_process_set_mode_next:
	signat	_app_process_set_mode_next,89
	global	_app_process_set_mode_init

;; *************** function _app_process_set_mode_init *****************
;; Defined at:
;;		line 34 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_motor.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_app_led_mode_set
;;		_app_process_motor_duty
;; This function is called by:
;;		_handle_key_pwr
;; This function uses a non-reentrant model
;;
psect	text23,local,class=CODE,delta=2,merge=1,group=0
	line	34
global __ptext23
__ptext23:	;psect for function _app_process_set_mode_init
psect	text23
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_motor.c"
	line	34
	global	__size_of_app_process_set_mode_init
	__size_of_app_process_set_mode_init	equ	__end_of_app_process_set_mode_init-_app_process_set_mode_init
	
_app_process_set_mode_init:	
;incstack = 0
	opt	stack 0
; Regs used in _app_process_set_mode_init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	36
	
l6297:	
;app_motor.c: 36: work_mode.mode_out_put = work_mode.mode;
	movf	(_work_mode),w
	movwf	0+(_work_mode)+01h
	line	37
;app_motor.c: 37: app_timer.work_updown_count = (100UL * (5));
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	movwf	3+(_app_timer)^080h+02h
	movlw	0
	movwf	2+(_app_timer)^080h+02h
	movlw	01h
	movwf	1+(_app_timer)^080h+02h
	movlw	0F4h
	movwf	0+(_app_timer)^080h+02h

	line	38
	
l6299:	
;app_motor.c: 38: app_led_mode_set();
	fcall	_app_led_mode_set
	line	39
	
l6301:	
;app_motor.c: 39: app_process_motor_duty();
	fcall	_app_process_motor_duty
	line	40
	
l4291:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_set_mode_init
	__end_of_app_process_set_mode_init:
	signat	_app_process_set_mode_init,89
	global	_app_process_motor_duty

;; *************** function _app_process_motor_duty *****************
;; Defined at:
;;		line 54 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_motor.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       6       0
;;      Totals:         0       6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_app_process_set_mode_init
;;		_app_process_set_mode_next
;; This function uses a non-reentrant model
;;
psect	text24,local,class=CODE,delta=2,merge=1,group=0
	line	54
global __ptext24
__ptext24:	;psect for function _app_process_motor_duty
psect	text24
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_motor.c"
	line	54
	global	__size_of_app_process_motor_duty
	__size_of_app_process_motor_duty	equ	__end_of_app_process_motor_duty-_app_process_motor_duty
	
_app_process_motor_duty:	
;incstack = 0
	opt	stack 1
; Regs used in _app_process_motor_duty: [wreg-fsr0h+status,2+status,0]
	line	56
	
l6255:	
;app_motor.c: 56: switch (work_mode.mode)
	goto	l6265
	line	59
	
l6257:	
;app_motor.c: 59: MOTOR_InitStruct.Period = 127;
	movlw	low(07Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_MOTOR_InitStruct)^080h
	line	60
;app_motor.c: 60: MOTOR_InitStruct.DutyLow = 102 / 2;
	movlw	low(033h)
	movwf	0+(_MOTOR_InitStruct)^080h+01h
	line	61
;app_motor.c: 61: MOTOR_InitStruct.DutyHigh = 102 / 2;
	movlw	low(033h)
	movwf	0+(_MOTOR_InitStruct)^080h+02h
	line	62
;app_motor.c: 62: work_mode.mode_out_put = work_mode.mode;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_work_mode),w
	movwf	0+(_work_mode)+01h
	line	63
;app_motor.c: 63: break;
	goto	l6267
	line	65
	
l6259:	
;app_motor.c: 65: MOTOR_InitStruct.Period = 98;
	movlw	low(062h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_MOTOR_InitStruct)^080h
	line	66
;app_motor.c: 66: MOTOR_InitStruct.DutyLow = 78 / 2;
	movlw	low(027h)
	movwf	0+(_MOTOR_InitStruct)^080h+01h
	line	67
;app_motor.c: 67: MOTOR_InitStruct.DutyHigh = 78 / 2;
	movlw	low(027h)
	movwf	0+(_MOTOR_InitStruct)^080h+02h
	line	68
;app_motor.c: 68: work_mode.mode_out_put = work_mode.mode;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_work_mode),w
	movwf	0+(_work_mode)+01h
	line	69
;app_motor.c: 69: break;
	goto	l6267
	line	71
	
l6261:	
;app_motor.c: 71: MOTOR_InitStruct.Period = 75;
	movlw	low(04Bh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_MOTOR_InitStruct)^080h
	line	72
;app_motor.c: 72: MOTOR_InitStruct.DutyLow = 60 /2;
	movlw	low(01Eh)
	movwf	0+(_MOTOR_InitStruct)^080h+01h
	line	73
;app_motor.c: 73: MOTOR_InitStruct.DutyHigh = 60 /2;
	movlw	low(01Eh)
	movwf	0+(_MOTOR_InitStruct)^080h+02h
	line	74
;app_motor.c: 74: work_mode.mode_out_put = work_mode.mode;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_work_mode),w
	movwf	0+(_work_mode)+01h
	line	75
;app_motor.c: 75: break;
	goto	l6267
	line	56
	
l6265:	
	movf	(_work_mode),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 1 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           12     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l6257
	xorlw	2^1	; case 2
	skipnz
	goto	l6259
	xorlw	3^2	; case 3
	skipnz
	goto	l6261
	goto	l6267
	opt asmopt_pop

	line	80
	
l6267:	
;app_motor.c: 80: low_a = (MOTOR_InitStruct.DutyLow);
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_MOTOR_InitStruct)^080h+01h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_low_a)
	line	81
;app_motor.c: 81: dead_area1 = (MOTOR_InitStruct.Period);
	bsf	status, 5	;RP0=1, select bank1
	movf	(_MOTOR_InitStruct)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_dead_area1)
	line	83
	
l6269:	
;app_motor.c: 83: dead_area_b1 = MOTOR_InitStruct.DutyLow + (((MOTOR_InitStruct.Period - MOTOR_InitStruct.DutyLow) - MOTOR_InitStruct.DutyHigh) >> 1);
	bsf	status, 5	;RP0=1, select bank1
	movf	(_MOTOR_InitStruct)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_app_process_motor_duty+0)+0
	clrf	(??_app_process_motor_duty+0)+0+1
	movf	1+(??_app_process_motor_duty+0)+0,w
	movwf	(??_app_process_motor_duty+2)+0+1
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_MOTOR_InitStruct)^080h+01h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	0+(??_app_process_motor_duty+0)+0,w
	movwf	(??_app_process_motor_duty+2)+0
	skipc
	decf	(??_app_process_motor_duty+2)+0+1,f
	movf	1+(??_app_process_motor_duty+2)+0,w
	movwf	(??_app_process_motor_duty+4)+0+1
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_MOTOR_InitStruct)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	0+(??_app_process_motor_duty+2)+0,w
	movwf	(??_app_process_motor_duty+4)+0
	skipc
	decf	(??_app_process_motor_duty+4)+0+1,f
	rlf	(??_app_process_motor_duty+4)+1,w
	rrf	(??_app_process_motor_duty+4)+1,f
	rrf	(??_app_process_motor_duty+4)+0,f
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_MOTOR_InitStruct)^080h+01h,w
	bcf	status, 5	;RP0=0, select bank0
	addwf	0+(??_app_process_motor_duty+4)+0,w
	movwf	(_dead_area_b1)
	line	84
	
l6271:	
;app_motor.c: 84: low_b = MOTOR_InitStruct.DutyHigh + dead_area_b1;
	movf	(_dead_area_b1),w
	bsf	status, 5	;RP0=1, select bank1
	addwf	0+(_MOTOR_InitStruct)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_low_b)
	line	85
;app_motor.c: 85: dead_area_b2 = (MOTOR_InitStruct.Period);
	bsf	status, 5	;RP0=1, select bank1
	movf	(_MOTOR_InitStruct)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_dead_area_b2)
	line	86
	
l4304:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_motor_duty
	__end_of_app_process_motor_duty:
	signat	_app_process_motor_duty,89
	global	_app_led_mode_set

;; *************** function _app_led_mode_set *****************
;; Defined at:
;;		line 147 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/100
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_set_led_state
;; This function is called by:
;;		_app_process_set_mode_init
;;		_app_process_set_mode_next
;; This function uses a non-reentrant model
;;
psect	text25,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
	line	147
global __ptext25
__ptext25:	;psect for function _app_led_mode_set
psect	text25
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
	line	147
	global	__size_of_app_led_mode_set
	__size_of_app_led_mode_set	equ	__end_of_app_led_mode_set-_app_led_mode_set
	
_app_led_mode_set:	
;incstack = 0
	opt	stack 0
; Regs used in _app_led_mode_set: [wreg+status,2+status,0+pclath+cstack]
	line	149
	
l6243:	
;app_led.c: 149: if (work_mode.mode == WORK_MODE_ONE)
	bcf	status, 5	;RP0=0, select bank0
		decf	((_work_mode)),w
	btfss	status,2
	goto	u1331
	goto	u1330
u1331:
	goto	l6247
u1330:
	line	151
	
l6245:	
;app_led.c: 150: {
;app_led.c: 151: set_led_state(LED_INDEX_2 | LED_INDEX_3, LED_STATE_OFF);
	movlw	06h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	fcall	_set_led_state
	line	152
;app_led.c: 152: set_led_state(LED_INDEX_1, LED_STATE_ON);
	clrf	(set_led_state@index)
	incf	(set_led_state@index),f
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	incf	(set_led_state@state),f
	fcall	_set_led_state
	line	153
;app_led.c: 153: }
	goto	l2194
	line	154
	
l6247:	
;app_led.c: 154: else if (work_mode.mode == WORK_MODE_TWO)
		movlw	2
	xorwf	((_work_mode)),w
	btfss	status,2
	goto	u1341
	goto	u1340
u1341:
	goto	l6251
u1340:
	line	156
	
l6249:	
;app_led.c: 155: {
;app_led.c: 156: set_led_state(LED_INDEX_1 | LED_INDEX_3, LED_STATE_OFF);
	movlw	05h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	fcall	_set_led_state
	line	157
;app_led.c: 157: set_led_state(LED_INDEX_2, LED_STATE_ON);
	movlw	02h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	incf	(set_led_state@state),f
	fcall	_set_led_state
	line	158
;app_led.c: 158: }
	goto	l2194
	line	159
	
l6251:	
;app_led.c: 159: else if (work_mode.mode == WORK_MODE_THREE)
		movlw	3
	xorwf	((_work_mode)),w
	btfss	status,2
	goto	u1351
	goto	u1350
u1351:
	goto	l2194
u1350:
	line	161
	
l6253:	
;app_led.c: 160: {
;app_led.c: 161: set_led_state(LED_INDEX_1 | LED_INDEX_2, LED_STATE_OFF);
	movlw	03h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	fcall	_set_led_state
	line	162
;app_led.c: 162: set_led_state(LED_INDEX_3, LED_STATE_ON);
	movlw	04h
	movwf	(set_led_state@index)
	clrf	(set_led_state@index+1)
	clrf	(set_led_state@state)
	incf	(set_led_state@state),f
	fcall	_set_led_state
	line	164
	
l2194:	
	return
	opt stack 0
GLOBAL	__end_of_app_led_mode_set
	__end_of_app_led_mode_set:
	signat	_app_led_mode_set,89
	global	_charge_or_lowBat_check

;; *************** function _charge_or_lowBat_check *****************
;; Defined at:
;;		line 141 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_app_process_key
;; This function uses a non-reentrant model
;;
psect	text26,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
	line	141
global __ptext26
__ptext26:	;psect for function _charge_or_lowBat_check
psect	text26
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_key.c"
	line	141
	global	__size_of_charge_or_lowBat_check
	__size_of_charge_or_lowBat_check	equ	__end_of_charge_or_lowBat_check-_charge_or_lowBat_check
	
_charge_or_lowBat_check:	
;incstack = 0
	opt	stack 3
; Regs used in _charge_or_lowBat_check: [wreg+status,2+status,0]
	line	143
	
l6633:	
;app_key.c: 143: if (app_charge.Charge)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(_app_charge)^080h,0
	goto	u2011
	goto	u2010
u2011:
	goto	l6637
u2010:
	line	157
	
l6635:	
;app_key.c: 144: {
;app_key.c: 157: key_brush_pwrtype = KEY_TYPE_IDLE;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_key_brush_pwrtype)
	line	158
;app_key.c: 158: key_water_pwr_type = KEY_TYPE_IDLE;
	clrf	(_key_water_pwr_type)
	line	159
;app_key.c: 159: key_water_mode_type = KEY_TYPE_IDLE;
	clrf	(_key_water_mode_type)
	line	160
;app_key.c: 160: }
	goto	l1621
	line	161
	
l6637:	
;app_key.c: 161: else if (app_charge.LowPower)
	movf	(0+(_app_charge)^080h+06h),w
	btfsc	status,2
	goto	u2021
	goto	u2020
u2021:
	goto	l1621
u2020:
	line	163
	
l6639:	
;app_key.c: 162: {
;app_key.c: 163: if (key_brush_pwrtype || key_water_pwr_type || key_water_mode_type)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_key_brush_pwrtype)),w
	btfss	status,2
	goto	u2031
	goto	u2030
u2031:
	goto	l1620
u2030:
	
l6641:	
	movf	((_key_water_pwr_type)),w
	btfss	status,2
	goto	u2041
	goto	u2040
u2041:
	goto	l1620
u2040:
	
l6643:	
	movf	((_key_water_mode_type)),w
	btfsc	status,2
	goto	u2051
	goto	u2050
u2051:
	goto	l1621
u2050:
	
l1620:	
	line	165
;app_key.c: 164: {
;app_key.c: 165: app_charge.LowLed = 1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_app_charge)^080h+07h
	incf	0+(_app_charge)^080h+07h,f
	line	166
	
l6645:	
;app_key.c: 166: app_charge.LowLed_cnt = 0;
	clrf	0+(_app_charge)^080h+08h
	line	167
;app_key.c: 167: key_brush_pwrtype = KEY_TYPE_IDLE;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_key_brush_pwrtype)
	line	168
;app_key.c: 168: key_water_pwr_type = KEY_TYPE_IDLE;
	clrf	(_key_water_pwr_type)
	line	169
;app_key.c: 169: key_water_mode_type = KEY_TYPE_IDLE;
	clrf	(_key_water_mode_type)
	line	190
	
l1621:	
	return
	opt stack 0
GLOBAL	__end_of_charge_or_lowBat_check
	__end_of_charge_or_lowBat_check:
	signat	_charge_or_lowBat_check,89
	global	_app_process_go_to_sleep

;; *************** function _app_process_go_to_sleep *****************
;; Defined at:
;;		line 86 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_GotoSleep
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text27,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
	line	86
global __ptext27
__ptext27:	;psect for function _app_process_go_to_sleep
psect	text27
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
	line	86
	global	__size_of_app_process_go_to_sleep
	__size_of_app_process_go_to_sleep	equ	__end_of_app_process_go_to_sleep-_app_process_go_to_sleep
	
_app_process_go_to_sleep:	
;incstack = 0
	opt	stack 2
; Regs used in _app_process_go_to_sleep: [wreg+status,2+status,0+pclath+cstack]
	line	88
	
l7063:	
;app_process.c: 88: if (app_work_state == WORK_STATE_POWEROFF && water_work_state == WATER_WORK_STATE_POWEROFF && !app_charge.flag_remind_delay_10s && !app_charge.LowLed)
	movf	((_app_work_state)),w	;volatile
	btfss	status,2
	goto	u2831
	goto	u2830
u2831:
	goto	l7073
u2830:
	
l7065:	
	movf	((_water_work_state)),w	;volatile
	btfss	status,2
	goto	u2841
	goto	u2840
u2841:
	goto	l7073
u2840:
	
l7067:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(0+(_app_charge)^080h+02h),w
	btfss	status,2
	goto	u2851
	goto	u2850
u2851:
	goto	l7073
u2850:
	
l7069:	
	movf	(0+(_app_charge)^080h+07h),w
	btfss	status,2
	goto	u2861
	goto	u2860
u2861:
	goto	l7073
u2860:
	line	90
	
l7071:	
;app_process.c: 89: {
;app_process.c: 90: GotoSleep();
	fcall	_GotoSleep
	line	91
;app_process.c: 91: }
	goto	l2774
	line	94
	
l7073:	
;app_process.c: 92: else
;app_process.c: 93: {
;app_process.c: 94: CntSleep = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_CntSleep)
	line	96
	
l2774:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_go_to_sleep
	__end_of_app_process_go_to_sleep:
	signat	_app_process_go_to_sleep,89
	global	_GotoSleep

;; *************** function _GotoSleep *****************
;; Defined at:
;;		line 139 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/100
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_AdcConfig
;;		_ChargePwmOut
;;		_PortInit
;; This function is called by:
;;		_app_process_go_to_sleep
;; This function uses a non-reentrant model
;;
psect	text28,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
	line	139
global __ptext28
__ptext28:	;psect for function _GotoSleep
psect	text28
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
	line	139
	global	__size_of_GotoSleep
	__size_of_GotoSleep	equ	__end_of_GotoSleep-_GotoSleep
	
_GotoSleep:	
;incstack = 0
	opt	stack 2
; Regs used in _GotoSleep: [wreg+status,2+status,0+pclath+cstack]
	line	141
	
l6769:	
;main.c: 141: if (RB2 && RB0 && RB1)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(50/8),(50)&7	;volatile
	goto	u2251
	goto	u2250
u2251:
	goto	l6827
u2250:
	
l6771:	
	btfss	(48/8),(48)&7	;volatile
	goto	u2261
	goto	u2260
u2261:
	goto	l6827
u2260:
	
l6773:	
	btfss	(49/8),(49)&7	;volatile
	goto	u2271
	goto	u2270
u2271:
	goto	l6827
u2270:
	line	144
	
l6775:	
;main.c: 142: {
;main.c: 144: CntSleep++;
	incf	(_CntSleep),f
	line	145
	
l6777:	
;main.c: 145: if (CntSleep >= 200)
	movlw	low(0C8h)
	subwf	(_CntSleep),w
	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l3792
u2280:
	line	147
	
l6779:	
;main.c: 146: {
;main.c: 147: CntSleep = 0;
	clrf	(_CntSleep)
	line	149
;main.c: 149: ADCON0 = 0b00000000;
	clrf	(31)	;volatile
	line	150
;main.c: 150: ADCON1 = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	152
	
l6781:	
;main.c: 152: SWDTEN = 0;
	bcf	(1088/8)^080h,(1088)&7	;volatile
	line	153
;main.c: 153: WDTCON = 0x00;
	clrf	(136)^080h	;volatile
	line	155
	
l6783:	
;main.c: 155: GIE = 0;
	bcf	(95/8),(95)&7	;volatile
	line	156
	
l6785:	
;main.c: 156: TRISB = 0b00010111;
	movlw	low(017h)
	movwf	(134)^080h	;volatile
	line	157
	
l6787:	
;main.c: 157: WPUB = 0b00000111;
	movlw	low(07h)
	movwf	(149)^080h	;volatile
	line	158
;main.c: 158: TRISA = 0b00000000;
	clrf	(133)^080h	;volatile
	line	159
;main.c: 159: PORTA = 0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	160
	
l6789:	
;main.c: 160: ChargePwmOut(0);
	movlw	low(0)
	fcall	_ChargePwmOut
	line	162
	
l6791:	
;main.c: 162: ANSELH = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(148)^080h	;volatile
	line	165
	
l6793:	
;main.c: 165: IOCA = 0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(9)	;volatile
	line	166
	
l6795:	
;main.c: 166: IOCB = 0b00010111;
	movlw	low(017h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(150)^080h	;volatile
	line	168
	
l6797:	
;main.c: 168: RAIE = 1;
	bsf	(1123/8)^080h,(1123)&7	;volatile
	line	169
	
l6799:	
;main.c: 169: RBIE = 1;
	bsf	(91/8),(91)&7	;volatile
	line	170
	
l6801:	
;main.c: 170: PEIE = 1;
	bsf	(94/8),(94)&7	;volatile
	line	172
	
l6803:	
;main.c: 172: RAIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(99/8),(99)&7	;volatile
	line	173
	
l6805:	
;main.c: 173: PORTA;
	movf	(5),w	;volatile
	line	174
	
l6807:	
;main.c: 174: RBIF = 0;
	bcf	(88/8),(88)&7	;volatile
	line	175
	
l6809:	
;main.c: 175: PORTB;
	movf	(6),w	;volatile
	line	177
# 177 "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
clrwdt ;# 
	line	178
# 178 "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
sleep ;# 
	line	180
# 180 "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
nop ;# 
	line	181
# 181 "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
nop ;# 
	line	182
# 182 "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
nop ;# 
psect	text28
	line	184
	
l6811:	
;main.c: 184: ADON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7	;volatile
	line	186
	
l6813:	
;main.c: 186: SWDTEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1088/8)^080h,(1088)&7	;volatile
	line	188
	
l6815:	
;main.c: 188: IOCB = 0x00;
	clrf	(150)^080h	;volatile
	line	189
	
l6817:	
;main.c: 189: IOCA = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(9)	;volatile
	line	191
	
l6819:	
;main.c: 191: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	193
	
l6821:	
;main.c: 193: SWDTEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1088/8)^080h,(1088)&7	;volatile
	line	194
	
l6823:	
;main.c: 194: AdcConfig();
	fcall	_AdcConfig
	line	195
	
l6825:	
;main.c: 195: PortInit();
	fcall	_PortInit
	goto	l3792
	line	200
	
l6827:	
;main.c: 198: else
;main.c: 199: {
;main.c: 200: CntSleep = 0;
	clrf	(_CntSleep)
	line	202
	
l3792:	
	return
	opt stack 0
GLOBAL	__end_of_GotoSleep
	__end_of_GotoSleep:
	signat	_GotoSleep,89
	global	_PortInit

;; *************** function _PortInit *****************
;; Defined at:
;;		line 25 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 100/100
;;		On exit  : 100/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_GotoSleep
;; This function uses a non-reentrant model
;;
psect	text29,local,class=CODE,delta=2,merge=1,group=0
	line	25
global __ptext29
__ptext29:	;psect for function _PortInit
psect	text29
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
	line	25
	global	__size_of_PortInit
	__size_of_PortInit	equ	__end_of_PortInit-_PortInit
	
_PortInit:	
;incstack = 0
	opt	stack 2
; Regs used in _PortInit: [wreg+status,2]
	line	27
	
l6369:	
;main.c: 27: TRISA = 0b00000000;
	clrf	(133)^080h	;volatile
	line	28
;main.c: 28: PORTA = 0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	29
;main.c: 29: WPUA = 0b00000000;
	clrf	(7)	;volatile
	line	30
;main.c: 30: IOCA = 0b00000000;
	clrf	(9)	;volatile
	line	32
	
l6371:	
;main.c: 32: TRISB = 0b00010111;
	movlw	low(017h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(134)^080h	;volatile
	line	33
	
l6373:	
;main.c: 33: PORTB = 0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(6)	;volatile
	line	34
;main.c: 34: ANSELH = 0b00010000;
	movlw	low(010h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(148)^080h	;volatile
	line	35
;main.c: 35: WPUB = 0b00000111;
	movlw	low(07h)
	movwf	(149)^080h	;volatile
	line	36
	
l6375:	
;main.c: 36: IOCB = 0b00000000;
	clrf	(150)^080h	;volatile
	line	37
	
l3765:	
	return
	opt stack 0
GLOBAL	__end_of_PortInit
	__end_of_PortInit:
	signat	_PortInit,89
	global	_AdcConfig

;; *************** function _AdcConfig *****************
;; Defined at:
;;		line 69 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 100/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_GotoSleep
;; This function uses a non-reentrant model
;;
psect	text30,local,class=CODE,delta=2,merge=1,group=0
	line	69
global __ptext30
__ptext30:	;psect for function _AdcConfig
psect	text30
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
	line	69
	global	__size_of_AdcConfig
	__size_of_AdcConfig	equ	__end_of_AdcConfig-_AdcConfig
	
_AdcConfig:	
;incstack = 0
	opt	stack 2
; Regs used in _AdcConfig: [wreg+status,2]
	line	71
	
l6377:	
;main.c: 71: ADCON0 = 0b00111101;
	movlw	low(03Dh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	72
	
l6379:	
;main.c: 72: ADCON1 = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	73
	
l3774:	
	return
	opt stack 0
GLOBAL	__end_of_AdcConfig
	__end_of_AdcConfig:
	signat	_AdcConfig,89
	global	_app_process_charge

;; *************** function _app_process_charge *****************
;; Defined at:
;;		line 244 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_charge.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_Charge_Check
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text31,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_charge.c"
	line	244
global __ptext31
__ptext31:	;psect for function _app_process_charge
psect	text31
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_charge.c"
	line	244
	global	__size_of_app_process_charge
	__size_of_app_process_charge	equ	__end_of_app_process_charge-_app_process_charge
	
_app_process_charge:	
;incstack = 0
	opt	stack 1
; Regs used in _app_process_charge: [wreg+status,2+status,0+pclath+cstack]
	line	246
	
l6895:	
;app_charge.c: 246: Charge_Check();
	fcall	_Charge_Check
	line	247
	
l1081:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_charge
	__end_of_app_process_charge:
	signat	_app_process_charge,89
	global	_Charge_Check

;; *************** function _Charge_Check *****************
;; Defined at:
;;		line 56 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_charge.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       1       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_AdcResultChk
;;		_ChargePwmOut
;;		_app_process_set_work_state
;;		_set_led_state
;; This function is called by:
;;		_app_process_charge
;; This function uses a non-reentrant model
;;
psect	text32,local,class=CODE,delta=2,merge=1,group=0
	line	56
global __ptext32
__ptext32:	;psect for function _Charge_Check
psect	text32
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_charge.c"
	line	56
	global	__size_of_Charge_Check
	__size_of_Charge_Check	equ	__end_of_Charge_Check-_Charge_Check
	
_Charge_Check:	
;incstack = 0
	opt	stack 1
; Regs used in _Charge_Check: [wreg+status,2+status,0+pclath+cstack]
	line	58
	
l6441:	
;app_charge.c: 58: ADCON0 = 0b00110001;
	movlw	low(031h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	59
;app_charge.c: 59: _delay((unsigned long)((20)*(16000000UL/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	26
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_Charge_Check+0)+0),f
	u3087:
decfsz	(??_Charge_Check+0)+0,f
	goto	u3087
opt asmopt_pop

	line	60
;app_charge.c: 60: ADCON1 = 0b00000100;
	movlw	low(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	61
;app_charge.c: 61: _delay((unsigned long)((20)*(16000000UL/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	26
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_Charge_Check+0)+0),f
	u3097:
decfsz	(??_Charge_Check+0)+0,f
	goto	u3097
opt asmopt_pop

	line	62
	
l6443:	
;app_charge.c: 62: adresult_chagrge_vdd = AdcResultChk(4,12);
	movlw	low(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(AdcResultChk@adldo)
	movlw	low(04h)
	fcall	_AdcResultChk
	movf	(1+(?_AdcResultChk)),w
	movwf	(_adresult_chagrge_vdd+1)	;volatile
	movf	(0+(?_AdcResultChk)),w
	movwf	(_adresult_chagrge_vdd)	;volatile
	line	75
	
l6445:	
;app_charge.c: 75: if (adresult_chagrge_vdd < 1300)
	movlw	05h
	subwf	(_adresult_chagrge_vdd+1),w	;volatile
	movlw	014h
	skipnz
	subwf	(_adresult_chagrge_vdd),w	;volatile
	skipnc
	goto	u1591
	goto	u1590
u1591:
	goto	l6467
u1590:
	line	77
	
l6447:	
;app_charge.c: 76: {
;app_charge.c: 77: if (!flag_charge_once)
	btfsc	(_flag_charge_once/8),(_flag_charge_once)&7
	goto	u1601
	goto	u1600
u1601:
	goto	l6469
u1600:
	line	79
	
l6449:	
;app_charge.c: 78: {
;app_charge.c: 79: app_charge.DisChargeCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	0+(_app_charge)^080h+0Bh,f
	skipnz
	incf	1+(_app_charge)^080h+0Bh,f
	line	80
	
l6451:	
;app_charge.c: 80: if(app_charge.DisChargeCnt >= ((500) / 10))
	movlw	0
	subwf	1+(_app_charge)^080h+0Bh,w
	movlw	032h
	skipnz
	subwf	0+(_app_charge)^080h+0Bh,w
	skipc
	goto	u1611
	goto	u1610
u1611:
	goto	l6469
u1610:
	line	82
	
l6453:	
;app_charge.c: 81: {
;app_charge.c: 82: flag_charge_once = 1;
	bsf	(_flag_charge_once/8),(_flag_charge_once)&7
	line	83
;app_charge.c: 83: flag_discharge_once = 0;
	bcf	(_flag_discharge_once/8),(_flag_discharge_once)&7
	line	85
	
l6455:	
;app_charge.c: 85: app_charge.DisChargeCnt = 0;
	clrf	0+(_app_charge)^080h+0Bh
	clrf	1+(_app_charge)^080h+0Bh
	line	86
	
l6457:	
;app_charge.c: 86: app_charge.Charge = 0;
	bcf	(_app_charge)^080h,0
	line	87
	
l6459:	
;app_charge.c: 87: app_charge.FullCharge = 0;
	bcf	(_app_charge)^080h,1
	line	88
	
l6461:	
;app_charge.c: 88: set_led_state(LED_INDEX_9 | LED_INDEX_10,LED_STATE_OFF);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	movwf	(set_led_state@index)
	movlw	03h
	movwf	((set_led_state@index))+1
	clrf	(set_led_state@state)
	fcall	_set_led_state
	line	89
	
l6463:	
;app_charge.c: 89: ChargePwmOut(0);
	movlw	low(0)
	fcall	_ChargePwmOut
	line	90
	
l6465:	
;app_charge.c: 90: app_process_set_work_state(WORK_STATE_POWEROFF);
	movlw	low(0)
	fcall	_app_process_set_work_state
	goto	l6469
	line	96
	
l6467:	
;app_charge.c: 94: else
;app_charge.c: 95: {
;app_charge.c: 96: app_charge.DisChargeCnt = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_app_charge)^080h+0Bh
	clrf	1+(_app_charge)^080h+0Bh
	line	98
	
l6469:	
;app_charge.c: 97: }
;app_charge.c: 98: if (adresult_chagrge_vdd > 1700)
	movlw	06h
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adresult_chagrge_vdd+1),w	;volatile
	movlw	0A5h
	skipnz
	subwf	(_adresult_chagrge_vdd),w	;volatile
	skipc
	goto	u1621
	goto	u1620
u1621:
	goto	l6487
u1620:
	line	100
	
l6471:	
;app_charge.c: 99: {
;app_charge.c: 100: if (!flag_discharge_once)
	btfsc	(_flag_discharge_once/8),(_flag_discharge_once)&7
	goto	u1631
	goto	u1630
u1631:
	goto	l6489
u1630:
	line	102
	
l6473:	
;app_charge.c: 101: {
;app_charge.c: 102: if (app_charge.ChargeCnt <= ((100) / 10))
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	subwf	1+(_app_charge)^080h+09h,w
	movlw	0Bh
	skipnz
	subwf	0+(_app_charge)^080h+09h,w
	skipnc
	goto	u1641
	goto	u1640
u1641:
	goto	l1046
u1640:
	line	104
	
l6475:	
;app_charge.c: 103: {
;app_charge.c: 104: app_charge.ChargeCnt++;
	incf	0+(_app_charge)^080h+09h,f
	skipnz
	incf	1+(_app_charge)^080h+09h,f
	line	105
;app_charge.c: 105: }
	goto	l6489
	line	106
	
l1046:	
	line	108
;app_charge.c: 106: else
;app_charge.c: 107: {
;app_charge.c: 108: flag_charge_once = 0;
	bcf	(_flag_charge_once/8),(_flag_charge_once)&7
	line	109
;app_charge.c: 109: flag_discharge_once = 1;
	bsf	(_flag_discharge_once/8),(_flag_discharge_once)&7
	line	111
	
l6477:	
;app_charge.c: 111: app_charge.ChargeFullCnt = 0;
	clrf	0+(_app_charge)^080h+0Dh
	clrf	1+(_app_charge)^080h+0Dh
	line	112
;app_charge.c: 112: app_charge.ChargeCnt = 0;
	clrf	0+(_app_charge)^080h+09h
	clrf	1+(_app_charge)^080h+09h
	line	113
	
l6479:	
;app_charge.c: 113: app_charge.Charge = 1;
	bsf	(_app_charge)^080h,0
	line	114
	
l6481:	
;app_charge.c: 114: app_charge.FullCharge = 0;
	bcf	(_app_charge)^080h,1
	line	116
	
l6483:	
;app_charge.c: 116: adresultvdd_back = 4096;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_adresultvdd_back)	;volatile
	movlw	010h
	movwf	((_adresultvdd_back))+1	;volatile
	line	117
	
l6485:	
;app_charge.c: 117: app_process_set_work_state(WORK_STATE_CHARGING);
	movlw	low(02h)
	fcall	_app_process_set_work_state
	goto	l6489
	line	123
	
l6487:	
;app_charge.c: 121: else
;app_charge.c: 122: {
;app_charge.c: 123: app_charge.ChargeCnt = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_app_charge)^080h+09h
	clrf	1+(_app_charge)^080h+09h
	line	125
	
l6489:	
;app_charge.c: 124: }
;app_charge.c: 125: if(app_charge.Charge)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(_app_charge)^080h,0
	goto	u1651
	goto	u1650
u1651:
	goto	l6545
u1650:
	line	127
	
l6491:	
;app_charge.c: 126: {
;app_charge.c: 127: if(app_charge.FullCharge || app_charge.ForceFullCharge)
	btfsc	(_app_charge)^080h,1
	goto	u1661
	goto	u1660
u1661:
	goto	l6495
u1660:
	
l6493:	
	btfss	(_app_charge)^080h,2
	goto	u1671
	goto	u1670
u1671:
	goto	l6511
u1670:
	line	129
	
l6495:	
;app_charge.c: 128: {
;app_charge.c: 129: if (charge_force_full_cnt <= (100UL * 3600 *15 + 100UL * 3600 *9))
		movf	(_charge_force_full_cnt+3)^080h,w
	btfss	status,2
	goto	u1681
	movlw	131
	subwf	(_charge_force_full_cnt+2)^080h,w
	skipz
	goto	u1683
	movlw	214
	subwf	(_charge_force_full_cnt+1)^080h,w
	skipz
	goto	u1683
	movlw	1
	subwf	(_charge_force_full_cnt)^080h,w
	skipz
	goto	u1683
u1683:
	btfsc	status,0
	goto	u1681
	goto	u1680

u1681:
	goto	l1053
u1680:
	line	132
	
l6497:	
;app_charge.c: 131: {
;app_charge.c: 132: charge_force_full_cnt++;
	incf	(_charge_force_full_cnt)^080h,f
	skipnz
	incf	(_charge_force_full_cnt+1)^080h,f
	skipnz
	incf	(_charge_force_full_cnt+2)^080h,f
	skipnz
	incf	(_charge_force_full_cnt+3)^080h,f
	line	133
;app_charge.c: 133: }
	goto	l1054
	line	134
	
l1053:	
	line	136
;app_charge.c: 134: else
;app_charge.c: 135: {
;app_charge.c: 136: app_charge.flag_charge_force_full_24hour = 1;
	bsf	(_app_charge)^080h,3
	line	137
	
l1054:	
	line	138
;app_charge.c: 137: }
;app_charge.c: 138: if (app_charge.flag_charge_force_full_24hour)
	btfss	(_app_charge)^080h,3
	goto	u1691
	goto	u1690
u1691:
	goto	l1055
u1690:
	line	140
	
l6499:	
;app_charge.c: 139: {
;app_charge.c: 140: {PWM0EN = 0;TRISB3 = 0;RB3 = 0;};
	bcf	status, 5	;RP0=0, select bank0
	bcf	(216/8),(216)&7	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(51/8),(51)&7	;volatile
	line	141
;app_charge.c: 141: }
	goto	l1078
	line	142
	
l1055:	
	line	144
;app_charge.c: 142: else
;app_charge.c: 143: {
;app_charge.c: 144: if (app_charge.ForceFullCharge)
	btfss	(_app_charge)^080h,2
	goto	u1701
	goto	u1700
u1701:
	goto	l6503
u1700:
	goto	l6499
	line	150
	
l6503:	
;app_charge.c: 148: else
;app_charge.c: 149: {
;app_charge.c: 150: if (adresultvdd > 1213)
	movlw	04h
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adresultvdd+1),w	;volatile
	movlw	0BEh
	skipnz
	subwf	(_adresultvdd),w	;volatile
	skipc
	goto	u1711
	goto	u1710
u1711:
	goto	l6507
u1710:
	line	152
	
l6505:	
;app_charge.c: 151: {
;app_charge.c: 152: ChargePwmOut(60);
	movlw	low(03Ch)
	fcall	_ChargePwmOut
	line	153
;app_charge.c: 153: }
	goto	l1078
	line	154
	
l6507:	
;app_charge.c: 154: else if(adresultvdd <= 1180)
	movlw	04h
	subwf	(_adresultvdd+1),w	;volatile
	movlw	09Dh
	skipnz
	subwf	(_adresultvdd),w	;volatile
	skipnc
	goto	u1721
	goto	u1720
u1721:
	goto	l1056
u1720:
	goto	l6499
	line	159
	
l1056:	
	line	161
;app_charge.c: 157: }
;app_charge.c: 158: }
;app_charge.c: 159: }
;app_charge.c: 161: }
	goto	l1078
	line	177
	
l6511:	
	line	185
	
l6517:	
;app_charge.c: 183: }
;app_charge.c: 184: }
;app_charge.c: 185: if (adresultvdd <= 1170)
	movlw	04h
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adresultvdd+1),w	;volatile
	movlw	093h
	skipnz
	subwf	(_adresultvdd),w	;volatile
	skipnc
	goto	u1731
	goto	u1730
u1731:
	goto	l6523
u1730:
	line	187
	
l6519:	
;app_charge.c: 186: {
;app_charge.c: 187: if (++charge_full_cnt >= 100)
	movlw	low(064h)
	incf	(_charge_full_cnt),f
	subwf	((_charge_full_cnt)),w
	skipc
	goto	u1741
	goto	u1740
u1741:
	goto	l6525
u1740:
	line	189
	
l6521:	
;app_charge.c: 188: {
;app_charge.c: 189: {PWM0EN = 0;TRISB3 = 0;RB3 = 0;};
	bcf	(216/8),(216)&7	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(51/8),(51)&7	;volatile
	line	190
;app_charge.c: 190: app_charge.FullCharge = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(_app_charge)^080h,1
	goto	l6525
	line	195
	
l6523:	
;app_charge.c: 193: else
;app_charge.c: 194: {
;app_charge.c: 195: charge_full_cnt = 0;
	clrf	(_charge_full_cnt)
	line	198
	
l6525:	
;app_charge.c: 196: }
;app_charge.c: 198: if (charge_force_full_cnt <= 100UL * 3600 *15)
	bsf	status, 5	;RP0=1, select bank1
		movf	(_charge_force_full_cnt+3)^080h,w
	btfss	status,2
	goto	u1751
	movlw	82
	subwf	(_charge_force_full_cnt+2)^080h,w
	skipz
	goto	u1753
	movlw	101
	subwf	(_charge_force_full_cnt+1)^080h,w
	skipz
	goto	u1753
	movlw	193
	subwf	(_charge_force_full_cnt)^080h,w
	skipz
	goto	u1753
u1753:
	btfsc	status,0
	goto	u1751
	goto	u1750

u1751:
	goto	l1068
u1750:
	line	201
	
l6527:	
;app_charge.c: 200: {
;app_charge.c: 201: charge_force_full_cnt++;
	incf	(_charge_force_full_cnt)^080h,f
	skipnz
	incf	(_charge_force_full_cnt+1)^080h,f
	skipnz
	incf	(_charge_force_full_cnt+2)^080h,f
	skipnz
	incf	(_charge_force_full_cnt+3)^080h,f
	line	202
;app_charge.c: 202: }
	goto	l6529
	line	203
	
l1068:	
	line	205
;app_charge.c: 203: else
;app_charge.c: 204: {
;app_charge.c: 205: app_charge.ForceFullCharge = 1;
	bsf	(_app_charge)^080h,2
	line	208
	
l6529:	
;app_charge.c: 206: }
;app_charge.c: 208: if (adresultvdd_back >= adresultvdd)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_adresultvdd+1),w	;volatile
	subwf	(_adresultvdd_back+1),w	;volatile
	skipz
	goto	u1765
	movf	(_adresultvdd),w	;volatile
	subwf	(_adresultvdd_back),w	;volatile
u1765:
	skipc
	goto	u1761
	goto	u1760
u1761:
	goto	l1070
u1760:
	line	210
	
l6531:	
;app_charge.c: 209: {
;app_charge.c: 210: adresultvdd_back = adresultvdd;
	movf	(_adresultvdd+1),w	;volatile
	movwf	(_adresultvdd_back+1)	;volatile
	movf	(_adresultvdd),w	;volatile
	movwf	(_adresultvdd_back)	;volatile
	line	211
	
l1070:	
	line	214
;app_charge.c: 211: }
;app_charge.c: 214: if(adresultvdd_back < 1199)
	movlw	04h
	subwf	(_adresultvdd_back+1),w	;volatile
	movlw	0AFh
	skipnz
	subwf	(_adresultvdd_back),w	;volatile
	skipnc
	goto	u1771
	goto	u1770
u1771:
	goto	l6535
u1770:
	line	216
	
l6533:	
;app_charge.c: 215: {
;app_charge.c: 216: ChargePwmOut(60);
	movlw	low(03Ch)
	fcall	_ChargePwmOut
	line	217
;app_charge.c: 217: }
	goto	l1078
	line	218
	
l6535:	
;app_charge.c: 218: else if(adresultvdd_back < 1228)
	movlw	04h
	subwf	(_adresultvdd_back+1),w	;volatile
	movlw	0CCh
	skipnz
	subwf	(_adresultvdd_back),w	;volatile
	skipnc
	goto	u1781
	goto	u1780
u1781:
	goto	l6539
u1780:
	line	220
	
l6537:	
;app_charge.c: 219: {
;app_charge.c: 220: ChargePwmOut(60);
	movlw	low(03Ch)
	fcall	_ChargePwmOut
	line	221
;app_charge.c: 221: }
	goto	l1078
	line	222
	
l6539:	
;app_charge.c: 222: else if(adresultvdd_back < 1445)
	movlw	05h
	subwf	(_adresultvdd_back+1),w	;volatile
	movlw	0A5h
	skipnz
	subwf	(_adresultvdd_back),w	;volatile
	skipnc
	goto	u1791
	goto	u1790
u1791:
	goto	l6543
u1790:
	line	224
	
l6541:	
;app_charge.c: 223: {
;app_charge.c: 224: ChargePwmOut(80);
	movlw	low(050h)
	fcall	_ChargePwmOut
	line	225
;app_charge.c: 225: }
	goto	l1078
	line	228
	
l6543:	
;app_charge.c: 226: else
;app_charge.c: 227: {
;app_charge.c: 228: ChargePwmOut(60);
	movlw	low(03Ch)
	fcall	_ChargePwmOut
	goto	l1078
	line	235
	
l6545:	
;app_charge.c: 235: charge_full_cnt = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_charge_full_cnt)
	line	236
	
l6547:	
;app_charge.c: 236: charge_force_full_cnt = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_charge_force_full_cnt)^080h
	clrf	(_charge_force_full_cnt+1)^080h
	clrf	(_charge_force_full_cnt+2)^080h
	clrf	(_charge_force_full_cnt+3)^080h
	line	237
	
l6549:	
;app_charge.c: 237: app_charge.flag_charge_force_full_24hour = 0;
	bcf	(_app_charge)^080h,3
	line	238
	
l6551:	
;app_charge.c: 238: app_charge.FullCharge = 0;
	bcf	(_app_charge)^080h,1
	line	239
	
l6553:	
;app_charge.c: 239: app_charge.ForceFullCharge = 0;
	bcf	(_app_charge)^080h,2
	line	240
;app_charge.c: 240: app_charge.ChargeFullCnt = 0;
	clrf	0+(_app_charge)^080h+0Dh
	clrf	1+(_app_charge)^080h+0Dh
	line	242
	
l1078:	
	return
	opt stack 0
GLOBAL	__end_of_Charge_Check
	__end_of_Charge_Check:
	signat	_Charge_Check,89
	global	_set_led_state

;; *************** function _set_led_state *****************
;; Defined at:
;;		line 269 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
;; Parameters:    Size  Location     Type
;;  index           2    0[BANK0 ] enum E591
;;  state           1    2[BANK0 ] enum E587
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       3       0
;;      Locals:         0       0       0
;;      Temps:          0       6       0
;;      Totals:         0       9       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Charge_Check
;;		_app_led_mode_set
;;		_app_led_water_mode_set
;;		_process_led_remind_low_power
;;		_app_process_power_off
;;		_water_turn_off
;; This function uses a non-reentrant model
;;
psect	text33,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
	line	269
global __ptext33
__ptext33:	;psect for function _set_led_state
psect	text33
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
	line	269
	global	__size_of_set_led_state
	__size_of_set_led_state	equ	__end_of_set_led_state-_set_led_state
	
_set_led_state:	
;incstack = 0
	opt	stack 3
; Regs used in _set_led_state: [wreg+status,2+status,0]
	line	271
	
l6217:	
;app_led.c: 271: if (LED_STATE_ON == state)
		decf	((set_led_state@state)),w
	btfss	status,2
	goto	u1291
	goto	u1290
u1291:
	goto	l6221
u1290:
	line	273
	
l6219:	
;app_led.c: 272: {
;app_led.c: 273: led_index |= index;
	movf	(set_led_state@index),w
	movwf	((??_set_led_state+0)+0)
	movf	(set_led_state@index+1),w
	movwf	((??_set_led_state+0)+0+1)
	clrf	((??_set_led_state+0)+0+2)
	clrf	((??_set_led_state+0)+0+3)
	movf	0+(??_set_led_state+0)+0,w
	iorwf	(_led_index),f
	movf	1+(??_set_led_state+0)+0,w
	iorwf	(_led_index+1),f
	movf	2+(??_set_led_state+0)+0,w
	iorwf	(_led_index+2),f
	movf	3+(??_set_led_state+0)+0,w
	iorwf	(_led_index+3),f
	line	274
;app_led.c: 274: }
	goto	l2237
	line	275
	
l6221:	
;app_led.c: 275: else if (LED_STATE_OFF == state)
	movf	((set_led_state@state)),w
	btfss	status,2
	goto	u1301
	goto	u1300
u1301:
	goto	l2237
u1300:
	line	277
	
l6223:	
;app_led.c: 276: {
;app_led.c: 277: led_index &= ~index;
	movf	(set_led_state@index+1),w
	movwf	(??_set_led_state+0)+0+1
	movf	(set_led_state@index),w
	movwf	(??_set_led_state+0)+0
	comf	(??_set_led_state+0)+0,f
	comf	(??_set_led_state+0)+1,f
	movf	0+(??_set_led_state+0)+0,w
	movwf	((??_set_led_state+2)+0)
	movf	1+(??_set_led_state+0)+0,w
	movwf	((??_set_led_state+2)+0+1)
	movlw	0
	btfsc	((??_set_led_state+2)+0+1),7
	movlw	255
	movwf	((??_set_led_state+2)+0+2)
	movwf	((??_set_led_state+2)+0+3)
	movf	0+(??_set_led_state+2)+0,w
	andwf	(_led_index),f
	movf	1+(??_set_led_state+2)+0,w
	andwf	(_led_index+1),f
	movf	2+(??_set_led_state+2)+0,w
	andwf	(_led_index+2),f
	movf	3+(??_set_led_state+2)+0,w
	andwf	(_led_index+3),f
	line	279
	
l2237:	
	return
	opt stack 0
GLOBAL	__end_of_set_led_state
	__end_of_set_led_state:
	signat	_set_led_state,8313
	global	_ChargePwmOut

;; *************** function _ChargePwmOut *****************
;; Defined at:
;;		line 38 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_charge.c"
;; Parameters:    Size  Location     Type
;;  Duty            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Duty            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Charge_Check
;;		_GotoSleep
;; This function uses a non-reentrant model
;;
psect	text34,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_charge.c"
	line	38
global __ptext34
__ptext34:	;psect for function _ChargePwmOut
psect	text34
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_charge.c"
	line	38
	global	__size_of_ChargePwmOut
	__size_of_ChargePwmOut	equ	__end_of_ChargePwmOut-_ChargePwmOut
	
_ChargePwmOut:	
;incstack = 0
	opt	stack 2
; Regs used in _ChargePwmOut: [wreg+status,2+status,0]
;ChargePwmOut@Duty stored from wreg
	movwf	(ChargePwmOut@Duty)
	line	40
	
l6289:	
;app_charge.c: 40: if(Duty == 0)
	movf	((ChargePwmOut@Duty)),w
	btfss	status,2
	goto	u1361
	goto	u1360
u1361:
	goto	l1034
u1360:
	line	42
	
l6291:	
;app_charge.c: 41: {
;app_charge.c: 42: PWM0EN = 0;
	bcf	(216/8),(216)&7	;volatile
	line	43
;app_charge.c: 43: TRISB3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7	;volatile
	line	44
;app_charge.c: 44: }
	goto	l1037
	line	45
	
l1034:	
	line	47
;app_charge.c: 45: else
;app_charge.c: 46: {
;app_charge.c: 47: if(!PWM0EN)
	btfsc	(216/8),(216)&7	;volatile
	goto	u1371
	goto	u1370
u1371:
	goto	l1036
u1370:
	line	49
	
l6293:	
;app_charge.c: 48: {
;app_charge.c: 49: PWM0EN = 1;
	bsf	(216/8),(216)&7	;volatile
	line	50
	
l1036:	
	line	51
;app_charge.c: 50: }
;app_charge.c: 51: {TRISB3 = 0;};
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	line	52
	
l6295:	
;app_charge.c: 52: PWMD0L = Duty;
	bcf	status, 5	;RP0=0, select bank0
	movf	(ChargePwmOut@Duty),w
	movwf	(22)	;volatile
	line	54
	
l1037:	
	return
	opt stack 0
GLOBAL	__end_of_ChargePwmOut
	__end_of_ChargePwmOut:
	signat	_ChargePwmOut,4217
	global	_app_adc_process

;; *************** function _app_adc_process *****************
;; Defined at:
;;		line 213 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_app_adc_bat_voltage_check
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text35,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
	line	213
global __ptext35
__ptext35:	;psect for function _app_adc_process
psect	text35
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
	line	213
	global	__size_of_app_adc_process
	__size_of_app_adc_process	equ	__end_of_app_adc_process-_app_adc_process
	
_app_adc_process:	
;incstack = 0
	opt	stack 1
; Regs used in _app_adc_process: [wreg+status,2+status,0+pclath+cstack]
	line	216
	
l6893:	
;app_adc.c: 216: app_adc_bat_voltage_check();
	fcall	_app_adc_bat_voltage_check
	line	217
	
l539:	
	return
	opt stack 0
GLOBAL	__end_of_app_adc_process
	__end_of_app_adc_process:
	signat	_app_adc_process,89
	global	_app_adc_bat_voltage_check

;; *************** function _app_adc_bat_voltage_check *****************
;; Defined at:
;;		line 98 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       1       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_AdcResultChk
;;		_app_process_set_water_state
;;		_app_process_set_work_state
;; This function is called by:
;;		_app_adc_process
;; This function uses a non-reentrant model
;;
psect	text36,local,class=CODE,delta=2,merge=1,group=0
	line	98
global __ptext36
__ptext36:	;psect for function _app_adc_bat_voltage_check
psect	text36
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
	line	98
	global	__size_of_app_adc_bat_voltage_check
	__size_of_app_adc_bat_voltage_check	equ	__end_of_app_adc_bat_voltage_check-_app_adc_bat_voltage_check
	
_app_adc_bat_voltage_check:	
;incstack = 0
	opt	stack 1
; Regs used in _app_adc_bat_voltage_check: [wreg+status,2+status,0+pclath+cstack]
	line	100
	
l6385:	
;app_adc.c: 100: ADCON0 = 0b00111101;
	movlw	low(03Dh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	101
;app_adc.c: 101: _delay((unsigned long)((20)*(16000000UL/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	26
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_app_adc_bat_voltage_check+0)+0),f
	u3107:
decfsz	(??_app_adc_bat_voltage_check+0)+0,f
	goto	u3107
opt asmopt_pop

	line	102
	
l6387:	
;app_adc.c: 102: ADCON1 = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	103
	
l6389:	
;app_adc.c: 103: _delay((unsigned long)((20)*(16000000UL/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	26
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_app_adc_bat_voltage_check+0)+0),f
	u3117:
decfsz	(??_app_adc_bat_voltage_check+0)+0,f
	goto	u3117
opt asmopt_pop

	line	105
	
l6391:	
;app_adc.c: 105: adresultvdd = AdcResultChk(15,0);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(AdcResultChk@adldo)
	movlw	low(0Fh)
	fcall	_AdcResultChk
	movf	(1+(?_AdcResultChk)),w
	movwf	(_adresultvdd+1)	;volatile
	movf	(0+(?_AdcResultChk)),w
	movwf	(_adresultvdd)	;volatile
	line	120
	
l6393:	
;app_adc.c: 120: if(app_charge.Charge)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(_app_charge)^080h,0
	goto	u1511
	goto	u1510
u1511:
	goto	l6407
u1510:
	line	122
	
l6395:	
;app_adc.c: 121: {
;app_adc.c: 122: if(adresultvdd < 1535)
	movlw	05h
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adresultvdd+1),w	;volatile
	movlw	0FFh
	skipnz
	subwf	(_adresultvdd),w	;volatile
	skipnc
	goto	u1521
	goto	u1520
u1521:
	goto	l6405
u1520:
	line	124
	
l6397:	
;app_adc.c: 123: {
;app_adc.c: 124: CntLowPowerOff++;
	incf	(_CntLowPowerOff),f	;volatile
	line	125
	
l6399:	
;app_adc.c: 125: if(CntLowPowerOff > 250)
	movlw	low(0FBh)
	subwf	(_CntLowPowerOff),w	;volatile
	skipc
	goto	u1531
	goto	u1530
u1531:
	goto	l529
u1530:
	line	127
	
l6401:	
;app_adc.c: 126: {
;app_adc.c: 127: CntLowPowerOff = 0;
	clrf	(_CntLowPowerOff)	;volatile
	line	128
	
l6403:	
;app_adc.c: 128: app_charge.Remind = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(_app_charge)^080h,4
	line	129
;app_adc.c: 129: app_charge.LowLed = 0;
	clrf	0+(_app_charge)^080h+07h
	line	130
;app_adc.c: 130: app_charge.LowPower = 0;
	clrf	0+(_app_charge)^080h+06h
	goto	l529
	line	135
	
l6405:	
;app_adc.c: 133: else
;app_adc.c: 134: {
;app_adc.c: 135: CntLowPowerOff = 0;
	clrf	(_CntLowPowerOff)	;volatile
	goto	l529
	line	140
	
l6407:	
;app_adc.c: 138: else
;app_adc.c: 139: {
;app_adc.c: 140: if(adresultvdd > 1694 - 20)
	movlw	06h
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adresultvdd+1),w	;volatile
	movlw	08Bh
	skipnz
	subwf	(_adresultvdd),w	;volatile
	skipc
	goto	u1541
	goto	u1540
u1541:
	goto	l6427
u1540:
	line	142
	
l6409:	
;app_adc.c: 141: {
;app_adc.c: 142: CntLowPowerOff++;
	incf	(_CntLowPowerOff),f	;volatile
	line	143
	
l6411:	
;app_adc.c: 143: if(CntLowPowerOff > 100)
	movlw	low(065h)
	subwf	(_CntLowPowerOff),w	;volatile
	skipc
	goto	u1551
	goto	u1550
u1551:
	goto	l6429
u1550:
	line	145
	
l6413:	
;app_adc.c: 144: {
;app_adc.c: 145: CntLowPowerOff = 0;
	clrf	(_CntLowPowerOff)	;volatile
	line	146
	
l6415:	
;app_adc.c: 146: app_charge.Remind = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(_app_charge)^080h,4
	line	148
	
l6417:	
;app_adc.c: 148: if (!app_charge.LowPower)
	movf	(0+(_app_charge)^080h+06h),w
	btfss	status,2
	goto	u1561
	goto	u1560
u1561:
	goto	l6429
u1560:
	line	150
	
l6419:	
;app_adc.c: 149: {
;app_adc.c: 150: app_process_set_work_state(WORK_STATE_POWEROFF);
	movlw	low(0)
	fcall	_app_process_set_work_state
	line	151
;app_adc.c: 151: app_process_set_water_state(WATER_WORK_STATE_POWEROFF);
	movlw	low(0)
	fcall	_app_process_set_water_state
	line	152
	
l6421:	
;app_adc.c: 152: app_charge.LowPower = 1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_app_charge)^080h+06h
	incf	0+(_app_charge)^080h+06h,f
	line	153
	
l6423:	
;app_adc.c: 153: app_charge.LowLed = 1;
	clrf	0+(_app_charge)^080h+07h
	incf	0+(_app_charge)^080h+07h,f
	line	154
	
l6425:	
;app_adc.c: 154: app_charge.LowLed_cnt = 0;
	clrf	0+(_app_charge)^080h+08h
	goto	l6429
	line	160
	
l6427:	
;app_adc.c: 158: else
;app_adc.c: 159: {
;app_adc.c: 160: CntLowPowerOff = 0;
	clrf	(_CntLowPowerOff)	;volatile
	line	163
	
l6429:	
;app_adc.c: 161: }
;app_adc.c: 163: if(adresultvdd > 1445 -15)
	movlw	05h
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adresultvdd+1),w	;volatile
	movlw	097h
	skipnz
	subwf	(_adresultvdd),w	;volatile
	skipc
	goto	u1571
	goto	u1570
u1571:
	goto	l6439
u1570:
	line	165
	
l6431:	
;app_adc.c: 164: {
;app_adc.c: 165: bat_remind_delay++;
	incf	(_bat_remind_delay),f
	line	166
	
l6433:	
;app_adc.c: 166: if(bat_remind_delay > 100)
	movlw	low(065h)
	subwf	(_bat_remind_delay),w
	skipc
	goto	u1581
	goto	u1580
u1581:
	goto	l529
u1580:
	line	168
	
l6435:	
;app_adc.c: 167: {
;app_adc.c: 168: bat_remind_delay = 0;
	clrf	(_bat_remind_delay)
	line	169
	
l6437:	
;app_adc.c: 169: app_charge.Remind = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(_app_charge)^080h,4
	goto	l529
	line	174
	
l6439:	
;app_adc.c: 172: else
;app_adc.c: 173: {
;app_adc.c: 174: bat_remind_delay = 0;
	clrf	(_bat_remind_delay)
	line	178
	
l529:	
	return
	opt stack 0
GLOBAL	__end_of_app_adc_bat_voltage_check
	__end_of_app_adc_bat_voltage_check:
	signat	_app_adc_bat_voltage_check,89
	global	_app_process_set_work_state

;; *************** function _app_process_set_work_state *****************
;; Defined at:
;;		line 34 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
;; Parameters:    Size  Location     Type
;;  states          1    wreg     enum E511
;; Auto vars:     Size  Location     Type
;;  states          1    0[BANK0 ] enum E511
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/100
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_app_adc_bat_voltage_check
;;		_Charge_Check
;;		_handle_key_pwr
;;		_process_led_remind_low_power
;;		_app_process_working
;;		_main
;; This function uses a non-reentrant model
;;
psect	text37,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
	line	34
global __ptext37
__ptext37:	;psect for function _app_process_set_work_state
psect	text37
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_process.c"
	line	34
	global	__size_of_app_process_set_work_state
	__size_of_app_process_set_work_state	equ	__end_of_app_process_set_work_state-_app_process_set_work_state
	
_app_process_set_work_state:	
;incstack = 0
	opt	stack 3
; Regs used in _app_process_set_work_state: [wreg+status,2]
;app_process_set_work_state@states stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(app_process_set_work_state@states)
	line	36
	
l6281:	
;app_process.c: 36: app_work_state = states;
	movf	(app_process_set_work_state@states),w
	movwf	(_app_work_state)	;volatile
	line	37
	
l6283:	
;app_process.c: 37: work_step = 0;
	clrf	(_work_step)
	line	38
	
l2753:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_set_work_state
	__end_of_app_process_set_work_state:
	signat	_app_process_set_work_state,4217
	global	_app_process_set_water_state

;; *************** function _app_process_set_water_state *****************
;; Defined at:
;;		line 17 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
;; Parameters:    Size  Location     Type
;;  states          1    wreg     enum E551
;; Auto vars:     Size  Location     Type
;;  states          1    0[BANK0 ] enum E551
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_app_adc_bat_voltage_check
;;		_handle_key_water
;;		_process_led_remind_low_power
;;		_app_process_charing
;;		_main
;;		_app_process_water_working
;;		_app_process_water_mdoe_led
;; This function uses a non-reentrant model
;;
psect	text38,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
	line	17
global __ptext38
__ptext38:	;psect for function _app_process_set_water_state
psect	text38
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
	line	17
	global	__size_of_app_process_set_water_state
	__size_of_app_process_set_water_state	equ	__end_of_app_process_set_water_state-_app_process_set_water_state
	
_app_process_set_water_state:	
;incstack = 0
	opt	stack 3
; Regs used in _app_process_set_water_state: [wreg+status,2]
;app_process_set_water_state@states stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(app_process_set_water_state@states)
	line	19
	
l6285:	
;app_water_process.c: 19: water_work_state = states;
	movf	(app_process_set_water_state@states),w
	movwf	(_water_work_state)	;volatile
	line	20
	
l6287:	
;app_water_process.c: 20: water_work_step = 0;
	clrf	(_water_work_step)
	line	21
	
l4797:	
	return
	opt stack 0
GLOBAL	__end_of_app_process_set_water_state
	__end_of_app_process_set_water_state:
	signat	_app_process_set_water_state,4217
	global	_AdcResultChk

;; *************** function _AdcResultChk *****************
;; Defined at:
;;		line 54 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
;; Parameters:    Size  Location     Type
;;  adch            1    wreg     unsigned char 
;;  adldo           1    6[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  adch            1    9[BANK0 ] unsigned char 
;;  ad_value        2   11[BANK0 ] volatile unsigned int 
;;  ad_temp         2    0        volatile unsigned int 
;;  ad_value_min    2    0        volatile unsigned int 
;;  ad_value_max    2    0        volatile unsigned int 
;;  i               1   10[BANK0 ] volatile unsigned char 
;; Return value:  Size  Location     Type
;;                  2    6[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       3       0
;;      Locals:         0       4       0
;;      Temps:          0       0       0
;;      Totals:         0       7       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_AdcOneChk
;; This function is called by:
;;		_app_adc_bat_voltage_check
;;		_Charge_Check
;; This function uses a non-reentrant model
;;
psect	text39,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
	line	54
global __ptext39
__ptext39:	;psect for function _AdcResultChk
psect	text39
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
	line	54
	global	__size_of_AdcResultChk
	__size_of_AdcResultChk	equ	__end_of_AdcResultChk-_AdcResultChk
	
_AdcResultChk:	
;incstack = 0
	opt	stack 1
; Regs used in _AdcResultChk: [wreg+status,2+status,0+pclath+cstack]
;AdcResultChk@adch stored from wreg
	movwf	(AdcResultChk@adch)
	line	56
	
l6273:	
;app_adc.c: 56: volatile unsigned char i = 0;
	clrf	(AdcResultChk@i)	;volatile
	line	63
	
l6275:	
;app_adc.c: 57: volatile unsigned int ad_value;
;app_adc.c: 58: volatile unsigned int ad_value_max;
;app_adc.c: 59: volatile unsigned int ad_value_min;
;app_adc.c: 61: volatile unsigned int ad_temp;
;app_adc.c: 63: ad_value = AdcOneChk(adch,adldo);
	movf	(AdcResultChk@adldo),w
	movwf	(AdcOneChk@adldo)
	movf	(AdcResultChk@adch),w
	fcall	_AdcOneChk
	movf	(1+(?_AdcOneChk)),w
	movwf	(AdcResultChk@ad_value+1)	;volatile
	movf	(0+(?_AdcOneChk)),w
	movwf	(AdcResultChk@ad_value)	;volatile
	line	64
	
l6277:	
;app_adc.c: 64: return ad_value;
	movf	(AdcResultChk@ad_value+1),w	;volatile
	movwf	(?_AdcResultChk+1)
	movf	(AdcResultChk@ad_value),w	;volatile
	movwf	(?_AdcResultChk)
	line	92
	
l510:	
	return
	opt stack 0
GLOBAL	__end_of_AdcResultChk
	__end_of_AdcResultChk:
	signat	_AdcResultChk,8314
	global	_AdcOneChk

;; *************** function _AdcOneChk *****************
;; Defined at:
;;		line 27 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
;; Parameters:    Size  Location     Type
;;  adch            1    wreg     unsigned char 
;;  adldo           1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  adch            1    0[COMMON] unsigned char 
;;  ad_result       2    4[BANK0 ] volatile unsigned int 
;;  i               1    3[BANK0 ] volatile unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       3       0
;;      Temps:          0       1       0
;;      Totals:         0       6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AdcResultChk
;; This function uses a non-reentrant model
;;
psect	text40,local,class=CODE,delta=2,merge=1,group=0
	line	27
global __ptext40
__ptext40:	;psect for function _AdcOneChk
psect	text40
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
	line	27
	global	__size_of_AdcOneChk
	__size_of_AdcOneChk	equ	__end_of_AdcOneChk-_AdcOneChk
	
_AdcOneChk:	
;incstack = 0
	opt	stack 1
; Regs used in _AdcOneChk: [wreg+status,2+status,0]
	line	29
	
l6225:	
;app_adc.c: 29: volatile unsigned char i = 0;
	clrf	(AdcOneChk@i)	;volatile
	line	33
	
l6227:	
;app_adc.c: 30: volatile unsigned int ad_result;
;app_adc.c: 33: _delay((unsigned long)((20)*(16000000UL/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	26
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_AdcOneChk+0)+0),f
	u3127:
decfsz	(??_AdcOneChk+0)+0,f
	goto	u3127
opt asmopt_pop

	line	35
# 35 "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
nop ;# 
	line	36
# 36 "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
nop ;# 
	line	37
# 37 "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
nop ;# 
	line	38
# 38 "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
nop ;# 
psect	text40
	line	39
	
l6229:	
;app_adc.c: 39: GODONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7	;volatile
	line	41
;app_adc.c: 41: while(GODONE)
	goto	l503
	
l504:	
	line	43
# 43 "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_adc.c"
clrwdt ;# 
psect	text40
	line	44
;app_adc.c: 44: if(0 == (--i))
	bcf	status, 5	;RP0=0, select bank0
	decfsz	(AdcOneChk@i),f	;volatile
	goto	u1311
	goto	u1310
u1311:
	goto	l503
u1310:
	line	45
	
l6231:	
;app_adc.c: 45: return 0;
	clrf	(?_AdcOneChk)
	clrf	(?_AdcOneChk+1)
	goto	l506
	line	46
	
l503:	
	line	41
	btfsc	(249/8),(249)&7	;volatile
	goto	u1321
	goto	u1320
u1321:
	goto	l504
u1320:
	line	47
	
l6235:	
;app_adc.c: 46: }
;app_adc.c: 47: ad_result=ADRESH;
	movf	(30),w	;volatile
	movwf	(AdcOneChk@ad_result)	;volatile
	clrf	(AdcOneChk@ad_result+1)	;volatile
	line	48
;app_adc.c: 48: ad_result= (ad_result<<4);
	swapf	(AdcOneChk@ad_result),f	;volatile
	swapf	(AdcOneChk@ad_result+1),f	;volatile
	movlw	0f0h
	andwf	(AdcOneChk@ad_result+1),f	;volatile
	movf	(AdcOneChk@ad_result),w	;volatile
	andlw	0fh
	iorwf	(AdcOneChk@ad_result+1),f	;volatile
	movlw	0f0h
	andwf	(AdcOneChk@ad_result),f	;volatile
	line	49
	
l6237:	
;app_adc.c: 49: ad_result +=(ADRESL>>4);
	bsf	status, 5	;RP0=1, select bank1
	swapf	(158)^080h,w	;volatile
	andlw	(0ffh shr 4) & 0ffh
	bcf	status, 5	;RP0=0, select bank0
	addwf	(AdcOneChk@ad_result),f	;volatile
	skipnc
	incf	(AdcOneChk@ad_result+1),f	;volatile
	line	51
	
l6239:	
;app_adc.c: 51: return ad_result;
	movf	(AdcOneChk@ad_result+1),w	;volatile
	movwf	(?_AdcOneChk+1)
	movf	(AdcOneChk@ad_result),w	;volatile
	movwf	(?_AdcOneChk)
	line	52
	
l506:	
	return
	opt stack 0
GLOBAL	__end_of_AdcOneChk
	__end_of_AdcOneChk:
	signat	_AdcOneChk,8314
	global	_Timer2Config

;; *************** function _Timer2Config *****************
;; Defined at:
;;		line 52 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text41,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
	line	52
global __ptext41
__ptext41:	;psect for function _Timer2Config
psect	text41
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
	line	52
	global	__size_of_Timer2Config
	__size_of_Timer2Config	equ	__end_of_Timer2Config-_Timer2Config
	
_Timer2Config:	
;incstack = 0
	opt	stack 4
; Regs used in _Timer2Config: [wreg]
	line	62
	
l7095:	
;main.c: 62: PR2 = 250;
	movlw	low(0FAh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	63
	
l7097:	
;main.c: 63: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(97/8),(97)&7	;volatile
	line	64
	
l7099:	
;main.c: 64: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7	;volatile
	line	65
;main.c: 65: T2CON = 0B00011100;
	movlw	low(01Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	66
	
l3771:	
	return
	opt stack 0
GLOBAL	__end_of_Timer2Config
	__end_of_Timer2Config:
	signat	_Timer2Config,89
	global	_Timer0Cofng

;; *************** function _Timer0Cofng *****************
;; Defined at:
;;		line 40 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 100/100
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text42,local,class=CODE,delta=2,merge=1,group=0
	line	40
global __ptext42
__ptext42:	;psect for function _Timer0Cofng
psect	text42
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
	line	40
	global	__size_of_Timer0Cofng
	__size_of_Timer0Cofng	equ	__end_of_Timer0Cofng-_Timer0Cofng
	
_Timer0Cofng:	
;incstack = 0
	opt	stack 4
; Regs used in _Timer0Cofng: [wreg+status,2]
	line	42
	
l7087:	
;main.c: 42: OPTION_REG = 0B00000000;
	clrf	(129)^080h	;volatile
	line	45
	
l7089:	
;main.c: 45: TMR0 = 165;
	movlw	low(0A5h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	47
	
l7091:	
;main.c: 47: T0IF = 0;
	bcf	(90/8),(90)&7	;volatile
	line	48
	
l7093:	
;main.c: 48: T0IE = 1;
	bsf	(93/8),(93)&7	;volatile
	line	49
	
l3768:	
	return
	opt stack 0
GLOBAL	__end_of_Timer0Cofng
	__end_of_Timer0Cofng:
	signat	_Timer0Cofng,89
	global	_PwmConfig

;; *************** function _PwmConfig *****************
;; Defined at:
;;		line 76 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 100/100
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text43,local,class=CODE,delta=2,merge=1,group=0
	line	76
global __ptext43
__ptext43:	;psect for function _PwmConfig
psect	text43
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
	line	76
	global	__size_of_PwmConfig
	__size_of_PwmConfig	equ	__end_of_PwmConfig-_PwmConfig
	
_PwmConfig:	
;incstack = 0
	opt	stack 4
; Regs used in _PwmConfig: [wreg+status,2]
	line	78
	
l7101:	
;main.c: 78: PWMCON = 0B01100000;
	movlw	low(060h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(27)	;volatile
	line	79
	
l7103:	
;main.c: 79: PWMTH = 0B00000000;
	clrf	(26)	;volatile
	line	80
	
l7105:	
;main.c: 80: PWMTL = 99;
	movlw	low(063h)
	movwf	(25)	;volatile
	line	81
	
l3777:	
	return
	opt stack 0
GLOBAL	__end_of_PwmConfig
	__end_of_PwmConfig:
	signat	_PwmConfig,89
	global	_Timer2_Isr

;; *************** function _Timer2_Isr *****************
;; Defined at:
;;		line 207 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_Mode_control
;;		_MotorWaterDrive
;;		_led_charge_pwm
;;		_process_led
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text44,local,class=CODE,delta=2,merge=1,group=0
	line	207
global __ptext44
__ptext44:	;psect for function _Timer2_Isr
psect	text44
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\main.c"
	line	207
	global	__size_of_Timer2_Isr
	__size_of_Timer2_Isr	equ	__end_of_Timer2_Isr-_Timer2_Isr
	
_Timer2_Isr:	
;incstack = 0
	opt	stack 0
; Regs used in _Timer2_Isr: [wreg+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_Timer2_Isr+0)
	movf	pclath,w
	movwf	(??_Timer2_Isr+1)
	ljmp	_Timer2_Isr
psect	text44
	line	221
	
i1l7205:	
;main.c: 221: if (PWMIF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(98/8),(98)&7	;volatile
	goto	u301_21
	goto	u301_20
u301_21:
	goto	i1l3797
u301_20:
	line	223
	
i1l7207:	
;main.c: 222: {
;main.c: 223: PWMIF = 0;
	bcf	(98/8),(98)&7	;volatile
	line	224
	
i1l3797:	
	line	226
;main.c: 224: }
;main.c: 226: if (T0IF)
	btfss	(90/8),(90)&7	;volatile
	goto	u302_21
	goto	u302_20
u302_21:
	goto	i1l7217
u302_20:
	line	228
	
i1l7209:	
;main.c: 227: {
;main.c: 228: TMR0 = 165;
	movlw	low(0A5h)
	movwf	(1)	;volatile
	line	229
	
i1l7211:	
;main.c: 229: T0IF = 0;
	bcf	(90/8),(90)&7	;volatile
	line	230
	
i1l7213:	
;main.c: 230: Mode_control();
	fcall	_Mode_control
	line	231
	
i1l7215:	
;main.c: 231: led_charge_pwm();
	fcall	_led_charge_pwm
	line	240
	
i1l7217:	
;main.c: 239: }
;main.c: 240: if (TMR2IF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7	;volatile
	goto	u303_21
	goto	u303_20
u303_21:
	goto	i1l7237
u303_20:
	line	242
	
i1l7219:	
;main.c: 241: {
;main.c: 242: TMR2IF = 0;
	bcf	(97/8),(97)&7	;volatile
	line	243
	
i1l7221:	
;main.c: 243: Cnt10ms++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_Cnt10ms)^080h,f
	skipnz
	incf	(_Cnt10ms+1)^080h,f
	line	244
;main.c: 244: Cnt1ms++;
	incf	(_Cnt1ms)^080h,f
	skipnz
	incf	(_Cnt1ms+1)^080h,f
	line	245
	
i1l7223:	
;main.c: 245: MotorWaterDrive();
	fcall	_MotorWaterDrive
	line	246
	
i1l7225:	
;main.c: 246: if (Cnt1ms == 4)
		movlw	4
	bsf	status, 5	;RP0=1, select bank1
	xorwf	((_Cnt1ms)^080h),w
iorwf	((_Cnt1ms+1)^080h),w
	btfss	status,2
	goto	u304_21
	goto	u304_20
u304_21:
	goto	i1l7231
u304_20:
	line	248
	
i1l7227:	
;main.c: 247: {
;main.c: 248: Cnt1ms = 0;
	clrf	(_Cnt1ms)^080h
	clrf	(_Cnt1ms+1)^080h
	line	249
	
i1l7229:	
;main.c: 249: process_led();
	fcall	_process_led
	line	251
	
i1l7231:	
;main.c: 250: }
;main.c: 251: if (Cnt10ms >= 40)
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_Cnt10ms+1)^080h,w
	movlw	028h
	skipnz
	subwf	(_Cnt10ms)^080h,w
	skipc
	goto	u305_21
	goto	u305_20
u305_21:
	goto	i1l7237
u305_20:
	line	253
	
i1l7233:	
;main.c: 252: {
;main.c: 253: Cnt10ms = 0;
	clrf	(_Cnt10ms)^080h
	clrf	(_Cnt10ms+1)^080h
	line	254
	
i1l7235:	
;main.c: 254: Flag_10ms = 1;
	bsf	(_Flag_10ms/8),(_Flag_10ms)&7	;volatile
	line	257
	
i1l7237:	
;main.c: 255: }
;main.c: 256: }
;main.c: 257: if (RAIF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(99/8),(99)&7	;volatile
	goto	u306_21
	goto	u306_20
u306_21:
	goto	i1l7243
u306_20:
	line	259
	
i1l7239:	
;main.c: 258: {
;main.c: 259: RAIF = 0;
	bcf	(99/8),(99)&7	;volatile
	line	260
	
i1l7241:	
;main.c: 260: PORTA;
	movf	(5),w	;volatile
	line	262
	
i1l7243:	
;main.c: 261: }
;main.c: 262: if (RBIF)
	btfss	(88/8),(88)&7	;volatile
	goto	u307_21
	goto	u307_20
u307_21:
	goto	i1l3804
u307_20:
	line	264
	
i1l7245:	
;main.c: 263: {
;main.c: 264: RBIF = 0;
	bcf	(88/8),(88)&7	;volatile
	line	265
	
i1l7247:	
;main.c: 265: PORTB;
	movf	(6),w	;volatile
	line	268
	
i1l3804:	
	movf	(??_Timer2_Isr+1),w
	movwf	pclath
	swapf	(??_Timer2_Isr+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_Timer2_Isr
	__end_of_Timer2_Isr:
	signat	_Timer2_Isr,89
	global	_process_led

;; *************** function _process_led *****************
;; Defined at:
;;		line 286 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/100
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Timer2_Isr
;; This function uses a non-reentrant model
;;
psect	text45,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
	line	286
global __ptext45
__ptext45:	;psect for function _process_led
psect	text45
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
	line	286
	global	__size_of_process_led
	__size_of_process_led	equ	__end_of_process_led-_process_led
	
_process_led:	
;incstack = 0
	opt	stack 1
; Regs used in _process_led: [wreg+status,2+status,0]
	line	288
	
i1l7015:	
;app_led.c: 288: if (is_charge_pwm)
	btfss	(_is_charge_pwm/8),(_is_charge_pwm)&7
	goto	u267_21
	goto	u267_20
u267_21:
	goto	i1l7019
u267_20:
	goto	i1l2246
	line	292
	
i1l7019:	
;app_led.c: 291: }
;app_led.c: 292: TRISA = 0b01011111;
	movlw	low(05Fh)
	movwf	(133)^080h	;volatile
	line	294
	
i1l7021:	
;app_led.c: 294: if (step == 0)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_step)),w	;volatile
	btfss	status,2
	goto	u268_21
	goto	u268_20
u268_21:
	goto	i1l7035
u268_20:
	line	296
	
i1l7023:	
;app_led.c: 295: {
;app_led.c: 296: if (led_index & LED_INDEX_1)
	btfss	(_led_index),(0)&7
	goto	u269_21
	goto	u269_20
u269_21:
	goto	i1l2248
u269_20:
	line	298
	
i1l7025:	
;app_led.c: 297: {
;app_led.c: 298: RA1 = 0;
	bcf	(41/8),(41)&7	;volatile
	line	299
;app_led.c: 299: TRISA &= ~(1 << (1));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(1/8),(1)&7	;volatile
	line	300
	
i1l2248:	
	line	301
;app_led.c: 300: }
;app_led.c: 301: if (led_index & LED_INDEX_2)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(_led_index),(1)&7
	goto	u270_21
	goto	u270_20
u270_21:
	goto	i1l2249
u270_20:
	line	303
	
i1l7027:	
;app_led.c: 302: {
;app_led.c: 303: RA2 = 0;
	bcf	(42/8),(42)&7	;volatile
	line	304
;app_led.c: 304: TRISA &= ~(1 << (2));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(2/8),(2)&7	;volatile
	line	305
	
i1l2249:	
	line	306
;app_led.c: 305: }
;app_led.c: 306: if (led_index & LED_INDEX_3)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(_led_index),(2)&7
	goto	u271_21
	goto	u271_20
u271_21:
	goto	i1l2250
u271_20:
	line	308
	
i1l7029:	
;app_led.c: 307: {
;app_led.c: 308: RA3 = 0;
	bcf	(43/8),(43)&7	;volatile
	line	309
;app_led.c: 309: TRISA &= ~(1 << (3));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(3/8),(3)&7	;volatile
	line	310
	
i1l2250:	
	line	311
;app_led.c: 310: }
;app_led.c: 311: if (led_index & LED_INDEX_4)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(_led_index),(3)&7
	goto	u272_21
	goto	u272_20
u272_21:
	goto	i1l2251
u272_20:
	line	313
	
i1l7031:	
;app_led.c: 312: {
;app_led.c: 313: RA4 = 0;
	bcf	(44/8),(44)&7	;volatile
	line	314
;app_led.c: 314: TRISA &= ~(1 << (4));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(4/8),(4)&7	;volatile
	line	315
	
i1l2251:	
	line	316
;app_led.c: 315: }
;app_led.c: 316: if (led_index & LED_INDEX_5)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(_led_index),(4)&7
	goto	u273_21
	goto	u273_20
u273_21:
	goto	i1l2252
u273_20:
	line	318
	
i1l7033:	
;app_led.c: 317: {
;app_led.c: 318: RA6 = 0;
	bcf	(46/8),(46)&7	;volatile
	line	319
;app_led.c: 319: TRISA &= ~(1 << (6));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	320
	
i1l2252:	
	line	321
;app_led.c: 320: }
;app_led.c: 321: RA0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(40/8),(40)&7	;volatile
	line	322
;app_led.c: 322: TRISA &= ~(1 << (0));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(0/8),(0)&7	;volatile
	line	324
	
i1l7035:	
;app_led.c: 323: }
;app_led.c: 324: if (step == 1)
	bcf	status, 5	;RP0=0, select bank0
		decf	((_step)),w	;volatile
	btfss	status,2
	goto	u274_21
	goto	u274_20
u274_21:
	goto	i1l7045
u274_20:
	line	326
	
i1l7037:	
;app_led.c: 325: {
;app_led.c: 326: if (led_index & LED_INDEX_6)
	btfss	(_led_index),(5)&7
	goto	u275_21
	goto	u275_20
u275_21:
	goto	i1l2254
u275_20:
	line	328
	
i1l7039:	
;app_led.c: 327: {
;app_led.c: 328: RA3 = 0;
	bcf	(43/8),(43)&7	;volatile
	line	329
;app_led.c: 329: TRISA &= ~(1 << (3));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(3/8),(3)&7	;volatile
	line	330
	
i1l2254:	
	line	331
;app_led.c: 330: }
;app_led.c: 331: if (led_index & LED_INDEX_7)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(_led_index),(6)&7
	goto	u276_21
	goto	u276_20
u276_21:
	goto	i1l2255
u276_20:
	line	333
	
i1l7041:	
;app_led.c: 332: {
;app_led.c: 333: RA6 = 0;
	bcf	(46/8),(46)&7	;volatile
	line	334
;app_led.c: 334: TRISA &= ~(1 << (6));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	335
	
i1l2255:	
	line	336
;app_led.c: 335: }
;app_led.c: 336: if (led_index & LED_INDEX_8)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(_led_index),(7)&7
	goto	u277_21
	goto	u277_20
u277_21:
	goto	i1l2256
u277_20:
	line	338
	
i1l7043:	
;app_led.c: 337: {
;app_led.c: 338: RA4 = 0;
	bcf	(44/8),(44)&7	;volatile
	line	339
;app_led.c: 339: TRISA &= ~(1 << (4));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(4/8),(4)&7	;volatile
	line	340
	
i1l2256:	
	line	341
;app_led.c: 340: }
;app_led.c: 341: RA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7	;volatile
	line	342
;app_led.c: 342: TRISA &= ~(1 << (1));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(1/8),(1)&7	;volatile
	line	344
	
i1l7045:	
;app_led.c: 343: }
;app_led.c: 344: if (step == 2)
		movlw	2
	bcf	status, 5	;RP0=0, select bank0
	xorwf	((_step)),w	;volatile
	btfss	status,2
	goto	u278_21
	goto	u278_20
u278_21:
	goto	i1l7051
u278_20:
	line	346
	
i1l7047:	
;app_led.c: 345: {
;app_led.c: 346: if (led_index & LED_INDEX_9)
	btfss	(_led_index+1),(8)&7
	goto	u279_21
	goto	u279_20
u279_21:
	goto	i1l2258
u279_20:
	line	348
	
i1l7049:	
;app_led.c: 347: {
;app_led.c: 348: RA3 = 0;
	bcf	(43/8),(43)&7	;volatile
	line	349
;app_led.c: 349: TRISA &= ~(1 << (3));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(3/8),(3)&7	;volatile
	line	350
	
i1l2258:	
	line	351
;app_led.c: 350: }
;app_led.c: 351: RA2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(42/8),(42)&7	;volatile
	line	352
;app_led.c: 352: TRISA &= ~(1 << (2));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(2/8),(2)&7	;volatile
	line	354
	
i1l7051:	
;app_led.c: 353: }
;app_led.c: 354: if (step == 3)
		movlw	3
	bcf	status, 5	;RP0=0, select bank0
	xorwf	((_step)),w	;volatile
	btfss	status,2
	goto	u280_21
	goto	u280_20
u280_21:
	goto	i1l7057
u280_20:
	line	356
	
i1l7053:	
;app_led.c: 355: {
;app_led.c: 356: if (led_index & LED_INDEX_10)
	btfss	(_led_index+1),(9)&7
	goto	u281_21
	goto	u281_20
u281_21:
	goto	i1l2260
u281_20:
	line	358
	
i1l7055:	
;app_led.c: 357: {
;app_led.c: 358: RA4 = 0;
	bcf	(44/8),(44)&7	;volatile
	line	359
;app_led.c: 359: TRISA &= ~(1 << (4));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(4/8),(4)&7	;volatile
	line	360
	
i1l2260:	
	line	361
;app_led.c: 360: }
;app_led.c: 361: RA2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(42/8),(42)&7	;volatile
	line	362
;app_led.c: 362: TRISA &= ~(1 << (2));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(2/8),(2)&7	;volatile
	line	364
	
i1l7057:	
;app_led.c: 363: }
;app_led.c: 364: step++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_step),f	;volatile
	line	365
	
i1l7059:	
;app_led.c: 365: if (step > 3)
	movlw	low(04h)
	subwf	(_step),w	;volatile
	skipc
	goto	u282_21
	goto	u282_20
u282_21:
	goto	i1l2246
u282_20:
	line	367
	
i1l7061:	
;app_led.c: 366: {
;app_led.c: 367: step = 0;
	clrf	(_step)	;volatile
	line	369
	
i1l2246:	
	return
	opt stack 0
GLOBAL	__end_of_process_led
	__end_of_process_led:
	signat	_process_led,89
	global	_led_charge_pwm

;; *************** function _led_charge_pwm *****************
;; Defined at:
;;		line 58 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_set_led_state
;; This function is called by:
;;		_Timer2_Isr
;; This function uses a non-reentrant model
;;
psect	text46,local,class=CODE,delta=2,merge=1,group=0
	line	58
global __ptext46
__ptext46:	;psect for function _led_charge_pwm
psect	text46
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
	line	58
	global	__size_of_led_charge_pwm
	__size_of_led_charge_pwm	equ	__end_of_led_charge_pwm-_led_charge_pwm
	
_led_charge_pwm:	
;incstack = 0
	opt	stack 0
; Regs used in _led_charge_pwm: [wreg+status,2+status,0+pclath+cstack]
	line	60
	
i1l6903:	
;app_led.c: 60: if (WORK_STATE_CHARGING == app_work_state)
		movlw	2
	xorwf	((_app_work_state)),w	;volatile
	btfss	status,2
	goto	u240_21
	goto	u240_20
u240_21:
	goto	i1l2168
u240_20:
	line	62
	
i1l6905:	
;app_led.c: 61: {
;app_led.c: 62: if (app_charge.Charge)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(_app_charge)^080h,0
	goto	u241_21
	goto	u241_20
u241_21:
	goto	i1l2186
u241_20:
	line	64
	
i1l6907:	
;app_led.c: 63: {
;app_led.c: 64: RA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(40/8),(40)&7	;volatile
	line	65
;app_led.c: 65: TRISA &= ~(1 << (0));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(0/8),(0)&7	;volatile
	line	66
;app_led.c: 66: RA1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7	;volatile
	line	67
;app_led.c: 67: TRISA &= ~(1 << (1));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(1/8),(1)&7	;volatile
	line	68
;app_led.c: 68: RA6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7	;volatile
	line	69
;app_led.c: 69: TRISA &= ~(1 << (6));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	70
;app_led.c: 70: if (app_charge.flag_charge_force_full_24hour)
	btfss	(_app_charge)^080h,3
	goto	u242_21
	goto	u242_20
u242_21:
	goto	i1l2170
u242_20:
	line	72
	
i1l6909:	
;app_led.c: 71: {
;app_led.c: 72: is_charge_pwm = 0;
	bcf	(_is_charge_pwm/8),(_is_charge_pwm)&7
	line	73
	
i1l6911:	
;app_led.c: 73: set_led_state(LED_INDEX_9 | LED_INDEX_10, LED_STATE_OFF);
	movlw	0
	movwf	(i1set_led_state@index)
	movlw	03h
	movwf	((i1set_led_state@index))+1
	clrf	(i1set_led_state@state)
	fcall	i1_set_led_state
	line	74
;app_led.c: 74: }
	goto	i1l2186
	line	75
	
i1l2170:	
;app_led.c: 75: else if (app_charge.FullCharge || app_charge.ForceFullCharge)
	btfsc	(_app_charge)^080h,1
	goto	u243_21
	goto	u243_20
u243_21:
	goto	i1l2174
u243_20:
	
i1l6913:	
	btfss	(_app_charge)^080h,2
	goto	u244_21
	goto	u244_20
u244_21:
	goto	i1l2172
u244_20:
	
i1l2174:	
	line	77
;app_led.c: 76: {
;app_led.c: 77: is_charge_pwm = 0;
	bcf	(_is_charge_pwm/8),(_is_charge_pwm)&7
	line	78
	
i1l6915:	
;app_led.c: 78: set_led_state(LED_INDEX_9, LED_STATE_ON);
	movlw	0
	movwf	(i1set_led_state@index)
	movlw	01h
	movwf	((i1set_led_state@index))+1
	clrf	(i1set_led_state@state)
	incf	(i1set_led_state@state),f
	fcall	i1_set_led_state
	line	79
;app_led.c: 79: set_led_state(LED_INDEX_10, LED_STATE_OFF);
	movlw	0
	movwf	(i1set_led_state@index)
	movlw	02h
	movwf	((i1set_led_state@index))+1
	clrf	(i1set_led_state@state)
	fcall	i1_set_led_state
	line	80
;app_led.c: 80: }
	goto	i1l2186
	line	81
	
i1l2172:	
	line	83
;app_led.c: 81: else
;app_led.c: 82: {
;app_led.c: 83: is_charge_pwm = 1;
	bsf	(_is_charge_pwm/8),(_is_charge_pwm)&7
	line	84
	
i1l6917:	
;app_led.c: 84: PWM_Cnt++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_PWM_Cnt),f
	skipnz
	incf	(_PWM_Cnt+1),f
	line	87
	
i1l6919:	
;app_led.c: 87: if (PWM_Duty >= PWM_Cnt)
	movf	(_PWM_Cnt+1),w
	subwf	(_PWM_Duty+1),w
	skipz
	goto	u245_25
	movf	(_PWM_Cnt),w
	subwf	(_PWM_Duty),w
u245_25:
	skipc
	goto	u245_21
	goto	u245_20
u245_21:
	goto	i1l2176
u245_20:
	line	89
	
i1l6921:	
;app_led.c: 88: {
;app_led.c: 89: RA2 = 1;
	bsf	(42/8),(42)&7	;volatile
	line	90
;app_led.c: 90: TRISA &= ~(1 << (2));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(2/8),(2)&7	;volatile
	line	91
;app_led.c: 91: RA4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(44/8),(44)&7	;volatile
	line	92
;app_led.c: 92: TRISA &= ~(1 << (4));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(4/8),(4)&7	;volatile
	line	93
;app_led.c: 93: RA3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(43/8),(43)&7	;volatile
	line	94
;app_led.c: 94: TRISA &= ~(1 << (3));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(3/8),(3)&7	;volatile
	line	95
;app_led.c: 95: }
	goto	i1l6923
	line	96
	
i1l2176:	
	line	98
;app_led.c: 96: else
;app_led.c: 97: {
;app_led.c: 98: RA2 = 0;
	bcf	(42/8),(42)&7	;volatile
	line	99
;app_led.c: 99: TRISA &= ~(1 << (2));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(2/8),(2)&7	;volatile
	line	100
;app_led.c: 100: RA4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(44/8),(44)&7	;volatile
	line	101
;app_led.c: 101: TRISA &= ~(1 << (4));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(4/8),(4)&7	;volatile
	line	103
	
i1l6923:	
;app_led.c: 102: }
;app_led.c: 103: if (PWM_Cnt >= 199)
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_PWM_Cnt+1),w
	movlw	0C7h
	skipnz
	subwf	(_PWM_Cnt),w
	skipc
	goto	u246_21
	goto	u246_20
u246_21:
	goto	i1l6927
u246_20:
	line	105
	
i1l6925:	
;app_led.c: 104: {
;app_led.c: 105: PWM_Cnt = 0;
	clrf	(_PWM_Cnt)
	clrf	(_PWM_Cnt+1)
	line	107
	
i1l6927:	
;app_led.c: 106: }
;app_led.c: 107: pwm_timer++;
	incf	(_pwm_timer),f
	skipnz
	incf	(_pwm_timer+1),f
	line	108
	
i1l6929:	
;app_led.c: 108: if (!PWM_dir)
	btfsc	(_PWM_dir/8),(_PWM_dir)&7
	goto	u247_21
	goto	u247_20
u247_21:
	goto	i1l6941
u247_20:
	line	110
	
i1l6931:	
;app_led.c: 109: {
;app_led.c: 110: if (pwm_timer >= 200)
	movlw	0
	subwf	(_pwm_timer+1),w
	movlw	0C8h
	skipnz
	subwf	(_pwm_timer),w
	skipc
	goto	u248_21
	goto	u248_20
u248_21:
	goto	i1l2186
u248_20:
	line	112
	
i1l6933:	
;app_led.c: 111: {
;app_led.c: 112: pwm_timer = 0;
	clrf	(_pwm_timer)
	clrf	(_pwm_timer+1)
	line	114
	
i1l6935:	
;app_led.c: 114: if (PWM_Duty >= 199)
	movlw	0
	subwf	(_PWM_Duty+1),w
	movlw	0C7h
	skipnz
	subwf	(_PWM_Duty),w
	skipc
	goto	u249_21
	goto	u249_20
u249_21:
	goto	i1l6939
u249_20:
	line	116
	
i1l6937:	
;app_led.c: 115: {
;app_led.c: 116: PWM_dir = 1;
	bsf	(_PWM_dir/8),(_PWM_dir)&7
	line	118
	
i1l6939:	
;app_led.c: 117: }
;app_led.c: 118: PWM_Duty++;
	incf	(_PWM_Duty),f
	skipnz
	incf	(_PWM_Duty+1),f
	goto	i1l2186
	line	123
	
i1l6941:	
;app_led.c: 121: else
;app_led.c: 122: {
;app_led.c: 123: if (pwm_timer >= 200)
	movlw	0
	subwf	(_pwm_timer+1),w
	movlw	0C8h
	skipnz
	subwf	(_pwm_timer),w
	skipc
	goto	u250_21
	goto	u250_20
u250_21:
	goto	i1l2175
u250_20:
	line	126
	
i1l6943:	
;app_led.c: 124: {
;app_led.c: 126: pwm_timer = 0;
	clrf	(_pwm_timer)
	clrf	(_pwm_timer+1)
	line	129
	
i1l6945:	
;app_led.c: 129: PWM_Duty--;
	movlw	01h
	subwf	(_PWM_Duty),f
	movlw	0
	skipc
	decf	(_PWM_Duty+1),f
	subwf	(_PWM_Duty+1),f
	line	130
	
i1l6947:	
;app_led.c: 130: if (!PWM_Duty)
	movf	((_PWM_Duty)),w
iorwf	((_PWM_Duty+1)),w
	btfss	status,2
	goto	u251_21
	goto	u251_20
u251_21:
	goto	i1l2175
u251_20:
	line	132
	
i1l6949:	
;app_led.c: 131: {
;app_led.c: 132: PWM_dir = 0;
	bcf	(_PWM_dir/8),(_PWM_dir)&7
	goto	i1l2186
	line	136
	
i1l2175:	
	goto	i1l2186
	line	139
	
i1l2168:	
	line	141
;app_led.c: 139: else
;app_led.c: 140: {
;app_led.c: 141: is_charge_pwm = 0;
	bcf	(_is_charge_pwm/8),(_is_charge_pwm)&7
	line	142
	
i1l6951:	
;app_led.c: 142: PWM_Cnt = 0;
	clrf	(_PWM_Cnt)
	clrf	(_PWM_Cnt+1)
	line	143
;app_led.c: 143: pwm_timer = 0;
	clrf	(_pwm_timer)
	clrf	(_pwm_timer+1)
	line	145
	
i1l2186:	
	return
	opt stack 0
GLOBAL	__end_of_led_charge_pwm
	__end_of_led_charge_pwm:
	signat	_led_charge_pwm,89
	global	i1_set_led_state

;; *************** function i1_set_led_state *****************
;; Defined at:
;;		line 269 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
;; Parameters:    Size  Location     Type
;;  index           2    0[COMMON] enum E591
;;  state           1    2[COMMON] enum E587
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/100
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         3       0       0
;;      Locals:         0       0       0
;;      Temps:          6       0       0
;;      Totals:         9       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_led_charge_pwm
;; This function uses a non-reentrant model
;;
psect	text47,local,class=CODE,delta=2,merge=1,group=0
	line	269
global __ptext47
__ptext47:	;psect for function i1_set_led_state
psect	text47
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_led.c"
	line	269
	global	__size_ofi1_set_led_state
	__size_ofi1_set_led_state	equ	__end_ofi1_set_led_state-i1_set_led_state
	
i1_set_led_state:	
;incstack = 0
	opt	stack 0
; Regs used in i1_set_led_state: [wreg+status,2+status,0]
	line	271
	
i1l6885:	
;app_led.c: 271: if (LED_STATE_ON == state)
		decf	((i1set_led_state@state)),w
	btfss	status,2
	goto	u238_21
	goto	u238_20
u238_21:
	goto	i1l6889
u238_20:
	line	273
	
i1l6887:	
;app_led.c: 272: {
;app_led.c: 273: led_index |= index;
	movf	(i1set_led_state@index),w
	movwf	((??i1_set_led_state+0)+0)
	movf	(i1set_led_state@index+1),w
	movwf	((??i1_set_led_state+0)+0+1)
	clrf	((??i1_set_led_state+0)+0+2)
	clrf	((??i1_set_led_state+0)+0+3)
	movf	0+(??i1_set_led_state+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	iorwf	(_led_index),f
	movf	1+(??i1_set_led_state+0)+0,w
	iorwf	(_led_index+1),f
	movf	2+(??i1_set_led_state+0)+0,w
	iorwf	(_led_index+2),f
	movf	3+(??i1_set_led_state+0)+0,w
	iorwf	(_led_index+3),f
	line	274
;app_led.c: 274: }
	goto	i1l2237
	line	275
	
i1l6889:	
;app_led.c: 275: else if (LED_STATE_OFF == state)
	movf	((i1set_led_state@state)),w
	btfss	status,2
	goto	u239_21
	goto	u239_20
u239_21:
	goto	i1l2237
u239_20:
	line	277
	
i1l6891:	
;app_led.c: 276: {
;app_led.c: 277: led_index &= ~index;
	movf	(i1set_led_state@index+1),w
	movwf	(??i1_set_led_state+0)+0+1
	movf	(i1set_led_state@index),w
	movwf	(??i1_set_led_state+0)+0
	comf	(??i1_set_led_state+0)+0,f
	comf	(??i1_set_led_state+0)+1,f
	movf	0+(??i1_set_led_state+0)+0,w
	movwf	((??i1_set_led_state+2)+0)
	movf	1+(??i1_set_led_state+0)+0,w
	movwf	((??i1_set_led_state+2)+0+1)
	movlw	0
	btfsc	((??i1_set_led_state+2)+0+1),7
	movlw	255
	movwf	((??i1_set_led_state+2)+0+2)
	movwf	((??i1_set_led_state+2)+0+3)
	movf	0+(??i1_set_led_state+2)+0,w
	bcf	status, 5	;RP0=0, select bank0
	andwf	(_led_index),f
	movf	1+(??i1_set_led_state+2)+0,w
	andwf	(_led_index+1),f
	movf	2+(??i1_set_led_state+2)+0,w
	andwf	(_led_index+2),f
	movf	3+(??i1_set_led_state+2)+0,w
	andwf	(_led_index+3),f
	line	279
	
i1l2237:	
	return
	opt stack 0
GLOBAL	__end_ofi1_set_led_state
	__end_ofi1_set_led_state:
	signat	i1_set_led_state,89
	global	_MotorWaterDrive

;; *************** function _MotorWaterDrive *****************
;; Defined at:
;;		line 73 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/100
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Timer2_Isr
;; This function uses a non-reentrant model
;;
psect	text48,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
	line	73
global __ptext48
__ptext48:	;psect for function _MotorWaterDrive
psect	text48
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_water_process.c"
	line	73
	global	__size_of_MotorWaterDrive
	__size_of_MotorWaterDrive	equ	__end_of_MotorWaterDrive-_MotorWaterDrive
	
_MotorWaterDrive:	
;incstack = 0
	opt	stack 1
; Regs used in _MotorWaterDrive: [wreg+status,2+status,0]
	line	75
	
i1l7151:	
;app_water_process.c: 75: if(water_work_mode.water_mode_out_put == WATER_WORK_MODE_IDEL)
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(_water_work_mode)+01h),w
	btfss	status,2
	goto	u296_21
	goto	u296_20
u296_21:
	goto	i1l7155
u296_20:
	line	77
	
i1l7153:	
;app_water_process.c: 76: {
;app_water_process.c: 77: (RA5=0);
	bcf	(45/8),(45)&7	;volatile
	line	78
;app_water_process.c: 78: return;
	goto	i1l4813
	line	80
	
i1l7155:	
;app_water_process.c: 79: }
;app_water_process.c: 80: CntWaterDrive++;
	incf	(_CntWaterDrive),f
	line	81
	
i1l7157:	
;app_water_process.c: 81: if(CntWaterDrive==1)
		decf	((_CntWaterDrive)),w
	btfss	status,2
	goto	u297_21
	goto	u297_20
u297_21:
	goto	i1l7161
u297_20:
	line	83
	
i1l7159:	
;app_water_process.c: 82: {
;app_water_process.c: 83: (RA5=1);
	bsf	(45/8),(45)&7	;volatile
	line	85
	
i1l7161:	
;app_water_process.c: 84: }
;app_water_process.c: 85: if(CntWaterDrive==MotorWaterDuty)
	movf	(_CntWaterDrive),w
	xorwf	(_MotorWaterDuty),w
	skipz
	goto	u298_21
	goto	u298_20
u298_21:
	goto	i1l7165
u298_20:
	line	87
	
i1l7163:	
;app_water_process.c: 86: {
;app_water_process.c: 87: (RA5=0);
	bcf	(45/8),(45)&7	;volatile
	line	89
	
i1l7165:	
;app_water_process.c: 88: }
;app_water_process.c: 89: if(CntWaterDrive>99)
	movlw	low(064h)
	subwf	(_CntWaterDrive),w
	skipc
	goto	u299_21
	goto	u299_20
u299_21:
	goto	i1l4813
u299_20:
	line	91
	
i1l7167:	
;app_water_process.c: 90: {
;app_water_process.c: 91: CntWaterDrive=0;
	clrf	(_CntWaterDrive)
	line	93
	
i1l4813:	
	return
	opt stack 0
GLOBAL	__end_of_MotorWaterDrive
	__end_of_MotorWaterDrive:
	signat	_MotorWaterDrive,89
	global	_Mode_control

;; *************** function _Mode_control *****************
;; Defined at:
;;		line 89 in file "D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_motor.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Timer2_Isr
;; This function uses a non-reentrant model
;;
psect	text49,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_motor.c"
	line	89
global __ptext49
__ptext49:	;psect for function _Mode_control
psect	text49
	file	"D:\Weiai\project\°¬çê¶û\ABB868\ABB868_V4_SC8P1712E_20250310_0xf33d¸ÄÎªºôÎüµÆ°æ±¾\app_motor.c"
	line	89
	global	__size_of_Mode_control
	__size_of_Mode_control	equ	__end_of_Mode_control-_Mode_control
	
_Mode_control:	
;incstack = 0
	opt	stack 1
; Regs used in _Mode_control: [wreg+status,2+status,0]
	line	94
	
i1l7123:	
;app_motor.c: 94: if(WORK_MODE_IDEL == work_mode.mode_out_put)
	movf	(0+(_work_mode)+01h),w
	btfss	status,2
	goto	u290_21
	goto	u290_20
u290_21:
	goto	i1l7127
u290_20:
	line	96
	
i1l7125:	
;app_motor.c: 95: {
;app_motor.c: 96: RB5 = 0;
	bcf	(53/8),(53)&7	;volatile
	line	97
;app_motor.c: 97: RB6 = 0;
	bcf	(54/8),(54)&7	;volatile
	line	98
;app_motor.c: 98: return;
	goto	i1l4308
	line	101
	
i1l7127:	
;app_motor.c: 99: }
;app_motor.c: 101: motor_fix_cnt++;
	incf	(_motor_fix_cnt),f	;volatile
	skipnz
	incf	(_motor_fix_cnt+1),f	;volatile
	line	102
	
i1l7129:	
;app_motor.c: 102: if (motor_fix_cnt <= low_a)
	movf	(_low_a),w
	movwf	(??_Mode_control+0)+0
	clrf	(??_Mode_control+0)+0+1
	movf	(_motor_fix_cnt+1),w	;volatile
	subwf	1+(??_Mode_control+0)+0,w
	skipz
	goto	u291_25
	movf	(_motor_fix_cnt),w	;volatile
	subwf	0+(??_Mode_control+0)+0,w
u291_25:
	skipc
	goto	u291_21
	goto	u291_20
u291_21:
	goto	i1l7133
u291_20:
	line	104
	
i1l7131:	
;app_motor.c: 103: {
;app_motor.c: 104: RB5 = 0;
	bcf	(53/8),(53)&7	;volatile
	line	106
;app_motor.c: 106: }
	goto	i1l7137
	line	107
	
i1l7133:	
;app_motor.c: 107: else if (motor_fix_cnt <= dead_area1)
	movf	(_dead_area1),w
	movwf	(??_Mode_control+0)+0
	clrf	(??_Mode_control+0)+0+1
	movf	(_motor_fix_cnt+1),w	;volatile
	subwf	1+(??_Mode_control+0)+0,w
	skipz
	goto	u292_25
	movf	(_motor_fix_cnt),w	;volatile
	subwf	0+(??_Mode_control+0)+0,w
u292_25:
	skipc
	goto	u292_21
	goto	u292_20
u292_21:
	goto	i1l7137
u292_20:
	line	109
	
i1l7135:	
;app_motor.c: 108: {
;app_motor.c: 109: RB5 = 1;
	bsf	(53/8),(53)&7	;volatile
	line	117
;app_motor.c: 111: }
	
i1l7137:	
;app_motor.c: 115: }
;app_motor.c: 117: if (motor_fix_cnt <= dead_area_b1)
	movf	(_dead_area_b1),w
	movwf	(??_Mode_control+0)+0
	clrf	(??_Mode_control+0)+0+1
	movf	(_motor_fix_cnt+1),w	;volatile
	subwf	1+(??_Mode_control+0)+0,w
	skipz
	goto	u293_25
	movf	(_motor_fix_cnt),w	;volatile
	subwf	0+(??_Mode_control+0)+0,w
u293_25:
	skipc
	goto	u293_21
	goto	u293_20
u293_21:
	goto	i1l7141
u293_20:
	line	119
	
i1l7139:	
;app_motor.c: 118: {
;app_motor.c: 119: RB6 = 1;
	bsf	(54/8),(54)&7	;volatile
	line	121
;app_motor.c: 121: }
	goto	i1l4308
	line	122
	
i1l7141:	
;app_motor.c: 122: else if (motor_fix_cnt <= low_b)
	movf	(_low_b),w
	movwf	(??_Mode_control+0)+0
	clrf	(??_Mode_control+0)+0+1
	movf	(_motor_fix_cnt+1),w	;volatile
	subwf	1+(??_Mode_control+0)+0,w
	skipz
	goto	u294_25
	movf	(_motor_fix_cnt),w	;volatile
	subwf	0+(??_Mode_control+0)+0,w
u294_25:
	skipc
	goto	u294_21
	goto	u294_20
u294_21:
	goto	i1l7145
u294_20:
	line	124
	
i1l7143:	
;app_motor.c: 123: {
;app_motor.c: 124: RB6 = 0;
	bcf	(54/8),(54)&7	;volatile
	line	126
;app_motor.c: 126: }
	goto	i1l4308
	line	127
	
i1l7145:	
;app_motor.c: 127: else if (motor_fix_cnt <= dead_area_b2)
	movf	(_dead_area_b2),w
	movwf	(??_Mode_control+0)+0
	clrf	(??_Mode_control+0)+0+1
	movf	(_motor_fix_cnt+1),w	;volatile
	subwf	1+(??_Mode_control+0)+0,w
	skipz
	goto	u295_25
	movf	(_motor_fix_cnt),w	;volatile
	subwf	0+(??_Mode_control+0)+0,w
u295_25:
	skipc
	goto	u295_21
	goto	u295_20
u295_21:
	goto	i1l7149
u295_20:
	goto	i1l7139
	line	134
	
i1l7149:	
;app_motor.c: 132: else
;app_motor.c: 133: {
;app_motor.c: 134: motor_fix_cnt = 0;
	clrf	(_motor_fix_cnt)	;volatile
	clrf	(_motor_fix_cnt+1)	;volatile
	line	137
	
i1l4308:	
	return
	opt stack 0
GLOBAL	__end_of_Mode_control
	__end_of_Mode_control:
	signat	_Mode_control,89
global	___latbits
___latbits	equ	0
	global	fptotal
fptotal equ 3
	file ""
	line	#
psect	functab,class=ENTRY,delta=2
global __pfunctab
__pfunctab:
	global	fptable,__fptable
__fptable:
fptable:
	movwf (btemp+1)&07Fh
	movlw high(fptable)
	movwf pclath
	movf (btemp+1)&07Fh,w
	addwf pc
	global	fpbase
fpbase:
	goto fpbase	; Call via a null pointer and you will get stuck here.
	file ""
	line	#
fp__app_process_power_off:
entry__app_process_power_off:
	global	entry__app_process_power_off
	ljmp	_app_process_power_off
	file ""
	line	#
fp__app_process_charing:
entry__app_process_charing:
	global	entry__app_process_charing
	ljmp	_app_process_charing
	file ""
	line	#
fp__app_process_working:
entry__app_process_working:
	global	entry__app_process_working
	ljmp	_app_process_working
	global __end_of__fptable
	__end_of__fptable:
	global __size_of__fptable
	__size_of__fptable	equ	__end_of__fptable-__fptable
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
