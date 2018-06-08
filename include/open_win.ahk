;*************************************
;*****							 *****
;*****此模块是功能模块
;*****							 *****
;*****							 *****
;*************************************

;===================================>打开控制面板
#a::run,control

#b::return
#c::Run, find C:\
~#d::return
~#e::return

;===================================>窗口置顶
#f::
{
	winset,AlwaysOnTop,, A
	return
}

#g::return
#h::
{
  	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+{f10}
	}
    return
}
#i::return

;===================================>运行服务
#j::Run dcomcnfg
#k::return
#l::return
#m::return
#n::return
#o::return
#p::PAUSE

;===================================>打开指定QQ号窗口
#q::
{
	WinGetClass, class, A
	if(class =="XLMAIN"){
		clipboard = 
		sendevent {click}
		sendevent ^c
		ClipWait 
		run,tencent://message/?uin=%Clipboard%

		if WinExist("ahk_class TXGuiFoundation")
		WinActivate		
	}
	return
}

;===================================>运行系统注册表
#r::
{
  if(is_it_by_class("SunAwtFrame")){
      SendEvent ^+r
  }else{
      Run regedit.exe
  }
	return  
}

;===================================>查询目录和文件个数
#s::
{
	InputBox, text, 查询目录和文件个数, 请输入文件的路径，如“F:\rep\gitNote\vim”,, ,, , , , 10
	if ErrorLevel
		return
	else
		Run, %ComSpec% /k dir %text%
	return
}


;===================================>测试按键
#t::
{
 	if(is_it_by_class("SunAwtFrame")){
		SendEvent ^+t
	}
	return
}

; ===================================================================================
 ShowHotkey(Hotkey)
 {
 GuiControl,, HotkeyText, %Hotkey%
 
WinGetPos, ActWin_X, ActWin_Y, ActWin_W, ActWin_H, A
 text_w := ActWin_W, gui_y := (ActWin_Y+ActWin_H) - 115 - 50
 GuiControl, Move, HotkeyText, w%text_w% center
 
Gui, Show, NoActivate x%ActWin_X% y%gui_y% h115 w%text_w%
 }
 
 FadeOut(sleep = 1000)
 {
 global transN
 
Sleep, %Sleep%
 Gui, +LastFound
 
Loop, % transN
 WinSet, Transparent, % (A_Index - transN - 1) * -1
 
Gui, Hide
 WinSet, Transparent, % transN
 } 


~#u::return
#v::return 	

;===================================>打开指定旺旺ID窗口
#w::
{
	WinGetClass, class, A
	if(class =="XLMAIN"){
	clipboard = 
	sendevent {click} 
	sendevent ^c
	ClipWait 
	run,aliim:sendmsg?&touid=cntaobao%Clipboard%
	}
	return
}

#x::return
#y::return
#z::return
#space::
{
	SendInput ^+t
	return
}

;===================================>打开系统属性
#1::
{
	Run control sysdm.cpl   
	return   
}

#2::return
#3::return
#4::return
#5::return
#6::return
#7::return
#8::return
#9::return
#0::return
#[::return
#]::return
#=::return
#-::return
#'::return


