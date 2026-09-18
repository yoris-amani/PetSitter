<?php
    namespace App\Models;
    use App\Core\Database;
    use PDO;

    class Annonces{
        private int $id_advertisement;
        private int $id_user;
        private string $titre;
        private string $type_animal;
        private ?string $ville;
        private string $date_debut;
        private string $date_fin;
        private string $descript;
        private string $statut;

        public function _construct(
            int $id_advertisement,
            int $id_user,
            string $titre,
            string $type_animal,
            ?string $ville,
            string $date_debut,
            string $date_fin,
            string $descript,
            string $statut
        ) {
            $this->id_advertisement = $id_advertisement;
            $this->id_user = $id_user;
            $this->titre = $titre;
            $this->type_animal = $type_animal;
            $this->ville = $ville;
            $this->date_debut = $date_debut;
            $this->date_fin = $date_fin;
            $this->descript = $descript;
            $this->statut = $statut;
        }

        public function getIdAdvertisement() : int {
            return $this -> id_advertisement;
        }

        public function getIdUser() : int {
            return $this -> id_user;
        }

        public function getTitre() : string {
            return $this -> titre;
        }

        public function getTypeAnimal() : string {
            return $this -> type_animal;
        }

        public function getVille() : ?string {
            return $this -> ville;
        }

        public function getDateDebut() : string {
            return $this -> date_debut;
        }

        public function getDateFin() : string {
            return $this -> date_fin;
        }

        public function getDescript() : string {
            return $this -> descript;
        }

        public function getStatut() : string {
            return $this -> statut;
        }

        public function getAnnoncesDispo(?string $ville = null, ?string $type_animal = null) : array {
            $sql = "SELECT * WHERE FROM Annonces statut ='Ouverte'";
            $params = [];

            if (!($ville = null)) {
                $sql .= " AND ville = $ville";
            }
            if (!($string = null)) {
                $sql .= " AND type_animal = $type_animal";
            }

            $sql .= " ORDER BY date_debut ASC";

            return [];
        }
    }
?>