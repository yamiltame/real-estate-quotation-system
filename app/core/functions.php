<?php

function show($stuff){
    echo '<pre>';
    print_r($stuff);
    echo '</pre>';
}

function make_fecha($date){
    $f=explode("-",$date);
    $meses=['enero','febrero','marzo','abril','mayo','junio','julio','agosto','septiembre','octubre','noviembre','diciembre'];
    $fecha=$f[0].'/'.$meses[intval($f[1])-1].'/'.$f[2];
    return $fecha;
}

function money_fmt($value){
    $money=round($value);
    $yenom=strrev($money);
    $c=1;
    $coin='';
    for($i=0;$i<strlen($yenom);$i++){
        if($c%3==0){ $coin.=$yenom[$i].',';}
        else{ $coin.=$yenom[$i];}
        $c++;
    }
    $coin=ltrim(strrev($coin),',');
    //$coin=(isset($money[1])) ? '$'.$coin.'.'.$money[1] : '$'.$coin;
    return '$'.$coin;
}

function esc($str){
    return htmlspecialchars($str);
}

function redirect($path){
    header("Location: ".ROOT."/".$path);
    die;
}

function check_sesion(){
    if(empty($_SESSION['user'])){
        redirect('login');
    }
}

function check_dpto($dpto){
    if($_SESSION['user']['departamento']!=$dpto){
        redirect('home');
    }
}
