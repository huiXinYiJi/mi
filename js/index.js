//计算元素离body的总高度
function getTotalTop(elem){
	var sum=0;
	do{
		sum+=elem.offsetTop;
		elem=elem.offsetParent;
	}while(elem);
	return sum;
}

(()=>{
    $.ajax({
        url:"data/index.php",
        type:"get",
        success:function(output){
            console.log(output);
            /**加载目录内容*/
            var cateHtml="";
            $.each(output.category,function(i,obj){
                cateHtml+=`<li>
							<a href="#" data-cateid="${obj.cat_id}">
								${obj.cat_name}
								<i class="iconfont"></i>
							</a>
							<div class="children">`;
							for(var b=0;b<obj.children.length;b++){
                                cateHtml+=`<ul>`;
                                $.each(obj.children[b],function(j,elem){
                                    cateHtml+=`<li>
                                        <a href="#" data-cateid="${elem.cat_id}">
                                            <img src="${elem.thumb}"/>
                                            <span>${elem.cat_name}</span>
                                        </a>
                                    </li>`;
                                });
                                cateHtml+=`</ul>`;
							}
                    cateHtml+=`</div>
						</li>`;
            });
            $("#site-cate").html(cateHtml);

            //目录鼠标进入移出事件
            $(".site-category>ul>li").mouseover(function(){
                var $li=$(this);
                $li.children(".children").show();
                $li.siblings().children(".children").hide();
            }).mouseout(function(){
                var $li=$(this);
                //$li.children(".children").hide();
            });

            /**小米明星单品*/
            //内容加载
            var starHtml="";
            $.each(output.star,function(i,obj){
                starHtml+=`<div>
					<a href="product_details.html?pid=${obj.pid}" target="_blank">
						<img src="${obj.thumb_img}">
					</a>
					<h3>
						<a href="product_details.html?pid=${obj.pid}" target="_blank">${obj.pname}</a>
					</h3>
					<p class="desc">${obj.short_desc}</p>
					<p class="price">${obj.price}元起</p>
				</div>`;
            });
            $("#star-products").html(starHtml);
            //小米明星单品 点击左右键图片滚动
            (()=>{
                var containWidth=1226;     //container的宽度
                var inDiv=0;
                $("#star-products").css("width",containWidth*2);
                var timer=null;
                timer=setInterval(function(){
                    if(inDiv==0){
                        $("#star-products").css("left",-1226);
                        inDiv+=5;
                        $("#pic-slide a[data-slide=right]").addClass("control-disabled");
                        $("#pic-slide a[data-slide=left]").removeClass("control-disabled");
                    }else if(inDiv>=5){
                        $("#star-products").css("left",0);
                        inDiv-=5;
                        $("#pic-slide a[data-slide=left]").addClass("control-disabled");
                        $("#pic-slide a[data-slide=right]").removeClass("control-disabled");
                    }
                },8000);
                $("#pic-slide").click(e=>{
                    e.preventDefault();
                    var $target=$(e.target);
                    if(!$target.hasClass("control-disabled")){
                        if($target.data("slide")=="left"){
                            $("#star-products").css("left",0);
                            $target.addClass("control-disabled");
                            $target.siblings().removeClass("control-disabled");
                        }else{
                            $("#star-products").css("left",-1226);
                            $target.addClass("control-disabled");
                            $target.siblings().removeClass("control-disabled");
                        }
                    }
                });
            })();

            /**家电*/
            //内容加载
            var jiadianHtml="";
            var jiadian=output.jiadian;
            var ad=jiadian.ad[0];
            jiadianHtml+=`<div class="product-left lf">
						<div class="box">
							<a href="product_details.html?pid=${ad.pid}"><img src="${ad.ad_img}"></a>
						</div>
					</div>`;
            jiadianHtml+=`<div class="product-right lf">`;
            $.each(jiadian,function(j,obj){
                if(j!='ad'){
                    jiadianHtml+=`<ul class=${j==0?'active':''}>`;
                    $.each(obj,function(t,ele){
                        if(t<obj.length-1){
                            jiadianHtml+=`<li>`;
                            jiadianHtml+=ele.is_new?`<p class="flag new-flag">新品</p>`:`<p></p>`;
                            jiadianHtml+=`<div class="product-img">
                                        <a href="product_details.html?pid=${ele.pid}">
                                            <img src="${ele.thumb_img}">
                                        </a>
                                    </div>
                                    <h3><a href="product_details.html?pid=${obj.pid}">${ele.pname}</a></h3>
                                    <p class="desc">${ele.short_desc}</p>
                                    <p class="price">
                                        <span class="num">${ele.price}</span>元
                                    </p>
                                    <div class="review-wrapper">
                                        <a href="#">
                                            <span class="review">${ele.content}</span>
                                            <span class="author"> 来自于 ${ele.uname} 的评价 </span>
                                        </a>
                                    </div>
                                </li>`;
                        }
                        if(t==obj.length-1){
                            jiadianHtml+=`<li>
								<div class="product-img">
									<a href="product_details.html?pid=${ele.pid}">
										<img src="${ele.thumb_img}">
									</a>
								</div>
								<h3><a href="product_details.html?pid=${ele.pid}">${ele.pname}</a></h3>
								<p class="price">
									<span class="num">${ele.price}</span>元
								</p>
							</li>`;
                        }
                    });
                    jiadianHtml+=`<li>
								<div class="view-icon">
									<a href="#">
										<i class="iconfont"></i>
									</a>
								</div>
								<h3>浏览更多</h3>
								<p class="small">热门</p>
							</li>`;
                    jiadianHtml+=`</ul>`;
                }
            });
            jiadianHtml+=`</div>`;
            $("#jiadian").html(jiadianHtml);

            //智能、搭配、配件、周边
            function loadHtml(section,idName){
                var html="";
                var ad=section.ad;
                html+=`<div class="product-left lf">
						<div class="box-up">
							<a href="product_details.html?pid=${ad[0].pid}"><img src="${ad[0].ad_img}"></a>
						</div>
						<div class="box-down">
							<a href="product_details.html?pid=${ad[1].pid}"><img src="${ad[1].ad_img}"></a>
						</div>
					</div>`;
                html+=`<div class="product-right lf">`;
                $.each(section,function(j,obj){
                    if(j!='ad'){
                        html+=`<ul class=${j==0?'active':''}>`;
                        $.each(obj,function(t,ele){
                            if(t<obj.length-1){
                                html+=`<li>`;
                                html+=ele.is_new?`<p class="flag new-flag">新品</p>`:`<p></p>`;
                                html+=`<div class="product-img">
                                        <a href="product_details.html?pid=${ele.pid}">
                                            <img src="${ele.thumb_img}">
                                        </a>
                                    </div>
                                    <h3><a href="product_details.html?pid=${ele.pid}">${ele.pname}</a></h3>
                                    <p class="desc">${ele.short_desc}</p>
                                    <p class="price">
                                        <span class="num">${ele.price}</span>元
                                    </p>
                                    <div class="review-wrapper">
                                        <a href="#">
                                            <span class="review">${ele.content}</span>
                                            <span class="author"> 来自于 ${ele.uname} 的评价 </span>
                                        </a>
                                    </div>
                                </li>`;
                            }
                            if(t==obj.length-1){
                                html+=`<li>
								<div class="product-img">
									<a href="product_details.html?pid=${ele.pid}">
										<img src="${ele.thumb_img}">
									</a>
								</div>
								<h3><a href="product_details.html?pid=${ele.pid}">${ele.pname}</a></h3>
								<p class="price">
									<span class="num">${ele.price}</span>元
								</p>
							</li>`;
                            }
                        });
                        html+=`<li>
								<div class="view-icon">
									<a href="#">
										<i class="iconfont"></i>
									</a>
								</div>
								<h3>浏览更多</h3>
								<p class="small">热门</p>
							</li>`;
                        html+=`</ul>`;
                    }
                });
                html+=`</div>`;
                $(idName).html(html);
            }
            loadHtml(output.zhineng,"#zhineng");
            loadHtml(output.dapei,"#dapei");
            loadHtml(output.peijian,"#peijian");
            loadHtml(output.zhoubian,"#zhoubian");

            //为你推荐
            //内容加载
            var recommend=output.recommend;
            var recomHtml="";
            $.each(recommend,function(i,obj){
                recomHtml+=`<li>
								<div class="product-img">
									<a href="product_details.html?pid=${obj.pid}">
										<img src="${obj.thumb_img}">
									</a>
								</div>
								<h3><a href="product_details.html?pid=${obj.pid}">${obj.pname}</a></h3>
								<p class="price">
									<span class="num">${obj.price}</span>元
								</p>
								<p class="rank">${obj.commentCount}人评价</p>
							</li>`;
            });
            $("#recommend-row").html(recomHtml);
            //点击产品slide效果
            var containWidth=1226;     //container的宽度
            var inDiv=0,timer=null,circle=5;
            var liNum=$(".recommend .product-right ul>li").length;  //15
            $(".recommend .product-right").css("width",containWidth*2);
            timer=setInterval(function(){
                if(inDiv==0){
                    $(".recommend .product-right").css("left",-1226);
                    inDiv+=5;
                    $(".slide-ck a[data-slide=right]").addClass("control-disabled");
                    $(".slide-ck a[data-slide=left]").removeClass("control-disabled");
                }else if(inDiv>=5){
                    $(".recommend .product-right").css("left",0);
                    inDiv-=5;
                    $(".slide-ck a[data-slide=left]").addClass("control-disabled");
                    $(".slide-ck a[data-slide=right]").removeClass("control-disabled");
                }
            },20000);
            $(".slide-ck").click(e=>{
                e.preventDefault();
                var $target=$(e.target);
                if(!$target.hasClass("control-disabled")){
                    if($target.data("slide")=="left"){
                        $(".recommend .product-right").css("left",0);
                        $target.addClass("control-disabled");
                        $target.siblings().removeClass("control-disabled");
                    }else{
                        $(".recommend .product-right").css("left",-1226);
                        $target.addClass("control-disabled");
                        $target.siblings().removeClass("control-disabled");
                    }
                }
            });

            //热评产品
            var hot=output.hot_view;
            var hotHtml="";
            $.each(hot,function(i,obj){
                hotHtml+=`<li>
								<div class="product-img">
									<a href="product_details.html?pid=${obj.pid}">
										<img src="${obj.thumb_img}">
									</a>
								</div>
								<p class="review">${obj.content}</p>
								<p class="author">来自于 ${obj.uname} 的评价</p>
								<div class="hot-title clear">
									<h3><a href="#">${obj.pname}</a></h3>
									<span>|</span>
									<p class="price">
										<span class="num">${obj.price}</span>元
									</p>
								</div>
							</li>`;
            });
            $("#hot-row").html(hotHtml);

            //进出产品单元格评论弹出特效
            $(".product-list .product-right ul li").hover(
                function(){
                    $(this).children(".review-wrapper").css("height",90);
                },
                function(){
                    $(this).children(".review-wrapper").css("height",0);
                }
            );

            /******楼层滚动*******/
            var floor=document.querySelector("#floor");
            //获得第一层楼距离body顶部的高度
            var totalTop1=getTotalTop(document.querySelector(".homeelec"));
            //获得最后一楼的下一元素距离body顶部的高度；到达这一元素，楼梯消失
            var totalTop2=getTotalTop(document.querySelector("#content"));

            var as=document.querySelectorAll("#floor>ul>li>a");

            window.addEventListener("scroll",()=>{
                //页面滚动的高度
                var scrollTop=document.body.scrollTop||document.documentElement.scrollTop;
                floor.style.right=((totalTop1<=scrollTop+innerHeight/2)
                && (totalTop2>scrollTop+innerHeight/2)
                )?"5px":"-90px";

                //根据滚动高度来判断楼层亮灯
                for(var j=0;j<as.length;j++){
                    var div=document.querySelector("div[class][id=f"+(j+1)+"]");
                    var ftotalTop=getTotalTop(div);
                    var fheight=div.offsetHeight;  //当前元素的自身高度
                    var start=ftotalTop-innerHeight/2;
                    var end=start+fheight;
                    if(scrollTop>=start&&scrollTop<end){break;}  //进入某一楼层
                }
                var li=$("#floor>ul>li:eq("+j+")");
                li.addClass("active").removeClass("floor-list").siblings().removeClass("active").addClass("floor-list");
            });
            //点击链接跳转到对应楼层
            for(let i=0;i<as.length;i++){
                as[i].onclick=e=>{
                    e.preventDefault();
                    var fi=document.getElementById("f"+(i+1));
                    var scrollHeight=getTotalTop(fi);
                    //window.scrollTo(0,scrollHeight);
                    $("html,body").stop(true).animate({
                        scrollTop:scrollHeight
                    },1000);
                }
            }
        }
    });

    /******轮播图*******/
    var imgWidth=1226;
    var imgNum=$("#wrap-banner>a>img").length;
    $("#wrap-banner").css("width",imgWidth*imgNum);
    var indexImg=0;

    var timer=null;
    function move(){
        timer=setInterval(function (){
            $("#wrap-banner").css("left", -imgWidth * indexImg);
            $("#btn-span>span:eq("+indexImg+")").addClass("active")
                .siblings("span").removeClass("active");
            indexImg++;
            if(indexImg == imgNum){
                indexImg = 0;
            }
        },3000);
    }
    move();

    /******移动到小圆点切换到对应图片,离开小圆点，切换到对应图片的下一张图片*******/
    $("#btn-span").on("mouseover","span",(e)=>{
            if(!$(e.target).hasClass("active")){
                clearInterval(timer); timer=null;
                indexImg=$(e.target).index();
                $("#wrap-banner").css("left", -imgWidth * indexImg);
                $("#btn-span>span:eq("+indexImg+")").addClass("active")
                    .siblings("span").removeClass("active");
            }
        }
    );

    /******点击左右箭头切换图片*******/
    $(".viewport>a.arrow-left").click(function(e){
        e.preventDefault();
        clearInterval(timer);timer=null;
        indexImg=$("#btn-span span.active").index();
        if(indexImg>0 && indexImg<imgNum){
            indexImg--;
            $("#wrap-banner").css("left", -imgWidth * indexImg);
            $("#btn-span>span:eq("+indexImg+")").addClass("active")
                .siblings("span").removeClass("active");
        }else if(indexImg==0){
            indexImg=imgNum-1;
            $("#wrap-banner").css("left", -imgWidth * indexImg);
            $("#btn-span>span:eq("+indexImg+")").addClass("active")
                .siblings("span").removeClass("active");
        }
    });

    $(".viewport>a.arrow-right").click(function(e){
        e.preventDefault();
        clearInterval(timer);timer=null;
        indexImg=$("#btn-span span.active").index();
        if(indexImg<imgNum-1){
            indexImg++;
            $("#wrap-banner").css("left", -imgWidth * indexImg);
            $("#btn-span>span:eq("+indexImg+")").addClass("active")
                .siblings("span").removeClass("active");
        }else if(indexImg==imgNum-1){
            indexImg=0;
            $("#wrap-banner").css("left", -imgWidth * indexImg);
            $("#btn-span>span:eq("+indexImg+")").addClass("active")
                .siblings("span").removeClass("active");
        }
    });

    /******进入轮播图范围，停止定时器，否则启动定时器*******/
    $("#wrap-banner").hover(
        ()=>{
            clearInterval(timer);
            timer=null;
        },
        ()=>move()
    );
})();

/**banner部分左侧目录 进入目录显示产品框*/
(()=>{

})();

(()=>{
    //内容区域 li的左右点击事件
    //进入li左右箭头显示
    $(".content .product-right>ul>li").hover(
        function(){
            $(this).find(".control>a").css("opacity",1);
        },
        function(){
            $(this).find(".control>a").css("opacity",0);
    });

    //左右箭头
    $(".control").hover(
        e=>{
            $(e.target).css("backgroundColor","#8D8D8D");
        },
        e=>{
           $(e.target).css("backgroundColor","#D9D9D9");
        }
    );

    //小圆点进入离开时背景颜色变化
    $(".slide-dot>a").mouseover(e=>{
        var $this=$(e.target);
        if(!$this.hasClass("slide-active")){
            $this.children("span").addClass("dot");
            $this.siblings("a:not(.slide-active)").children("span").removeClass("dot");
        }
    }).mouseleave(e=>{
        var $this=$(e.target);
        if(!$this.hasClass("slide-active")){
            $this.children("span").removeClass("dot");
        }
    });


    /**
     * 点击左右箭头li跟随变化
     */
    var liWidth=296;    //轮播的每个li的宽度
    $(".control").on("click","a",e=>{
        e.preventDefault();
        var $this=$(e.target);
        var liNum=$this.parents("li").find(".content-slide>li").length;  //轮播的li个数  //3
        var contentSlide=$this.parents("li").find(".content-slide");
        contentSlide.css("width",liWidth*liNum);
        var slideDot=contentSlide.parent().siblings(".slide-dot");
        var slideActive=slideDot.find("a.slide-active");
        //通过小圆点的下标来判断ul的margin-left应该移动多少
        let index=slideDot.children(".slide-active").index();
        if($this.hasClass("control-right")){
            if(index<liNum-1){
                contentSlide.css("margin-left",-liWidth*(index+1));
                slideDot.children("a:eq("+(index+1)+")")
                    .addClass("slide-active").siblings().removeClass("slide-active");
                index++;
            }else if(index>=liNum){
                contentSlide.css("margin-left",-liWidth*(liNum-1));
            }

        }else{
            if(index>0){
                contentSlide.css("margin-left",-liWidth*(index-1));
                slideDot.children("a:eq("+(index-1)+")")
                    .addClass("slide-active").siblings().removeClass("slide-active");
                index--;
            }else if(index<=0){
                contentSlide.css("margin-left",0);
            }
        }
    });

    //点击小圆点li跟随变化
    $(".slide-dot>a").click(function(e){
        e.preventDefault();
        //e.stopPropagation();
        var $this=$(this);
        if(!$this.hasClass("slide-active")){
            $this.addClass("slide-active").children("span").removeClass("dot");
            $this.siblings().removeClass("slide-active");
        }
        //通过小圆点的下标来判断ul的margin-left应该移动多少
        let idx=$this.index();
        var liNum=$this.parents("li").find(".content-slide>li").length;
        var contentSlide=$this.parents("li").find("ul.content-slide");
        contentSlide.css({"margin-left":-liWidth*idx,"width":liNum*liWidth});
    });
})();


(()=>{
    //各模块主产品部分显示
    $(".product-title>ul").on("mouseenter","li>a",function(e){
        e.preventDefault();
        var $this=$(this);
        $this.parent().addClass("active").siblings().removeClass("active");
        var idx=$this.parent().index();
        var ulDisplay=$this.parents("div.product-title").siblings(".product-list").find(".product-right>ul:eq("+idx+")");
        ulDisplay.show().siblings().hide();
    });
})();




(()=>{
    /**视频功能  自定义播放/暂停功能
     *
     *
     */
     $(".video .row-display li a").click(function(e){
         e.preventDefault();
         $(".play-video").show();
     });

    $(".video-head .close").click(function(e){
        e.preventDefault();
        $(".play-video").hide();
    });
    var videoBody=$(".video-body"),
        video=$("#video"),
        playIcon=$(".video-body .play-icon");

    //鼠标移入移出自定义控件的显示功能
    //var timer=null;
    //$(".video-body").hover(
    //    ()=>{
    //        timer=null;
    //        if(!video[0].paused){
    //            $('.interface').removeClass("interface-hide");
    //        }
    //    },
    //    ()=>{
    //        timer=setTimeout(function(){
    //            $('.interface').addClass("interface-hide");
    //        },3000);
    //    }
    //);

    //点击视频区域播放或暂停
    $('.media').click(function(e){
        e.preventDefault();
        $('.interface').removeClass("interface-hide");
        if(video[0].paused){
            video[0].play();
            playIcon[0].style.display="none";
            $(".btn-play").css('display','none').siblings().css('display','block');
        }else{
            video[0].pause();
            playIcon[0].style.display="block";
            $(".btn-pause").css('display','none').siblings().css('display','block');
        }
    });

    //点击自定义控件中播放/暂停按钮启动播放/暂停功能
    $('.btn-controls').click(function(e){
        var $this=$(e.target);
        if(video[0].paused){
            video[0].play();
            playIcon[0].style.display="none";
            $this.css('display','none').siblings().css('display','block');
        }else{
            video[0].pause();
            playIcon[0].style.display="block";
            $this.css('display','none').siblings().css('display','block');
        }
    });

    //获取视频总时长
    video.on('loadedmetadata',function(){
        var duration=video[0].duration;
        var h=String(parseInt(duration/3600));
        var m=parseInt((duration-h*3600)/60);
        var s=parseInt(duration-h*3600-m*60);
        s=s<10?("0"+s):s;
        $('.video-body .duration').text(h+m+":"+s);
    });

    //静音控制
    $(".volume-controls a.control").click(function(e){
        e.preventDefault();
        video[0].muted= !video[0].muted;
        if(!video[0].muted){
            $(e.target).removeClass("small");
        }else{
            $(e.target).addClass("small");
        }
        return false;
    });

    //进度条
    video.on("timeupdate",function(){
        //当前时间点
        var currentPos=video[0].currentTime;
        //最大时长
        var maxDuration=video[0].duration;
        var percentage=100*currentPos/maxDuration;
        $(".timeBar").css('width',percentage+'%');
        //var per=percentage>98?100:percentage;
        $(".progress-point").css("left",percentage+'%');

        var h=String(parseInt(currentPos/3600));
        var m=String(parseInt((currentPos-h*3600)/60));
        var s=parseInt(currentPos-h*3600-m*60);
        s=s<10?("0"+s):s;
        $('.video-body .current').text(h+m+":"+s);
    });


    //点击进度条
    var timeDrag=false;
    $('progressBar').mousedown(function(e){
        timeDrag=true;
        updateBar(e.pageX);
    });

    //鼠标从进度条上抬起
    $(document).mouseup(function(e){
        if(timeDrag){
            timeDrag=false;
            updateBar(e.pageX);
        }
    });

    //鼠标在进度条上移动
    $(document).mousemove(function(e){
        if(timeDrag){
            updateBar(e.pageX);
        }
    });

    //更新进度条
    function updateBar(x){
        var progressBar=$('.progressBar'),
            maxDuration=video[0].duration,
            position=x-progressBar.offset().left;
        var percentage=100*position/progressBar.width();

        if(percentage>100){
            percentage=100;
        }
        if(percentage<0){
            percentage=0;
        }
        $('.timeBar').css("width",percentage+'%');
        video[0].currentTime=maxDuration*percentage/100;
    };

    $('progressBar').click(function(e){
        console.log(e.offsetX);
        var position=e.offsetX;
        var percentage=100*position/$(this).width();
        console.log(position,percentage);
    });
    ////音量控制条
    //$('.video-body .volume-bar').on("mousedown",function(e){
    //    var position=e.pageX-volume.offset().left;
    //    var percentage=100*position/volume.width();
    //    $('.volume').css('width', percentage+'%');
    //    video[0].volume=percentage/100;
    //});



    //全屏播放
    $('.full-screen').on("click",function(){
        //for webkit
        video[0].webkitEnterFullscreen();

        //for firefox
        video[0].mozRequestFullScreen();

        return false;
    });


})();















