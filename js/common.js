(()=>{
	ajax("get","header.html","","text").then(
		html=>{
			document.getElementById("header").innerHTML=html;
			//加载头部导航目录中的产品列表
			$.ajax({
				type:"get",
				url:"data/header.php",
				success:function(output){
					var navhtml="";
					navhtml+=`<li class="nav-down nav-category">
							<a href="#">全部商品分类</a>
					</li>`;
					$.each(output,function(i,obj){
						navhtml+=`<li class="nav-down">
					<a href="#">${obj.nav_name}</a>
					<div class="header-bottom">
						<div class="container">
							<div class="down-list">
								<ul class="clear">`;
						for(var j=0;j<obj.plist.length;j++){
							navhtml+=`<li>
										<div class="list-in">
											${obj.plist[j].is_new?'<p class="flags">新品</p>':''}
											<a href="#"><img src=${obj.plist[j].thumb_img}></a>
											<p class="title"><a href="product_details?pid=${obj.plist[j].pid}">小米MIX2</a></p>
											<p class="price">
												<span>${obj.plist[j].price}</span>起
											</p>
										</div>
									</li>`;
						};
						navhtml+=`</ul>
							</div>
						</div>
					</div>
				</li>`;
					});
					navhtml+=`<li>
						<a href="#">新品</a>
					</li>
					<li>
						<a href="#">服务</a>
					</li>
					<li>
						<a href="#">社区</a>
					</li>`;
					$("#down-nav").html(navhtml);

					// 菜单下拉列表
					$(".header-nav>ul>li.nav-down").mouseover(function(){
						var $liNav=$(this);
						$liNav.children(".header-bottom").show();
						$liNav.siblings("li.nav-down").children(".header-bottom").hide();
					}).mouseout(function(){
						$(this).children(".header-bottom").hide();
					});
				}
			});
		}
	)
})();

(()=>{
	ajax("get","footer.html","","text").then(
		html=>document.getElementById("footer").innerHTML=html
	)
})();

