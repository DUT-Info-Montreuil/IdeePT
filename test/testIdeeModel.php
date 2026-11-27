<?php
require_once __DIR__ . '/../src/Idee/Model/IdeeRepository.php';

$repository = new IdeeRepository;

$tag = [];


echo '<pre>';
for ($i=0; $i<5; $i++){
    var_dump($repository->pacourirTheme());
}
echo '</pre>';
