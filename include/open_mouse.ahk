;*************************************
;*****							 *****
;*****此模块是鼠标模块
;*****							 *****
;*****							 *****
;*************************************

;===================================>用百度搜索选中文字
LAlt & LButton::
{
	if(is_it_by_class("XLMAIN"))
		sendevent {Click}
	clipboard =  
	sendevent ^c
	ClipWait 
	clipboard1 = %clipboard% 
	run https://www.baidu.com/s?wd=%clipboard1%
	return
}

;===================================>用百度百科搜索选中文字
LAlt & RButton::
{
	if(is_it_by_class("XLMAIN"))
		sendevent {Click}
	clipboard =  
	sendevent ^c
	ClipWait 
	clipboard1 = %clipboard% 
	run https://baike.baidu.com/item/%clipboard1%
	return
}

;===================================>用google搜索选中文字
LAlt & MButton::
{
	if(is_it_by_class("XLMAIN"))
		sendevent {Click}
	clipboard =  
	sendevent ^c
	ClipWait 
	clipboard1 = %clipboard% 
	run https://www.google.com/search?q=%clipboard1%
	return
}


;====================================>调整窗口透明度
~LShift & WheelUp:: 
{
	; 透明度调整，增加。  
	WinGet, Transparent, Transparent,A  
	If (Transparent="")  
		Transparent=255  
		Transparent_New:=Transparent+20 ;透明度增加速度。  
		If (Transparent_New > 254)  
		Transparent_New =255  
		WinSet,Transparent,%Transparent_New%,A  	   
		tooltip now: %Transparent_New%`name: __%Transparent%  ;查看当前透明度（操作之后的）。  
		SetTimer, RemoveToolTip_transparent_Lwin__2016.09.20, 1500  ;设置统一的这个格式，label在最后。  
	return  
}
~LShift & WheelDown::
{
	WinGet, Transparent, Transparent,A  
		If (Transparent="")  
			Transparent=255  
			Transparent_New:=Transparent-10  ;透明度减少速度。  
					If (Transparent_New < 30)    ;最小透明度限制。  
							Transparent_New = 30  
			WinSet,Transparent,%Transparent_New%,A  
			tooltip now: %Transparent_New%`nmae: __%Transparent%  ;查看当前透明度（操作之后的）。   
			SetTimer, RemoveToolTip_transparent_Lwin__2016.09.20, 1500  ;设置统一的这个格式，label在最后。  
	return  
}
~LShift & MButton:: 
{
	WinGet, Transparent, Transparent,A  
	WinSet,Transparent,255,A   
	tooltip Restored ;查看当前透明度（操作之后的）。  
	SetTimer, RemoveToolTip_transparent_Lwin__2016.09.20, 1500  ;设置统一的这个格式，label在最后。  
	return  
	removetooltip_transparent_Lwin__2016.09.20:     ;LABEL  
	tooltip  
	SetTimer, RemoveToolTip_transparent_Lwin__2016.09.20, Off  
	return  
}

;====================================>电脑声音控制
CapsLock & WheelUp::
{
	SoundSet +5, MASTER
	SoundSet, +5, WAVE
	return
}
CapsLock & WheelDown::
{
	SoundSet -5, MASTER
	SoundSet, -5,WAVE
}

;====================================>鼠标滚轮控制标签
LAlt & Wheelup::
{
	SendEvent ^{PGUP}
	return
}
LAlt & WheelDown::
{
	SendEvent ^{PGDN}
	return
}
;~LCtrl & LButton::return

~LButton & t::return

;====================================>切换旺旺
~LButton & w::
{
	if(is_it_by_class("StandardFrame")){
		WinMinimize A
	}else{
		SendEvent ^!y
	}
	return
}

;====================================>关闭右侧标签
~LButton & g::
{
	if(is_it_by_class("MozillaWindowClass") | is_it_by_class("Chrome_WidgetWin_1") ){
		SendEvent ^{pgdn}
		sendevent ^w
		return
	}
}

;====================================>
~LButton & LAlt::
{
	if(is_it_by_class("MozillaWindowClass")){
		SendEvent ^{pgdn}
		sendevent ^w
		return
	}
}

;====================================>输入回车键
~LButton & Space::
{
	WinMinimize,A
	return
}

;====================================>关闭左侧标签
~LButton & CapsLock::
{
	if(is_it_by_class("MozillaWindowClass") | is_it_by_class("Chrome_WidgetWin_1") ){
		SendEvent ^{pgup}
		sendevent ^w
		return
	}
}

;====================================>恢复被关闭标签
~LButton & r::
{
	if(is_it_by_class("MozillaWindowClass")| is_it_by_class("Chrome_WidgetWin_1")){
		SendEvent ^+t
		return
	}	
}

;====================================>关闭标签
~LButton & q::
{
	is_vscode:=is_it_by_title("- Visual Studio Code")
	if(is_vscode){
		sendevent !q
	}else if(is_it_by_title("Mozilla Firefox") || is_it_by_title("- WPS 文字 - 兼容模式") || is_it_by_class("Chrome_WidgetWin_1")){
		SendEvent ^w
	}else{
		click up
		SendEvent !{f4}
	}
	return 
}

;====================================>上一标签
~LButton & a::
{
	if(is_it_by_class("MozillaWindowClass") || is_it_by_class("XLMAIN") |is_it_by_class("Chrome_WidgetWin_1")){
		click up
		SendEvent ^{PGUP}
		return
	}else if(is_it_by_class("SunAwtFrame")){
		click up
		SendEvent !y
		return
	}
}

;====================================>下一标签
~LButton & f::
{
	if(is_it_by_class("MozillaWindowClass") || is_it_by_class("XLMAIN") |is_it_by_class("Chrome_WidgetWin_1")){
		click up
		SendEvent ^{PGdn}
		return
	}else if(is_it_by_class("SunAwtFrame")){
		click up
		SendEvent !u
		return
	}	
}

;====================================>向前
~LButton & s::
{
	if(is_it_by_class("MozillaWindowClass")|is_it_by_class("Chrome_WidgetWin_1")){
		SendEvent !{left}
		return
	}
}

;====================================>向后
~LButton & d::
{
	if(is_it_by_class("MozillaWindowClass")|is_it_by_class("Chrome_WidgetWin_1")){
		SendEvent !{right}
		return
	}	
}

;====================================>黏贴
~LButton & v::
{
	sendevent ^v
	return
}

;====================================>复制
~LButton & c::
{
		SendEvent {home}
		Sendevent +{end}
		click Up
		sendevent ^c
		return
}

;====================================>切换qq
CapsLock & MButton::
CapsLock & space::
{
	WinTitle=ahk_class TXGuiFoundation
	WinGet, winid,ID,%WinTitle%
	if(winid){		
		WinGetTitle,this_title,ahk_id %winid%
		if(this_title =="QQ"){
			WinMinimize,%this_title%
		}else{
			IfWinActive,%this_title%
			{
				WinMinimize
			}else{
				SendEvent ^!z
			}
		}
	}else{
		run tencent://message/?uin=183195773
	}
	return
}

;====================================>添加回车
CapsLock & LButton::
{
	SendEvent {enter}
	return
}

;====================================>鼠标删除当前行
CapsLock & RButton::
{
	 Send {Home}   
	 Send +{End}  
	 SendEvent {del}
	 return
}
