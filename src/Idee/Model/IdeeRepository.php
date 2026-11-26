<?php
require_once __DIR__ . '/../../Commun/BDD.php';
require_once __DIR__ . '/Idee.php';

class IdeeRepository extends BDD
{
    public function findByTheme(string $theme)
    {
       $requete = self::$pdo->prepare('SELECT id_idee, titre, description From idee Join theme on idee.id_theme = theme.id_theme Where nom = :theme');
        $requete->execute(['theme' => $theme]);
        return $requete;
    }

    public function pacourirTheme( $requete){
        $ligne = $requete->fetch(PDO::FETCH_ASSOC);
        return $ligne === false ? null : Idee::versIut($ligne);
    }
}