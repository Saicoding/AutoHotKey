;=================================>中文输入法(00000804)英文输入法(c)

!6::
{
	if (ONOFF1 := ! ONOFF1 )
	{
		Loop, read, E:\OneDrive存储\OneDrive\图书ID\图书ID.txt
		{
			if(A_index==book_modify_id){
				book_modify_num=%A_LoopReadLine%	
				IniWrite, %book_modify_num%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section14,book_modify_num
				break
			}
		}
		run,http://www.crup.com.cn/Item/%book_modify_num%.aspx
		SetTimer, keyPress2, 1000
	}else {
		IniWrite, %book_modify_num%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section14,book_modify_num
		IniWrite, %book_modify_id%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section15,book_modify_id
		SetTimer, KeyPress2, Off 
	}
	return
}

KeyPress2:
{
	WinGetTitle,title,A
	FoundPos1 := RegExMatch(title, "-中国人民大学出版社 - Google Chrome")
	FoundPos2 := RegExMatch(title, "(Ionic App)|(百度百科)")
	FoundPos3 := RegExMatch(title, "www.crup.com.cn|https://baike.baidu.com")
	FoundPos4 := RegExMatch(title, "无标题 - Google Chrome")
	FoundPost5 :=RegExMatch(title, "分社 - Google Chrome|分社-中国人民大学出版社")
	FoundPost6 :=RegExMatch(title, "www.crup.com.cn/Item")
	FileAppend,2222 %title%`r`n,E:\OneDrive存储\OneDrive\AutoHotkey\baike.txt
	if((FoundPost5>0||FoundPos1>0)){
		findtitle=%title%
		sleep 1500
		clipboard=
		sendevent ^a
		sendevent ^c
		ClipWait,3000	
		zgrm_content=%clipboard%
		Newtitle1 :=
		zhangjie_content:=
		zuozhe :=
		if(FoundPost5>0){
			Newtitle1 :=RegExReplace(zgrm_content, "m)^(\s+|\s+$)") 		
			Newtitle1 :=RegExReplace(Newtitle1, "s).*\n([^\n]*\n)(作　　者：|作者：).*","$1") 
			Newtitle1 :=RegExReplace(Newtitle1, "金融 \| 会计 \| 工商管理") 
			Newtitle1 :=RegExReplace(Newtitle1, "工商管理分社 > 图书推荐") 
			Newtitle1 :=RegExReplace(Newtitle1, "m)^\s+|\s+$") 
		}else{
			Newtitle1 := RegExReplace(title, "-中国人民大学出版社 - Google Chrome") 
		}
		Newtitle1 :=RegExReplace(Newtitle1, "s)(.*)（.*（.*）.*）$.*","$1") 
		Newtitle1 :=RegExReplace(Newtitle1, "s)(.*（.*）)(.*（.*）)+.*","$1") 
		Newtitle1 :=RegExReplace(Newtitle1, "s)(.*)（.*[^）]$","$1") 
		Newtitle1 :=RegExReplace(Newtitle1, "s)(.*)（\S{5,80}）","$1") 
		Newtitle1 :=RegExReplace(Newtitle1, "s)(.*)（\S{5,60}\s*\S*）","$1") 
		Newtitle1 :=RegExReplace(Newtitle1, "s)(.*)\(\S{5,80}\)","$1") 
		Newtitle1 :=RegExReplace(Newtitle1, "s)(.*)(（|\().*[修订库配版卷册插编辑装稿刊论系磁带集导坛].*(）|\))","$1") 
		Newtitle1 :=RegExReplace(Newtitle1, "\.", "·") 
		Newtitle1 :=RegExReplace(Newtitle1, "\；", "·") 
		Newtitle1 :=RegExReplace(Newtitle1, "\;", "·") 
		sendevent ^w
		WinWaitClose,%title%, , 4	
		run,https://baike.baidu.com/item/%Newtitle1%
		;判断是否是未创建成功的
		Loop
		{
			wingettitle ,title,A
			pos1:=RegExMatch(title,"_百度百科 - Google Chrome")
			pos2:=RegExMatch(title,"(百度百科——全球最大中文百科全书 - Google Chrome)|(百度百科_全球最大中文百科全书 - Google Chrome)")
			if(pos1){
				break
			}
			if(pos2){
				book_modify_id++
				sleep 2000
				Loop, read, E:\OneDrive存储\OneDrive\图书ID\图书ID.txt
				{
					if(A_index==book_modify_id){
						book_modify_num=%A_LoopReadLine%	
						sendevent ^w
						WinWaitClose,%title%, , 4	
						IniWrite, %book_modify_num%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section14,book_modify_num
						IniWrite, %book_modify_id%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section15,book_modify_id
						run,http://www.crup.com.cn/Item/%book_modify_num%.aspx
						break
					}
				}
				return
			}
		}
		
		;作者简介部分
		zgrm_zuozhe_content:=RegExReplace(zgrm_content, "s).*作者简介(.*)章节目录.*","$1") 
		zgrm_zuozhe_content:=RegExReplace(zgrm_zuozhe_content, "s)(\S+\s+\S+\s+\S+\s+).*","$1") 
		zgrm_zuozhe_content:=RegExReplace(zgrm_zuozhe_content, "s)([^　　\s]+　　+[^　　\s]+　　+).*","$1") 
		zgrm_zuozhe_content:=RegExReplace(zgrm_zuozhe_content, "s)　　","`n") 
		zgrm_zuozhe_content:=RegExReplace(zgrm_zuozhe_content, "s)(http|https){0,1}(://){0,1}www\..*(com|cn|net)")
		zgrm_zuozhe_content:=RegExReplace(zgrm_zuozhe_content, "s)@\S\.(net|com|cn)")
		zgrm_zuozhe_content:=RegExReplace(zgrm_zuozhe_content, "m)^\s+|\s+$") 
		
		;章节部分
		zhangjie_content:=RegExReplace(zgrm_content, "s).*章节目录(.*)精彩片断.*","$1") 			
		zhangjie_content:=RegExReplace(zhangjie_content, "s)(第\d+[篇章节])","`n$1") 
		zhangjie_content:=RegExReplace(zhangjie_content, "s)( 　　)","`n$1") 
		zhangjie_content:=RegExReplace(zhangjie_content, "s)(   )","`n$1") 
		zhangjie_content:=RegExReplace(zhangjie_content, "s)(　　)","`n$1") 
		zhangjie_content:=RegExReplace(zhangjie_content, "s)(    )","`n$1") 
		zhangjie_content:=RegExReplace(zhangjie_content, "s)(\d{1,2}\.\d{1,2})","`n$1") 
		zhangjie_content:=RegExReplace(zhangjie_content, "s)(\d{1,2}\．\S)","`n$1") 
		zhangjie_content:=RegExReplace(zhangjie_content, "s)(（[一二三四五六七八九十]）)","`n$1") 
		zhangjie_content:=RegExReplace(zhangjie_content, "s)(第[一二三四五六七八九十]+[篇章节讲])","`n$1") 
		zhangjie_content:=RegExReplace(zhangjie_content, "s)([一二三四五六七八九十]+、)","`n$1") 
		zhangjie_content:=RegExReplace(zhangjie_content, "s)([ⅠⅡⅢⅣⅤⅥⅦⅧⅨ]+)","`n$1") 
		zhangjie_content:=RegExReplace(zhangjie_content, "s)(\d{1,2}．\d{1,2})","`n$1") 

		;zhangjie_content:=RegExReplace(zhangjie_content, "s)    ","`n") 
		;zhangjie_content:=RegExReplace(zhangjie_content, "s)  ","`n") 
		;zhangjie_content:=RegExReplace(zhangjie_content, "s)　","`n") 
		;zhangjie_content:=RegExReplace(zhangjie_content, "s)  ","`n") 
		;zhangjie_content:=RegExReplace(zhangjie_content, "s)  ","`n") 
		zhangjie_content:=RegExReplace(zhangjie_content, "s)"," ") 
		zhangjie_content:=RegExReplace(zhangjie_content, "s)"," ")
		zhangjie_content:=RegExReplace(zhangjie_content, "s)"," ")
		zhangjie_content:=RegExReplace(zhangjie_content, "s)(.*\S+)(\s+)","$1")
		zhangjie_content:=RegExReplace(zhangjie_content, "m)^\s+|\s+$") 
		;点击编辑词条
		loop
		{
			wingettitle,title,a
			pos:=RegExMatch(title,"_百度百科 - Google Chrome")
			pos1:=RegExMatch(title,"百度百科——全球最大中文百科全书 - Google Chrome")
			if(pos){
				;5415925
					PixelSearch,Px,Py,414,348, 1118,420,5415925,10,fast rgb
					if(ErrorLevel ==0){
						click %Px% ,%Py%
						break
					}
			}	
		}
		loop
		{
			PixelSearch,Px,Py,662,519,749,652,30416,10,fast rgb
			if(ErrorLevel ==0){
				break
			}
		}
		loop
		{
			sleep 200
			sendevent {pgdn}
			PixelSearch,Px,Py,1019,978,1115,993,3368652,10,fast rgb
			if(ErrorLevel ==0){
				break
			}
		}
		click 1297,640
		sendevent {enter}
		SwitchIME(0xF0020409) 
		if(zgrm_zuozhe_content){
			SendInput  作者简介
			sleep 200
			sendevent ^1
			sleep 200
			sendevent {Enter}
			sleep 200
			sendinput %zgrm_zuozhe_content%
			sendevent {Enter}
		}
		SendInput  章节目录
		sleep 200
		sendevent ^1
		sleep 200
		sendevent {Enter}
		Clipboard:=
		Clipboard =%zhangjie_content%
		sendevent ^v
		sleep 2000
		loop
		{
			sleep 1000
			sendevent {left}
			PixelSearch,Px,Py,462,169,506,175,3559541,10,fast rgb
			if(ErrorLevel ==0){
				sendevent {right}
				break
			}
		}
		SwitchIME(00000804) 
		;==================== 点击参考资料 ====================;
		click 484,155
		sleep 1500
		click 514,226
		;点击提交
		click 1767,169
		loop
		{
			PixelSearch,Px,Py,871,726,938,746,3371180,10,fast rgb
			if(ErrorLevel ==0){
				break
			}
		}
		;点击修改原因
		click 741,432
		click 878,432
		;点击修改原因提交
		click 900,737
		Loop
		{
			WinGetTitle,title,A
			pos:=RegExMatch(title,"百度百科——版本提交成功 - Google Chrome")
			if(pos){
				book_modify_id++
				sleep 2000
				Loop, read, E:\OneDrive存储\OneDrive\图书ID\图书ID.txt
				{
					if(A_index==book_modify_id){
						book_modify_num=%A_LoopReadLine%	
						sendevent ^w
						WinWaitClose,%title%, , 4	
						IniWrite, %book_modify_num%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section14,book_modify_num
						IniWrite, %book_modify_id%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section15,book_modify_id
						run,http://www.crup.com.cn/Item/%book_modify_num%.aspx
						return
					}
				}
			}
		}
	}
	return
}

!7::
{
	if (ONOFF := ! ONOFF )
	{
		run,http://www.crup.com.cn/Item/%book_zgrm_id%.aspx
		SetTimer, keyPress1, 1000
	}else {
		IniWrite, %book_zgrm_id%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section13,book_zgrm_id
	}
	return
}

keyPress1:
{
	WinGetTitle,title,A
	
	FoundPos1 := RegExMatch(title, "-中国人民大学出版社 - Google Chrome")
	FoundPos2 := RegExMatch(title, "(Ionic App)|(百度百科)")
	FoundPos3 := RegExMatch(title, "www.crup.com.cn|https://baike.baidu.com")
	FoundPos4 := RegExMatch(title, "无标题 - Google Chrome")
	FoundPost5 :=RegExMatch(title, "分社 - Google Chrome|分社-中国人民大学出版社")
	FoundPost6 :=RegExMatch(title, "www.crup.com.cn/Item")
	if(title=="错误提示信息 - Google Chrome"){
		book_zgrm_id+=2
		sendevent ^w
		WinWaitClose,%title%, , 4
		run,http://www.crup.com.cn/Item/%book_zgrm_id%.aspx
		IniWrite, %book_zgrm_id%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section13,book_zgrm_id
		return
	}
	if(title==findtitle1){
		time3++
		if(time3>2){
			time3=0
			book_zgrm_id+=2
			sendevent ^w
			WinWaitClose,%title%, , 4
			run,http://www.crup.com.cn/Item/%book_zgrm_id%.aspx
			IniWrite, %book_zgrm_id%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section13,book_zgrm_id
			return
		}
	}
	
	if(FoundPost6>0){
		time4++
		if(time4>3){
			time4=0
			book_zgrm_id+=2
			sendevent ^w
			WinWaitClose,%title%, , 4
			run,http://www.crup.com.cn/Item/%book_zgrm_id%.aspx
			IniWrite, %book_zgrm_id%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section13,book_zgrm_id
			return
		}
	}


	if((FoundPost5>0||FoundPos1>0)&&title!=findtitle1){
		time3=0
		time4=0
		sleep 1500
		clipboard=
		sendevent ^a
		sendevent ^c
		ClipWait,3000
		;变量初始化
		zgrm_content=%clipboard%
		Newtitle1 :=
		zuozhe :=
		zgrm_jiben_content:=
		zgrm_neirong_content:=
		zgrm_zuozhe_content:=
		zgrm_mulu_content:=
		
		if(FoundPost5>0){
			Newtitle1 :=RegExReplace(zgrm_content, "m)^(\s+|\s+$)") 	
			Newtitle1 :=RegExReplace(Newtitle1, "s).*\n([^\n]*)\n(作　　者：|作者：).*","$1") 
			Newtitle1 :=RegExReplace(Newtitle1, "金融 \| 会计 \| 工商管理") 
			Newtitle1 :=RegExReplace(Newtitle1, "工商管理分社 > 图书推荐") 
			Newtitle1 :=RegExReplace(Newtitle1, "m)^\s+|\s+$") 
		}else{
			findtitle1=%title%
			Newtitle1 := RegExReplace(title, "-中国人民大学出版社 - Google Chrome") 
		}
		
		foundpost7:=RegExMatch(Newtitle1, "\{")
		if(foundpost7){
			book_zgrm_id+=2
			sendevent ^w
			WinWaitClose,%title%, , 4
			run,http://www.crup.com.cn/Item/%book_zgrm_id%.aspx
			IniWrite, %book_zgrm_id%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section13,book_zgrm_id
			return
		}
		
		;标题处理 
		Newtitle1 :=RegExReplace(Newtitle1, "s)(.*)（.*（.*）.*）$.*","$1") 
		Newtitle1 :=RegExReplace(Newtitle1, "《|》","") 
		Newtitle1 :=RegExReplace(Newtitle1, "s)(.*（.*）)(.*（.*）)+.*","$1") 
		Newtitle1 :=RegExReplace(Newtitle1, "s)(.*)（.*[^）]$","$1") 
		Newtitle1 :=RegExReplace(Newtitle1, "s)(.*)（\S{5,60}\s*\S*）","$1") 
		Newtitle1 :=RegExReplace(Newtitle1, "s)(.*)\(\S{5,60}\)","$1") 
		Newtitle1 :=RegExReplace(Newtitle1, "s)(.*)(（|\().*[修订库配版卷册插编辑装稿刊论系磁带集导坛].*(）|\))","$1") 
		Newtitle1 :=RegExReplace(Newtitle1, "\.", "·") 
		Newtitle1 :=RegExReplace(Newtitle1, "\；", "·") 
		Newtitle1 :=RegExReplace(Newtitle1, "\;", "·") 
		
		if(Newtitle1==findname||Newtitle1==last_title){
			book_zgrm_id+=2
			sendevent ^w
			WinWaitClose,%title%, , 4
			run,http://www.crup.com.cn/Item/%book_zgrm_id%.aspx
			IniWrite, %book_zgrm_id%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section13,book_zgrm_id
			return
		}
		findname=%Newtitle1%
		IniWrite, %last_title%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section16,last_title
		;作者提取和格式处理
		zuozhe :=RegExReplace(zgrm_content, "s).*(作　　者|作者)：([^\n]+)\n.*","$2") 
		zuozhe :=RegExReplace(zuozhe, "s)(.*)ISBN.*","$1") 
		zuozhe :=RegExReplace(zuozhe, "m)^\s+|\s+$") 
		zuozhe :=RegExReplace(zuozhe, "s)编者", "") 
		zuozhe :=RegExReplace(zuozhe, "s)选编", "") 
		zuozhe :=RegExReplace(zuozhe, "s)绘者", "") 
		zuozhe :=RegExReplace(zuozhe, "s)主编", "") 
		zuozhe :=RegExReplace(zuozhe, "s)著者", "") 
		zuozhe :=RegExReplace(zuozhe, "s)编著", "") 
		zuozhe :=RegExReplace(zuozhe, "s)著", "") 	
		;基本信息部分
		zgrm_jiben_content:=RegExReplace(zgrm_content, "s).*(作　*者：.*)内容简介.*","$1") 
		;内容简介部分
		zgrm_neirong_content:=RegExReplace(zgrm_content, "s).*内容简介(.*)作者简介.*","$1") 
		;目录部分
		zgrm_mulu_content:=RegExReplace(zgrm_content, "s).*章节目录(.*)精彩片断.*","$1") 
		;基本信息格式处理
		zgrm_jiben_content:=RegExReplace(zgrm_jiben_content, "m)^\s+|\s+$") 
		zgrm_jiben_content:=RegExReplace(zgrm_jiben_content, "s)(.*)(ISBN：.*)","$1`n$2") 
		zgrm_jiben_content:=RegExReplace(zgrm_jiben_content, "s)(.*)(书\W*号：.*)","$1`n$2") 
		zgrm_jiben_content:=RegExReplace(zgrm_jiben_content, "s)(.*)(印\W*次：.*)","$1`n$2") 
		zgrm_jiben_content:=RegExReplace(zgrm_jiben_content, "s)(.*)(装\W*订：.*)","$1`n$2") 
		zgrm_jiben_content:=RegExReplace(zgrm_jiben_content, "s)(.*)(字\W*数：.*)","$1`n$2") 
		zgrm_jiben_content:=RegExReplace(zgrm_jiben_content, "s)(.*)(出版日期：.*)","$1`n$2") 
		zgrm_jiben_content:=RegExReplace(zgrm_jiben_content, "s)(.*)(出版时间.*)","$1`n$2")
		zgrm_jiben_content:=RegExReplace(zgrm_jiben_content, "s)(.*)(定\W*价：.*)","$1`n$2") 
		zgrm_jiben_content:=RegExReplace(zgrm_jiben_content, "s)(.*)(字\W*数：.*)","$1`n$2") 
		zgrm_jiben_content:=RegExReplace(zgrm_jiben_content, "s)(.*)(包\W*装：.*)","$1`n$2") 
		zgrm_jiben_content:=RegExReplace(zgrm_jiben_content, "s)(.*)(译\W*者：.*)","$1`n$2") 
		zgrm_jiben_content:=RegExReplace(zgrm_jiben_content, "s)(.*)(开\W*本：.*)","$1`n$2") 			
		zgrm_jiben_content:=RegExReplace(zgrm_jiben_content, "s)所属分类：.*查看评论摘要") 
		zgrm_jiben_content:=RegExReplace(zgrm_jiben_content, "s)教 学 资 源.*") 

		
		;内容简介部分格式处理
		zgrm_neirong_content:=RegExReplace(zgrm_neirong_content, "s)前    言")
		zgrm_neirong_content:=RegExReplace(zgrm_neirong_content, "s)前 言")
		zgrm_neirong_content:=RegExReplace(zgrm_neirong_content, "s)总    序")
		zgrm_neirong_content:=RegExReplace(zgrm_neirong_content, "s)导　言")
		zgrm_neirong_content:=RegExReplace(zgrm_neirong_content, "s)绪　论")
		zgrm_neirong_content:=RegExReplace(zgrm_neirong_content, "s)(http|https){0,1}(://){0,1}www\..*(com|cn|net)")
		zgrm_neirong_content:=RegExReplace(zgrm_neirong_content, "s)@\S+\.(net|com|cn)")
		zgrm_neirong_content:=RegExReplace(zgrm_neirong_content, "s)\d{7,}")
		zgrm_neirong_content:=RegExReplace(zgrm_neirong_content, "s)　　","`n") 
		zgrm_neirong_content:=RegExReplace(zgrm_neirong_content, "m)^\s+|\s+$") 

		if(zgrm_neirong_content==""){
			book_zgrm_id+=2
			sendevent ^w
			WinWaitClose,%title%, , 4
			run,http://www.crup.com.cn/Item/%book_zgrm_id%.aspx
			IniWrite, %book_zgrm_id%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section13,book_zgrm_id
			return
		}
		FileAppend,eee%zgrm_neirong_content%`r`n,E:\OneDrive存储\OneDrive\AutoHotkey\baike.txt
		SendEvent !d
		sleep 500
		Clipboard =
		SendEvent ^c
		ClipWait,3000
		http =%Clipboard%
		send ^w
		WinWaitClose,%title%, , 4

		run http://baike.baidu.com/create/%Newtitle1%
		
		Loop
		{
			SetTitleMatchMode,2
				WinGetTitle,title1,A
				FoundPos := RegExMatch(title1, "_创建词条_百度百科 - Google Chrome")
			if(title1=="baike.baidu.com/error.html - Google Chrome"||title1=="百度百科_全球最大中文百科全书 - Google Chrome"||title1 == "百度百科——全球最大中文百科全书 - Google Chrome"){
				send ^w
				WinWaitClose,%title1%, , 4
				book_zgrm_id+=2
				run,http://www.crup.com.cn/Item/%book_zgrm_id%.aspx
				return
			}
			if(FoundPos>0){
				break
			}
		}
		loop
		{
			PixelSearch,Px,Py,904,770, 991,802,3041957,10,fast rgb
			if(ErrorLevel ==0){
				break
			}
		}
		click 747,489
		sleep 100
		click 914,489
		sleep 100
		click 1114,437
		sleep 100
		click 946,784
		;判断概述部分是否出来了
		loop
		{
			sleep 200
			sendevent {pgup}
			PixelSearch,Px,Py,665,553,764,611,30416,10,fast rgb
			if(ErrorLevel ==0){
				break
			}
		}
		click 903,521
		SwitchIME(0xF0020409) 
		sleep 200
		SendInput  《%newtitle1%》是中国人民大学出版社出版书籍，作者是%zuozhe%。
		sleep 300
		SendEvent {PgDn}
		sleep 1000
		click 815,554
		sleep 1000
		
		;输入“图书信息”这4个字,并添加一级目录
		SendInput  基本信息
		sleep 200
		sendevent ^1
		sendevent {Enter}
		sleep 200
		;输入基本信息
		Clipboard:=
		Clipboard = %zgrm_jiben_content%
		Sendevent ^v
		sleep 200
		sendevent {Enter}
		;输入“内容简介”这4个字，并添加一级目录
		sleep 300
		SendInput  内容简介
		sleep 300
		sendevent ^1
		sendevent {Enter}
		sleep 1000
		;输入内容简介
		Clipboard:=
		Clipboard = %zgrm_neirong_content%
		Sendevent ^v
		sleep 200
		Sendevent {left}
		sleep 1000
		;==================== 点击参考资料 ====================;
		click 484,155
		;寻找绿色
		loop
		{
			PixelSearch,Px,Py,470,221,489,240,2727680,10,fast rgb
			if(ErrorLevel ==0){
				break
			}
		}
		click 532,227
		;寻找红色
		loop
		{
			PixelSearch,Px,Py,727,450,771,534,16646144,3,fast rgb
			if(ErrorLevel ==0){
				break
			}
		}
		
		;==================== 点击第一栏 ====================;
		sleep 300
		click 794,442
		sleep 300
		SendInput  《%Newtitle1%》
		sleep 400
		send {tab}
		sleep 200
		;==================== 点击第二栏 ====================;
		SendInput  %http%
		sleep 300
		;==================== 点击第三栏 ====================;
		send {tab}
		sleep 300
		SendInput  中国人民大学出版社
		SwitchIME(00000804) 
		sleep 300
		click 899,782
		sleep 1200
		click 1773,168
		sleep 3000
		loop
		{
			wingettitle,title,a
			pos:=RegExMatch(title,"百度百科——版本提交成功 - Google Chrome")
			if(pos){
					last_title=%Newtitle1%
					PixelSearch,Px,Py,928,321, 974,366,6934888,10,fast rgb
					if(ErrorLevel ==0){
						sendevent ^w
						if(strlen(zgrm_mulu_content)>20){
							FileAppend,%book_zgrm_id%`r`n,E:\OneDrive存储\OneDrive\图书ID\图书ID.txt
						}
						book_zgrm_id+=2
						IniWrite, %book_zgrm_id%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section13,book_zgrm_id
						run,http://www.crup.com.cn/Item/%book_zgrm_id%.aspx
						break
					}
			}	
		}
	}
	return
}

;==================== 查询百科===========================
^!h:: 
{
	if (ONOFF := ! ONOFF )
	{
		num--
		run,http://baike.baidu.com/edit/1/%num% 
		file :=FileOpen(filename,"a","UTF-8")
		file1 :=FileOpen("F:\Saicode\api\baike\baike\max_num.json","w","UTF-8")
		file2 :=FileOpen("F:\Saicode\api\baike\baike\max_id.json","w","UTF-8")
		file3 :=FileOpen("F:\Saicode\api\baike\baike\time.json","w","UTF-8")
		SetTimer, KeyPress, 300
	}else {
		file3.seek(0,0)
		file3.write("{""data"":[{""latest_c_time"":""" latest_c_time """},{""oldest_c_time"":""" oldest_c_time """},{""latest_m_time"":""" latest_m_time """},{""oldest_m_time"":""" oldest_m_time """},{""latest_u_time"":""" latest_u_time """},{""oldest_u_time"":""" oldest_u_time """}]}")
		file.close()
		file1.close()
		file2.close()
		file3.close()
		SetTimer, KeyPress, Off 
	}
	return
}
KeyPress:
{
		WinGetTitle,title,A
		FoundPos2 := RegExMatch(title, "(_编辑词条_百度百科|_编辑义项_百度百科)")
		time++
		StringReplace, title, title, &amp;,&, All	
		if(time>50){
			num++
			time=0
			sendevent ^w
			WinWaitClose,%title%, , 4
			run,http://baike.baidu.com/edit/1/%num% 
		}
		if(FoundPos2>0&&title!=findtitle){	
			findtitle=%title%
			time=0
			SendEvent,^w
			findnum=%num%
			Newtitle := RegExReplace(title, "(_编辑词条_百度百科 - Google Chrome|_编辑义项_百度百科 - Google Chrome)") 
			Newtitle := RegExReplace(Newtitle, "\s","`%20") 
			Newtitle := RegExReplace(Newtitle, "\?","`%3F") 
			Newtitle := RegExReplace(Newtitle, "\(","`%28") 
			Newtitle := RegExReplace(Newtitle, "\)","`%29") 
			Newtitle := RegExReplace(Newtitle, "\!","`%21") 
			Newtitle := RegExReplace(Newtitle, "\#","`%23") 
			Newtitle := RegExReplace(Newtitle, "\,","`%2C") 
			WinWaitClose,%title%, , 4
			run,https://baike.baidu.com/historylist/%Newtitle%/%findnum%	
			Loop
				{
					WinGetTitle,title2,A
					FoundPos := RegExMatch(title2, "\S+_历史版本_百度百科 - Google Chrome")	
					if(FoundPos>0)
					{
						clipboard =  
						loop
						{
							sendevent {esc}
							sendevent ^a
							sendevent ^c
							if(clipboard){
								break
							}
						}
						SendEvent,^w
						WinWaitClose,%title2%, , 4
						num++
						run,http://baike.baidu.com/edit/1/%num% 
						clipboard2 = %clipboard% 
						NewStr := RegExReplace(clipboard2, "m)^\S.*") 
						NewStr := RegExReplace(NewStr, "(\s|`n)+","#") 
						NewStr :=Trim(NewStr, "#")
						NewStr := RegExReplace(NewStr, "(\d{4}-\d{2}-\d{2})#(\d{2}:\d{2})#查看#(\S[^#]+)#","$1|$2|查看|$3|") 
						NewStr := RegExReplace(NewStr, "#(\d{4})","|$1") 
						infoarray := StrSplit(NewStr, "|") 
						index=0;
						len = % infoarray.length()
						times=% len/5
						Loop, % infoarray.length()
						{
							
							index++
							if(index==2){
								time1 :=infoarray[index-1]
								time2 :=infoarray[index]
								modify_user:=infoarray[index+2]
								modify_reson:=infoarray[index+3]
								modify_time=%time1% %time2%
							}

							if(index+3 == len){
								time3 :=infoarray[index-1]
								time4 :=infoarray[index]
								creat_user:=infoarray[index+2]
								creat_reson:=infoarray[index+3]
								creat_time=%time3% %time4%
							}
						}
						
						FormatTime, now_date, %A_Now%, yyyy-MM-dd HH:mm:ss
						id++
						
						file.seek(-2,2)
						if(all>0){
							file.write("`,`r`n{""id"":" id ",""title"":""" Newtitle """,""num"":" findnum ",""create_time"":""" creat_time """,""creat_user"":""" creat_user """,""creat_reson"":""" creat_reson """,""modify_time"":""" modify_time """,""modify_user"":""" modify_user """,""modify_reson"":""" modify_reson """,""now"":""" now_date """,""times"":" times "}]}")
						}
						if(all==0){
						file.write("`r`n{""id"":" id ",""title"":""" Newtitle """,""num"":" findnum ",""create_time"":""" creat_time """,""creat_user"":""" creat_user """,""creat_reson"":""" creat_reson """,""modify_time"":""" modify_time """,""modify_user"":""" modify_user """,""modify_reson"":""" modify_reson """,""now"":""" now_date """,""times"":" times "}]}")

						}
						all++	
						if(all>500){
							all=0
							file.close()
							pageNum++
							filename=F:\Saicode\api\baike\all\%pageNum%.json
							file :=FileOpen(filename,"a","UTF-8")
							file.write("{""data"":[]}")
						}
						IniWrite, %num%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section,num
						IniWrite, %id%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section1,id
						IniWrite, %all%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section2,all
						IniWrite, %pageNum%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section3,pageNum
						if(num >= maxNum){
							maxNum=%num%
							file1.seek(0,0)
							IniWrite, %maxNum%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section5,maxNum
							file1.write("{""data"":[{""maxNum"":" maxNum "}]}")
						}
						if(id>=maxId){
							maxId=%id%
							file2.seek(0,0)
							IniWrite, %maxId%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section4,maxId
							file2.write("{""data"":[{""maxId"":" maxId "}]}")
						}
						if(creat_time >=latest_c_time){
							latest_c_time=%creat_time%
							IniWrite, %latest_c_time%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section6,latest_c_time
						} 
						if(creat_time <= oldest_c_time){
							oldest_c_time=%creat_time%
							IniWrite, %oldest_c_time%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section7,oldest_c_time
						}
						if(modify_time >=latest_m_time){
							latest_m_time=%modify_time%
							IniWrite, %latest_m_time%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section8,latest_m_time
						} 
						if(modify_time <= oldest_m_time){
							oldest_m_time=%modify_time%
							IniWrite, %oldest_m_time%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section9,oldest_m_time
						}						
						if(now_date>=latest_u_time){
							latest_u_time=%now_date%
							IniWrite, %latest_u_time%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section10,latest_u_time
						} 
						if(now_date<= oldest_u_time){
							oldest_u_time=%now_date%
							IniWrite, %oldest_u_time%, E:\OneDrive存储\OneDrive\AutoHotkey\my.ini,section11,oldest_u_time
						}						
						file3.seek(0,0)
						file3.write("{""data"":[{""latest_c_time"":""" latest_c_time """},{""oldest_c_time"":""" oldest_c_time """},{""latest_m_time"":""" latest_m_time """},{""oldest_m_time"":""" oldest_m_time """},{""latest_u_time"":""" latest_u_time """},{""oldest_u_time"":""" oldest_u_time """}]}")
						
						break
					}
					if(FoundPos=0 && (title2 == "百度百科——全球最大中文百科全书 - Google Chrome" ||title2 == "百度百科_全球最大中文百科全书 - Google Chrome") ){
						num++
						SendEvent,^w
						WinWaitClose,%title2%, , 4
						run,http://baike.baidu.com/edit/1/%num% 
						break
					}
				}
		}else if(title == "百度百科——全球最大中文百科全书 - Google Chrome" ||title == "百度百科_全球最大中文百科全书 - Google Chrome"){
			num++
			SendEvent,^w
			WinWaitClose,%title%, , 4
			run,http://baike.baidu.com/edit/1/%num% 
		}
		return
}