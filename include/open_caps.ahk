﻿;*************************************
;*****							 *****
;*****此模块是网址模块
;*****							 *****
;*****							 *****
;*************************************

;==================================>切换QQ
;>!q::    CapsLock & MButton::    CapsLock & space::

;==================================>切换旺旺
CapsLock & lalt::
{
	if(is_it_by_class("StandardFrame")){
		WinMinimize A
	}else{
		SendEvent ^!y
	}
	return
}

CapsLock & 1::RUN https://item.taobao.com/item.htm?id=561399537431
CapsLock & 2::RUN https://passport.baidu.com/v2/?login
;==================================>火狐快捷键
CapsLock & 3::RUN https://support.mozilla.org/zh-CN/kb/键盘快捷键
CapsLock & 4::RUN https://onedrive.live.com/
CapsLock & 5::Run https://ionicframework.com/docs/
CapsLock & 6::return
CapsLock & 7::return
CapsLock & 8::return
CapsLock & 9::return
CapsLock & a::return
CapsLock & b::Run https://www.baidu.com
CapsLock & c::exitapp
;==================================>向下开启分窗
CapsLock & d::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent !+d
	}else{
		Run https://www.douyu.com/directory
	}
	return
}
CapsLock & e::return
CapsLock & f::Run https://addons.mozilla.org/zh-CN/firefox/
CapsLock & g::Run https://www.google.com/
CapsLock & i::
{
	click
	return
}
CapsLock & k::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent !+k
	}else{
		Loop
		{
			GetKeyState, state, k,P
			if(state =="D"){
				MouseMove, 0, -10, 0, R ;
			}else{
				break
			}
		}
	}
	return
}
;==================================>上一个分窗
CapsLock & h::
	if(is_it_by_class("SunAwtFrame")){
		SendEvent !+h
	}else{
		Loop
		{
			GetKeyState, state, h,P
			if(state =="D"){
				MouseMove, -10, 0, 0, R ;
			}else{
				break
			}
		}
	}
	return
{
}
CapsLock & j::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent !+j
	}else{
		Loop
		{
			GetKeyState, state, j,P
			if(state =="D"){
				MouseMove, 0, 10, 0, R ;
			}else{
				break
			}
		}
	}
	return
}
;==================================>下一个分窗
CapsLock & l::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent !+l
	}else{
		Loop
		{
			GetKeyState, state, l,P
			if(state =="D"){
				MouseMove, 10, 0, 0, R ;
			}else{
				break
			}
		}
	}
	return
}

CapsLock & n::return
;==================================>改变分窗方式
CapsLock & o::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent !+o
	}else{
		RUN E:\OneDrive存储\OneDrive
	}
	return
}
CapsLock & p::return

CapsLock & q::Run https://mail.qq.com
;==================================>向右开启分窗
CapsLock & r::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent !+r
	}else{
	}
	return	
}
CapsLock & s::Run https://baike.baidu.com/usercenter/lemmas#auditing

;==================================>取消当前分窗
CapsLock & t::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent !+t
	}else{
		Run https://www.taobao.com/
	}
	return
}
;==================================>取消所有分窗
CapsLock & u::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent !+u
	}else{
		
	}
	return	
}
CapsLock & v::return
;==================================>wrap
CapsLock & w::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent !+w
	}else{
		
	}
	return		
}
CapsLock & x::return
CapsLock & y::Run https://www.youtube.com
CapsLock & z::Run https://www.zhihu.com/
CapsLock & [::return
CapsLock & ]::return
CapsLock & =::return
CapsLock & -::return