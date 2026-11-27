<?php
require_once __DIR__ . '/../src/Idee/Model/IdeeRepository.php';

$repository = new IdeeRepository;

$tag = [2];
$sansTag = [];
$request = $repository->findByThemeAndTag( "Projet SAÉ", $tag);

echo '<pre>';
for ($i=0; $i<5; $i++){
    var_dump($repository->pacourirTheme($request));
}
echo '</pre>';
