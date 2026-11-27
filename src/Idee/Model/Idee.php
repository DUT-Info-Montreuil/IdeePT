<?php
class Idee
{

    public function __construct(
        private int $id,
        private string $titre,
        private string $description,
    ){}

    public function getId(){return $this->id;}
    public function getTitre(){return $this->titre;}
    public function getDescription(){return $this->description;}

    public static function ligne(array $ligne): Idee
    {
        return new self((int) $ligne['id_idee'], $ligne['titre'], $ligne['description']);
    }
}
