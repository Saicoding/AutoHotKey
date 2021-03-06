﻿;*************************************
;*****							 *****
;*****此模块是ctrl类按键
;*****							 *****
;*****							 *****
;*************************************


;=============================>自动下一行
;^Enter::
{
	if(is_it_by_class("Chrome_WidgetWin_1")){
		return
	}else if(is_it_by_class("SunAwtFrame")){
		return
	}else if(is_it_by_class("Vim")){
		SendEvent ^{Enter}
		return
	}else{
		SendEvent {enter}	
		SendEvent {end}	
	}
	return
}
;=============================>上一行
;+Enter::
{
	if(is_it_by_class("Chrome_WidgetWin_1")){
		return
	}else if(is_it_by_class("SunAwtFrame")){
		return
	}else if(is_it_by_class("Vim")){
		SendEvent +{Enter}
		return
	}else{
		SendEvent {home}
		SendEvent {enter}
		SendEvent {up}	
	}
	return
}

;=============================>保存并重载脚本
~^s::
{
	WinGetClass, class, A
	if(class == "SciTEWindow"){
		Reload
	}
	return
}

;=============================>重载脚本
~^r::
{
	Reload
	Menu , tray , icon , %icon_path%	
	return
}

;=============================>鼠标移动
^k::
{
	Loop
	{
		GetKeyState, state, k,P
		if(state =="D"){
			MouseMove, 0, -3, 0, R ;
		}else{
			break
		}
	}
	return
}
^h::
	Loop
	{
		GetKeyState, state, h,P
		if(state =="D"){
			MouseMove, -3, 0, 0, R ;
		}else{
			break
		}
	}
	return
{
}
^j::
{
	Loop
	{
		GetKeyState, state, j,P
		if(state =="D"){
			MouseMove, 0, 3, 0, R ;
		}else{
			break
		}
	}
	return
}
^l::
{
	Loop
	{
		GetKeyState, state, l,P
		if(state =="D"){
			MouseMove, 3, 0, 0, R ;
		}else{
			break
		}
	}
	return
}