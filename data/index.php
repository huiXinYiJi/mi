<?php
/**
* 向首页提供必需的数据，包括小米明星单品、家电、智能、搭配、配件、周边、为你推荐、热评产品
* 返回数据形如：
  {
    star: [ ],
    jiadian: [ ],
    zhineng: [ ],
    dapei: [ ],
    peijian: [ ],
    zhoubian: [ ],
    recommend: [ ],
    hot_view: [ ]
  }
*/
require_once("./init.php");
$output=[];


$arr1=["jiadian","zhineng","dapei","peijian","zhoubian"];
$arr2=[
	["jiadian_1","jiadian_2","jiadian_3","jiadian_4"],
	["zhineng_1","zhineng_2","zhineng_3","zhineng_4","zhineng_5"],
	["dapei_1","dapei_2","dapei_3","dapei_4"],
	["peijian_1","peijian_2","peijian_3","peijian_4"],
	["zhoubian_1","zhoubian_2","zhoubian_3","zhoubian_4","zhoubian_5"]
];
for($i=0;$i<count($arr1);$i++){
	$ad=$arr1[$i];
	$sql="SELECT pid,ad_img FROM mi_index_product WHERE $ad>0";
	$result=mysqli_fetch_all(mysqli_query($conn,$sql),MYSQLI_ASSOC);
	$output[$ad]["ad"]=$result;
	//产品列表
	$keys=$arr2[$i];
	for($a=0;$a<count($keys);$a++){
		$key=$keys[$a];
		$sql="SELECT p.pid,p.pname,p.thumb_img,p.short_desc,i.price,c.content,c.oid,c.uid,u.uname,p.is_new FROM mi_index_product i,mi_comment c,mi_user u,mi_product p WHERE i.pid=p.pid AND i.pid=c.pid AND c.uid=u.uid AND i.$key>0 GROUP BY p.pid";
		$result=mysqli_fetch_all(mysqli_query($conn,$sql),MYSQLI_ASSOC);
		//评价人数
		for($s=0;$s<count($result);$s++){
			$pid=$result[$s]["pid"];
			$sql="SELECT count(uid) FROM mi_comment WHERE pid=$pid";
			$num=mysqli_fetch_row(mysqli_query($conn,$sql));
			$result[$s]["commentCount"]=$num[0];
		}
		$output[$ad][$a]=$result;
	}
};

//star
$sql="SELECT pid,pname,thumb_img,short_desc,price FROM mi_index_product WHERE star_product>0";
$result=mysqli_fetch_all(mysqli_query($conn,$sql),MYSQLI_ASSOC);
$output["star"]=$result;

//recommend
$sql="SELECT pid,pname,thumb_img,short_desc,price FROM mi_index_product WHERE recommend>0";
$result=mysqli_fetch_all(mysqli_query($conn,$sql),MYSQLI_ASSOC);
for($s=0;$s<count($result);$s++){
	//评价人数
	$pid=$result[$s]["pid"];
	$sql="SELECT count(uid) FROM mi_comment WHERE pid=$pid";
	$num=mysqli_fetch_row(mysqli_query($conn,$sql));
	$result[$s]["commentCount"]=$num[0];
}
$output["recommend"]=$result;

//hot_view
$sql="SELECT i.pid,i.pname,i.thumb_img,i.short_desc,i.price,u.uname,c.uid,c.content FROM mi_index_product i,mi_comment c,mi_user u WHERE hot_view>0 AND i.pid=c.pid AND c.uid=u.uid";
$result=mysqli_fetch_all(mysqli_query($conn,$sql),MYSQLI_ASSOC);
$output["hot_view"]=$result;


//左侧目录
$sql="SELECT cat_id,cat_name FROM mi_category WHERE cat_pid=0";
$rows=mysqli_query($conn,$sql);
$cat=mysqli_fetch_all($rows,MYSQLI_ASSOC);
for($i=0;$i<count($cat);$i++){
	$cat_pid=$cat[$i]["cat_id"];
	$sql="SELECT cat_id,cat_name,thumb FROM mi_category WHERE cat_pid=$cat_pid";
	$rows=mysqli_query($conn,$sql);
	$result=mysqli_fetch_all($rows,MYSQLI_ASSOC);
	//查询到的数据按每6个分组
	$arr=[];
	$num=ceil(count($result)/6);
	for($j=0;$j<$num;$j++){
		$arr1=array_slice($result,$j*6,6);
		array_push($arr,$arr1);
	}
	$cat[$i]["children"]=$arr;
}
$output["category"]=$cat;

echo json_encode($output);