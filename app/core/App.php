<?php

class App{
    private $controller = 'Home';
    private $method= 'index';

    private function splitURL(){
        $URL=$_GET['url'] ?? 'home';
        $URL = explode("/",trim($URL,'/'));
        return $URL;
    }

    public function loadController(){
        $URL= $this->splitURL();
        //show($URL);
        $filename="../app/controllers/".ucfirst($URL[0]).".php";
        if(file_exists($filename)){
            require $filename;
            $this->controller=ucfirst($URL[0]);
            unset($URL[0]);
        } else{
            $filename = "../app/controllers/_404.php";
            require $filename;
            $this->controller='_404';
        }
        $controlador = new $this->controller;
        if(!empty($URL[1])){
            if(method_exists($controlador, $URL[1])){
                $this->method=$URL[1];
                unset($URL[1]);

            }

        }
        //show($this->controller);
        //show($this->method);
        call_user_func_array([$controlador,$this->method],[$URL]);
    }

}//CLASS END
