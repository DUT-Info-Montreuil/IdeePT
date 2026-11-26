<?php
class Csrf
{
    public static function jeton(){
        if (!isset($_SESSION["jeton"])){
            $_SESSION["jeton"] =  bin2hex(random_bytes(32));
        }
        return $_SESSION["jeton"];
    }

     public static function verifier($valeur): bool{
        if (!is_string($valeur) || !isset($_SESSION["jeton"])) {
            return false;
        }
        return hash_equals($_SESSION["jeton"], $valeur);
    }
}