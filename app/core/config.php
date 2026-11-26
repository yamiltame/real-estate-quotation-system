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
	define('DBHOST','your_web_host_IP');
	define('DBUSER','Your_db_user');
	define('DBPASS','Your_db_password');
	define('DBDRIVER','mysqli');
	
define('ROOT','https://www.yourdomain.com/Remax/public');
}

define ("APP_NAME","Remaxito");
define("DEBUG",true);
