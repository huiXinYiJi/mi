//让id为content下的第一个div置顶以及改第一个a链接颜色
var tabs=document.getElementById("tabs");
var content=document.getElementById("content");
content.firstElementChild.style.zIndex=10;
tabs.firstElementChild.style.color="#f56600";
tabs.onclick=e=>{
	var btna=e.target;
	var i=btna.href.lastIndexOf("#");
    var id=btna.href.slice(i);
	var targetDiv=document.querySelector(id);
	if(btna.nodeName=="A"){  //如果当前点击的是a链接
		if(targetDiv.style.zIndex==""){  //如果当前点击的zIndex为空
			for(var cont of content.children){cont.style.zIndex="";}
			for(var btn of tabs.children){btn.style.color="";}
			targetDiv.style.zIndex=10;
			btna.style.color="#f56600";
		}
	}
	e.preventDefault();  //阻止链接自动加锚点
}

