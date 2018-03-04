(()=>{
	//目录随滚动条移动
	window.addEventListener("scroll",()=>{
	var scrollTop=document.body.scrollTop||document.documentElement.scrollTop;
	document.querySelector(".product-nav").className=
		scrollTop>=200?"product-nav clear fixed_nav":"product-nav clear";
	});

	//点击叉关闭登陆提示区域
	$("#login-clue [data-toggle=close]").click(
		e=>{
			e.preventDefault();
			$("#login-clue").hide(500);
		}
	);


})();