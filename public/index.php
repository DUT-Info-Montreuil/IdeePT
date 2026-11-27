<?php
require_once __DIR__ . '/../test/testIdeeModel.php';
session_start();

$module = isset($_GET['module']) ? $_GET['module'] : NULL;

if ($module=== NULL) {
    echo 'pas encore créer';
}
else {
    echo 'Module inconnue';
}

