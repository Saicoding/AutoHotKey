#SingleInstance Force
#Persistent
#NoEnv
;引入iniRead模块
#Include ./include/iniRead.ahk
;引入全局变量模块
#Include ./include/global_variables.ahk
;引入图标
Menu , tray , icon ,%icon_path%
return
;引入共享方法
#Include ./include/share_functions.ahk
;引入"打开网址"模块
#Include ./include/open_caps.ahk
;引入"打开程序模块"
#Include ./include/open_ralt.ahk
;引入"常用"模块
#Include ./include/open_lalt.ahk
;引入"系统"模块
#Include ./include/open_ctrl_win.ahk
;引入"功能"模块
#Include ./include/open_win.ahk
;引入"鼠标"模块
#Include ./include/open_mouse.ahk
;引入"快捷用语"模块
#Include ./include/short_word.ahk
;引入ctrl按键模块
#Include ./include/open_ctrl.ahk
;引入gui模块
#Include ./include/GUI.ahk
