INSERT INTO role (id_role, libelle) VALUES
(1,'Administrateur'),
(2,'Utilisateur');

INSERT INTO compte (id_compte, pseudo, mail, mdp, id_role) VALUES
(1, 'admin',  'admin@ideept.fr', 'admin', 1);

INSERT INTO theme (id_theme, nom) VALUES
(1, 'Projet SAÉ'),
(2, 'Sortie'),
(3, 'Repas'),
(4, 'Activité'),
(5, 'Achat');

INSERT INTO tag (id_tag, libelle) VALUES
(1,  'Web'),
(2,  'Facile'),
(3,  'Difficile'),
(4,  'Budget faible'),
(5,  'Entre amis'),
(6,  'Rapide'),
(7,  'Végétarien'),
(8,  'Plein air'),
(9,  'Gratuit'),
(10, 'Créatif');

INSERT INTO caracteristique (id_tag, id_theme) VALUES
(1, 1), (2, 1), (3, 1), (4, 1),
(4, 2), (5, 2), (8, 2), (9, 2),
(2, 3), (4, 3), (6, 3), (7, 3),
(4, 4), (5, 4), (9, 4), (10, 4),
(4, 5), (6, 5), (9, 5);

INSERT INTO idee (id_idee, titre, description, createur, id_theme) VALUES
(1,  'Site de recettes collaboratif',
     'Un site web où les étudiants partagent des recettes économiques, avec notation et recherche par ingrédient.', 1, 1),
(2,  'Application de suivi de budget étudiant',
     'Une application qui catégorise les dépenses et affiche des graphiques mensuels.', 1, 1),
(3,  'Jeu de quiz en ligne',
     'Un quiz multijoueur avec classement en temps réel et plusieurs catégories de questions.', 1, 1),
(4,  'Escape game en ville',
     'Une enquête en équipe dans les rues du centre-ville, durée environ 2 heures.', 1, 2),
(5,  'Pique-nique au parc',
     'Chacun apporte un plat à partager, idéal pour une journée ensoleillée.', 1, 2),
(6,  'Bowling entre amis',
     'Une soirée bowling suivie d''un verre, parfaite pour un groupe de 4 à 8 personnes.', 1, 4),
(7,  'Pâtes au pesto maison',
     'Un repas prêt en 20 minutes avec basilic, ail, parmesan et pignons.', 1, 3),
(8,  'Curry de légumes',
     'Un curry végétarien au lait de coco, économique et facile à préparer pour plusieurs personnes.', 1, 3),
(9,  'Soirée jeux de société',
     'Une soirée à la maison avec des jeux de cartes et de plateau.', 1, 4),
(10, 'Atelier poterie',
     'Une initiation à la poterie pour découvrir une activité créative en petit groupe.', 1, 4);

INSERT INTO etiquette (id_idee, id_tag) VALUES
(1, 1), (1, 2), (1, 4),
(2, 1), (2, 3),
(3, 1), (3, 3),
(4, 5),
(5, 4), (5, 5), (5, 8), (5, 9),
(6, 5),
(7, 2), (7, 4), (7, 6),
(8, 2), (8, 4), (8, 7),
(9, 4), (9, 5), (9, 9),
(10, 5), (10, 10);
