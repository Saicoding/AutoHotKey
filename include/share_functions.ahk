﻿;*************************************
;*****							 *****
;*****此模块是共享方法模块
;*****							 *****
;*****							 *****
;*************************************
SwitchIME(dwLayout){
    HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
    ControlGetFocus,ctl,A
    SendMessage,0x50,0,HKL,%ctl%,A
}

;=========================>根据class切换窗口
toogleApplication(a_class,path=""){
	WinTitle=ahk_class %a_class%
	WinGet, winid,ID,%WinTitle%
	if(winid){
		WinGetTitle,this_title,ahk_id %winid%
		IfWinActive,%this_title%
		{
			WinMinimize
		}else{
			WinActivate,%this_title%
		}
	}else{
		run %path%
	}
	return
}

;=========================>根据模糊title切换窗口
toogleDir(a_title,path=""){
	if(is_it_by_title(a_title)){
		WinMinimize,A
	}else{
		if(is_exist_by_title(a_title)){
			WinActivate
		}else{
			if(path){
				run %path%
			}
		}
	}
	return
}

;=========================>根据模糊title来判断当前窗口
is_it_by_title(in_title){
	SetTitleMatchMode, 2
	wingettitle,title,A
	{
		IfInString,title,%in_title%
		{
			return true
		}else{
			return false
		}
	}
	return
}

;=========================>根据ahk_class来判断当前窗口
is_it_by_class(in_class){
	WinGetClass, class, A
	if(in_class==class){
		return true
	}else{
		return false
	}
}

;=========================>根据模糊title来判断是否存在窗口
is_exist_by_title(in_title){
	SetTitleMatchMode, 2
	wingettitle,title,A
	IfwinExist,%in_title%
	{
		return true
	}else{
		return false
	}
}

