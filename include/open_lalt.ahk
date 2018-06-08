;*************************************
;*****							 *****
;*****此模块是常用模块，比较重要的快捷键
;*****							 *****
;*****							 *****
;*************************************
;====================================>翻译选中的词
<!`::
{
	sendevent {LButton up}
	sendevent ^c
	if(is_it_by_title("Aboboo!英语社区")){
		WinMinimize,A
	}else{
		if(is_exist_by_title("Aboboo!英语社区")){
			WinActivate
			sleep 300
			SwitchIME(0xF0020409) 
			sendevent s
			sendevent {shift down}
			sendevent {left}
			sendevent {shift up}
			SendEvent ^v
			SwitchIME(00000804) 
			SendEvent {enter}
		}else{
			run,%abobo_path%
		}
	}
	return
}

;==================================>窗口最小化
<!space::
{
	WinMinimize,A
	return
}

;==================================>打开火狐浏览器
<!1::
{
	toogleApplication("Chrome_WidgetWin_1",chrome_path)
	return
}

;==================================>打开百度百科exel表格
<!2::
{
	toogleApplication("XLMAIN",baike_path)
	return
}

;==================================>切换wps-doc文档
<!3::
{
	if(is_it_by_class("SunAwtFrame") | is_it_by_class("SunAwtDialog") | is_it_by_class("Vim")){
		sendevent !3
		return
	}else{
		toogleApplication("OpusApp",excel_path)
	}
	return
}

;==================================>移动光标到结尾
<!4::
{
	send {end}
	return
}

<!5::
{
	toogleApplication("SunAwtFrame",pycharm_path)	
	return 
}

;==================================>切换编辑器
<!6::
{
	toogleApplication("SciTEWindow",SciTE4_path)
	return 
}

;==================================>打开AHK spy
<!7::
{
	run %AHK_Spy_path%
	return 	
}

;==================================>d盘 
<!8::
{
	if(is_it_by_title("- Visual Studio Code")){
		sendevent !8
		return
	}else{
		toogleDir("本地磁盘 (D:)","d:\")
	}
	return
}

;==================================>f盘
<!9::
{
	if(is_it_by_title("- Visual Studio Code") ){
		sendevent !9
		return
	}else{
		toogleDir("本地磁盘 (F:)","F:\")
	}
	return
}


;==================================>到结尾
<!0::
{
	send {home}
	return
}

;==================================>全选
;<!a::{}

;==================================>选中当前行文字
<!b::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent !b
	}else{
		Send {Home}   
		Send +{End}   
		if(is_it_by_title("- Visual Studio Code")){
			return
		}else{
			sendevent ^c
		}
	}

	return
}

;==================================>复制
<!d::
{
	if(is_it_by_title("- Visual Studio Code") ){
		sendevent !d
		return
	}else if(is_it_by_class("SunAwtFrame")){
		sendevent ^d
		return
	}else if(is_it_by_class("Vim")){
		sendevent !d
		return
	}else{
		SendEvent ^x
	}
	return
}

;==================================>c盘
<!c::
{
	if(is_it_by_title("- Visual Studio Code") || is_it_by_class("SunAwtFrame")){
		sendevent !c
		return
	}else{
		toogleDir("本地磁盘 (C:)","c:\")
	}
	return
}

;==================================>e盘
<!e::
{
	if(is_it_by_class("Chrome_WidgetWin_1")||is_it_by_class("SunAwtFrame")) {
		SendEvent !e
	}else{
		toogleDir("本地磁盘 (E:)","E:\")
	}	
	return
}

;==================================>剪切
<!f::
{
	if(is_it_by_title("- Visual Studio Code") || is_it_by_class("SunAwtFrame")||is_it_by_class("Vim")){
		sendevent !f
		return
	}else{
		SendEvent ^c
	}
	return
}


;==================================>黏贴
<!g::
{
	SendEvent ^v
	return
}

;==================================>光标移动
<!h::
{
	if(is_it_by_class("Vim")){
		SendEvent !h
	}else{
		
		SendEvent {left}
	}	
	return
}

;==================================>ionic
<!i::
{
	if(is_it_by_title("- Visual Studio Code")){
		sendevent !i
		return
	}else if(is_it_by_class("SunAwtFrame")){
		sendevent ^u
	}else if(is_it_by_class("Vim")){
		sendevent !i
	}else{
		toogleDir("F:\Ionic","F:\Ionic")
	}
	return
}

;==================================>向下
<!j::
{
	if(is_it_by_class("Vim") ){
		SendEvent !j
	}else{
		SendEvent {down}		
	}	
	return
}

;==================================>向上
<!k::
{
	if(is_it_by_class("Vim")){
		SendEvent !k
		FileAppend , ok , text.txt
	}else{
		SendEvent {up}
	}	
	return
}

;==================================>向右
<!l::
{
	if(is_it_by_class("Vim")){
		SendEvent !l
	}else{
		SendEvent {right}
	}	
	return
}

;==================================>vscode中光标在编辑台和terminal之间切换

<!m::
{
	if (ONOFF1 := ! ONOFF1 )
	{
		send !m
	}else{
		sendevent ^0
		sendevent !g
	}
	return
}

;==================================>回收站
<!n::
{
	if(is_it_by_title("- Visual Studio Code") ||is_it_by_class("SunAwtFrame") ){
		sendevent !n
		return
	}else{
		toogleDir("回收站","回收站")
	}
	return
}

;==================================>onedrive
<!o::
{
	if(is_it_by_title("- Visual Studio Code") |is_it_by_class("Vim") ){
		sendevent !o
		return
	}else{
		toogleDir("E:\OneDrive","E:\OneDrive")
	}
	return
}

;==================================>打开印象笔记
<!p::
{
	toogleApplication("ENMainFrame",note_path)
	return
}

;==================================>关闭文件或者窗口标签
<!q::
{
	is_vscode:=is_it_by_title("- Visual Studio Code")
	if(is_vscode){
		sendevent !q
	}else if(is_it_by_title("Mozilla Firefox") || is_it_by_title("- WPS 文字 - 兼容模式") ||  is_it_by_class("Chrome_WidgetWin_1")){
		SendEvent ^w
	}else{
		SendEvent !{f4}
	}
	return 
}

;==================================>切换fiddler
<!r::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent !r
	}else{
		toogleApplication("WindowsForms10.Window.8.app.0.2bf8098_r6_ad1",fiddler_path)
	}	
	return
}

;==================================>保存
<!s::
{
	if(is_it_by_class("Chrome_WidgetWin_1") ){
		sendevent !s
		return
	}else if(is_it_by_class("SunAwtFrame")){
		sendevent !s
		return
	}else{
		SendEvent ^s
		if(is_it_by_class("SciTEWindow")){
			Reload
		}
	}
	return
}

;==================================>打开我的电脑
<!t::
{
	if(is_it_by_title("- Visual Studio Code") ||is_it_by_class("SunAwtFrame")){
		sendevent !t
		return
	}else{
		if(is_it_by_title("此电脑")){
			WinMinimize,A
		}else{
			if(is_exist_by_title("此电脑")){
				WinActivate
			}else{
				sendevent #e
			}
		}
	}
	return
}

;==================================>打开vim
<!v::
{
	toogleApplication("Vim",vim_path)
	return
}

;百度百科
<!w::
{
	if(is_it_by_class("Chrome_WidgetWin_1")||is_it_by_class("SunAwtFrame") || is_it_by_class("Vim")){
		sendevent !w
		return
	}else{
		toogleDir("E:\OneDrive\百度百科\已接","E:\OneDrive\百度百科\已接")
	}
	return
}


;==================================>打开autohoykey
<!x::
{
	if(is_it_by_title("- Visual Studio Code") ){
		sendevent !x
		return
	}else{
		toogleDir("E:\OneDrive\AutoHotkey\include","E:\OneDrive\AutoHotkey\include")
	}
	return	
}

;==================================>上一标签
<!y::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent !y
	}else{
		SendEvent ^{PGUP}
	}	
	return
}

;==================================>下一标签
<!u::
{
	if(is_it_by_class("SunAwtFrame")){
		SendEvent !u
	}else{
		SendEvent ^{PGDN}
	}	
	return
}


;==================================>删除当前行
<!z::
{
	if(is_it_by_title("- Visual Studio Code")){
		SendEvent !z
		return
	}else{
		SendEvent {end}
		sendevent {shift down}
		sendevent {home}
		sendevent {shift up}
		sendevent {del}
	}
	return
}

;==================================>双击
<!;::
{
	sendevent {click 2}
	return		
}