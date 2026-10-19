<?php

if(in_array($_SERVER['SERVER_NAME'],['your_domain','localhost'])){
	define('DBNAME','Remax');
	define('DBHOST','localhost');
	define('DBUSER','root');
	define('DBPASS','1220');
	define('DBDRIVER','mysqli');

	define('ROOT','http://localhost/Remax/public');
}else{
	define('DBNAME','Remax');
	define('DBHOST','148.72.2.97');
	define('DBUSER','l2am9uh7gxg5');
	define('DBPASS','Culodeostra.1#');
	define('DBDRIVER','mysqli');
	
define('ROOT','https://www.edgesborders.com/Remax/public');
}

define ("APP_NAME","Remaxito");
define("DEBUG",true);
