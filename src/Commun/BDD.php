<?php
abstract class BDD
{
    protected static ?PDO $pdo = null;

    public function __construct()
    {
        if (self::$pdo === null) {
            $fichier = __DIR__ . '/../../data/.sql';
            if (!is_file($fichier)) {
                die('Base de données introuvable : ' . $fichier);
            }
            self::$pdo = new PDO('sqlite:' . $fichier);
            self::$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
    }
}
