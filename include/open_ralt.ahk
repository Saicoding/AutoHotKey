;*************************************
;*****							 *****
;*****此模块是打开软件或者文件模块
;*****							 *****
;*****							 *****
;*************************************
;==================================>窗口最小化
>!space::
{
	WinMinimize,A
	return
}


;==================================>toogle设置书签
>!1::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+1
	}else{
	}
	return
}
>!2::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+2
	}else{
	}
	return
}
>!3::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+3
	}else{
	}
	return
}
>!4::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+4
	}else{
	}	
	return
}
>!5::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+5
	}else{	
	}
	return
}
>!6::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+6
	}else{	
	}
	return
}
>!7::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+7
	}else{	
	}
	return
}
>!8::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+8
	}else{	
	}
	return
}
>!9::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+9
	}else{	
	}
	return
}
>!0::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+0
	}else{	
	}
	return
}
;==================================>显示书签
>!e::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+!e
	}else{	
	}
	return	
}
;==================================>切换到上一个书签
>!a::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+!a
	}else{	
		toogleApplication("MozillaWindowClass",firefox_path)
	}	
	return
}
;==================================>打开Firefox浏览器，切换到下一个书签(pycharm)
>!f::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+!f
	}else{	
		toogleApplication("MozillaWindowClass",firefox_path)
	}	
	return
}

;==================================>打开AutoHotKey帮助手册
>!k::
{
	toogleApplication("HH Parent",autoHotkey_chm_path)
	return
}
;==================================>打开书签,带记忆
>!q::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+!q
	}else{	
	}
	return	
}

;==================================>打开书签，不带记忆
>!w::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+!w
	}else{	
	}
	return
}

>!x::
{
	toogleApplication("WeChatMainWndForPC")
	return
}

;==================================>打开pythons workplace文件夹

>!n::
{
	if(is_it_by_title(".txt - 记事本")){
		winminimize,A
	}else{
		if(is_exist_by_title(".txt - 记事本")){
			WinActivate
		}else{
			run %note_textpath%
		}
	}
}


;==================================>打开vscode
>!v::
	SetTitleMatchMode, 2
	wingettitle,title,A
	{
		IfInString,title,- Visual Studio Code
		{
			WinMinimize,A
		}else{
			if(is_exist_by_title("- Visual Studio Code")){
				WinActivate
			}else{
				run %vscode_path%
			}
		}
	}
	return


