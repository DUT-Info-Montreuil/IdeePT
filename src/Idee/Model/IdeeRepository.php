<?php
require_once __DIR__ . '/../../Commun/BDD.php';
require_once __DIR__ . '/Idee.php';

class IdeeRepository extends BDD
{
    public function findByThemeAndTag(string $theme, array $tag)
    {
        if (empty($tag)){
        $requete = self::$pdo->prepare('SELECT id_idee, titre, description From idee Join theme on idee.id_theme = theme.id_theme Where nom = :theme;');
        $requete->execute(['theme' => $theme]);
        } else{
        $requete = self::$pdo->prepare('SELECT id_idee, titre, description From idee Join theme on idee.id_theme = theme.id_theme Join etiquette on idee.id_idee = etiquette.id_idee Where nom = :theme And id_tag in (:liste) Group by idee.id_idee Having count(*) = :tailleListe; ' );
        $list = implode(',',$tag);
        $requete->execute(['theme' => $theme, 'liste' => $liste, 'tailleListe' => count($tag)]);
        }
        return $requete;
    }

    public function pacourirTheme( $requete){
        $ligne = $requete->fetch(PDO::FETCH_ASSOC);
        return $ligne === false ? null : Idee::versIut($ligne);
    }
}