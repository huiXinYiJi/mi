<?php
/**
    加载header中导航目录下拉框内容$nav
    {
		nav_name: "小米手机",
		top_nav_id: "1",
		plist: [{....},{...}]
	},
	{}
*/
require_once('./init.php');

$sql="SELECT t.nav_name,t.top_nav_id FROM mi_top_nav t";
$nav=mysqli_fetch_all(mysqli_query($conn, $sql),MYSQLI_ASSOC);
for($i=0;$i<count($nav);$i++){
	$top_nav_id=$nav[$i]["top_nav_id"];
	$sql="SELECT p.pid,p.thumb_img,p.pname,p.is_on_sale,p.is_new,p.is_free_shipping,MIN(a.special_price) price ";
	$sql.="FROM mi_top_nav t,mi_product p,mi_attr a ";
	$sql.="WHERE p.top_nav_id=$top_nav_id AND p.pid=a.pid ";
	$sql.="GROUP BY p.pid";
	$result = mysqli_query($conn, $sql);
	$output=mysqli_fetch_all($result,MYSQLI_ASSOC);
	$nav[$i]["plist"]=$output;
}
echo json_encode($nav);