DROP SCHEMA IF EXISTS ideePT CASCADE;
CREATE SCHEMA ideePT;
SET search_path TO ideePT;

create table role (
	id_role serial primary key,
	libelle varchar(20) not null
);

create table compte (
	id_compte serial primary key,
	pseudo varchar(20) not null unique,
	mail varchar(255) not null unique,
	mdp varchar(20) not null,
	id_role integer,
	constraint compte_id_role_fk foreign key (id_role) references role(id_role)
);

create table theme (
	id_theme serial primary key,
	nom varchar(20) not null
);

CREATE TABLE tag (
	id_tag serial primary key,
	libelle varchar(20) not null
);

create table idee (
	id_idee serial primary key,
	titre varchar(50) not null,
	description varchar(255) not null,
	createur integer,
	id_theme integer,
	constraint idee_createur_fk foreign key (createur) references compte(id_compte),
	constraint idee_id_theme_fk foreign key (id_theme) references theme(id_theme)
);

CREATE TABLE liste (
	id_liste serial primary key,
	libelle varchar(50) not null,
	id_compte integer,
	constraint liste_id_compte_fk foreign key (id_compte) references compte(id_compte)
);

CREATE TABLE signalement (
	id_compte integer,
	id_idee integer,
	motif varchar(255),
	date_signalement timestamp default current_timestamp,
	primary key (id_compte, id_idee),
	constraint signalement_id_compte_fk foreign key (id_compte) references compte(id_compte),
	constraint signalement_id_idee_fk foreign key (id_idee) references idee(id_idee)
);

CREATE TABLE favori (
	id_compte integer,
	id_idee integer,
	primary key (id_compte, id_idee),
	constraint favori_id_compte_fk foreign key (id_compte) references compte(id_compte),
	constraint favori_id_idee_fk foreign key (id_idee) references idee(id_idee)
);

CREATE TABLE contenu (
	id_liste int,
	id_idee int,
	primary key (id_liste, id_idee),
	constraint contenu_id_liste_fk foreign key (id_liste) references liste(id_liste),
	constraint contenu_id_idee_fk foreign key (id_idee) references idee(id_idee)
);

CREATE TABLE etiquette (
	id_idee integer,
	id_tag integer,
	primary key (id_idee, id_tag),
	constraint etiquette_id_idee_fk foreign key (id_idee) references idee(id_idee),
	constraint etiquette_id_tag_fk foreign key (id_tag) references tag(id_tag)
);

CREATE TABLE caracteristique (
 	id_tag integer,
	id_theme integer,
	primary key (id_tag, id_theme),
	constraint caracteristique_id_tag_fk foreign key (id_tag) references tag(id_tag),
	constraint caracteristique_id_theme_fk foreign key (id_theme) references theme(id_theme)
);


