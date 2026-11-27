<?php
require_once __DIR__ . '/../../Commun/BDD.php';
require_once __DIR__ . '/Idee.php';

class IdeeRepository extends BDD
{
    public function findByThemeAndTag(string $theme, array $tag)
    {
        if (empty($tag)){
        $requete = self::$pdo->prepare('SELECT idee.id_idee, titre, description From idee Join theme on idee.id_theme = theme.id_theme Where nom = :theme Order By random();');
        $requete->execute(['theme' => $theme]);
        } else{
        $placeholder = [];
        foreach ($tag as $i => $valeur){
            $placeholder[] = ':tag'.$i;
        }
        $list = implode(",",$placeholder) ;
        $requete = self::$pdo->prepare('SELECT idee.id_idee, titre, description From idee Join theme on idee.id_theme = theme.id_theme Join etiquette on idee.id_idee = etiquette.id_idee Where nom = :theme And id_tag in ('.$list.') Group by idee.id_idee Order By count(*) Desc, random();' );
        $param = ['theme' => $theme];
        foreach ($tag as $i => $valeur){
            $param['tag'.$i] = $valeur;
        }
        $requete->execute($param);
        }
        return $requete;
    }

    public function pacourirTheme( $requete){
        $ligne = $requete->fetch(PDO::FETCH_ASSOC);
        return $ligne === false ? null : Idee::ligne($ligne);
    }
}