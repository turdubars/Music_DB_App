CREATE TABLE `Songs` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`file_id` int NOT NULL,
	`rating` int NOT NULL,
	`release_date` DATE NOT NULL,
	`duration` int NOT NULL,
	`written_by` varchar(1024) NOT NULL,
	`album_id` int NOT NULL,
	`lyrics_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Albums` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`rating` int NOT NULL,
	`release_date` DATE NOT NULL,
	`artist_id` int NOT NULL,
	`subgenre_id` int NOT NULL,
	`cover_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Artists` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`rating` int NOT NULL,
	`bio_id` int NOT NULL,
	`logo_id` int NOT NULL,
	`city_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Persons` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`artist_id` int NOT NULL,
	`image_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Person_Images` (
	`id` int NOT NULL AUTO_INCREMENT,
	`url` varchar(1024) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Album_Covers` (
	`id` int NOT NULL AUTO_INCREMENT,
	`url` varchar(1024) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Cities` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`country_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Countries` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`flag_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Flags` (
	`id` int NOT NULL AUTO_INCREMENT,
	`url` varchar(1024) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Logos` (
	`id` int NOT NULL AUTO_INCREMENT,
	`url` varchar(1024) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Artist_Bios` (
	`id` int NOT NULL AUTO_INCREMENT,
	`url` varchar(1024) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Lyrics` (
	`id` int NOT NULL AUTO_INCREMENT,
	`url` varchar(1024) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Subgenres` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`genre_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Genres` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Song_Files` (
	`id` int NOT NULL AUTO_INCREMENT,
	`url` varchar(1024) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Songs` ADD CONSTRAINT `Songs_fk0` FOREIGN KEY (`file_id`) REFERENCES `Song_Files`(`id`);

ALTER TABLE `Songs` ADD CONSTRAINT `Songs_fk1` FOREIGN KEY (`album_id`) REFERENCES `Albums`(`id`);

ALTER TABLE `Songs` ADD CONSTRAINT `Songs_fk2` FOREIGN KEY (`lyrics_id`) REFERENCES `Lyrics`(`id`);

ALTER TABLE `Albums` ADD CONSTRAINT `Albums_fk0` FOREIGN KEY (`artist_id`) REFERENCES `Artists`(`id`);

ALTER TABLE `Albums` ADD CONSTRAINT `Albums_fk1` FOREIGN KEY (`subgenre_id`) REFERENCES `Subgenres`(`id`);

ALTER TABLE `Albums` ADD CONSTRAINT `Albums_fk2` FOREIGN KEY (`cover_id`) REFERENCES `Album_Covers`(`id`);

ALTER TABLE `Artists` ADD CONSTRAINT `Artists_fk0` FOREIGN KEY (`bio_id`) REFERENCES `Artist_Bios`(`id`);

ALTER TABLE `Artists` ADD CONSTRAINT `Artists_fk1` FOREIGN KEY (`logo_id`) REFERENCES `Logos`(`id`);

ALTER TABLE `Artists` ADD CONSTRAINT `Artists_fk2` FOREIGN KEY (`city_id`) REFERENCES `Cities`(`id`);

ALTER TABLE `Persons` ADD CONSTRAINT `Persons_fk0` FOREIGN KEY (`artist_id`) REFERENCES `Artists`(`id`);

ALTER TABLE `Persons` ADD CONSTRAINT `Persons_fk1` FOREIGN KEY (`image_id`) REFERENCES `Person_Images`(`id`);

ALTER TABLE `Cities` ADD CONSTRAINT `Cities_fk0` FOREIGN KEY (`country_id`) REFERENCES `Countries`(`id`);

ALTER TABLE `Countries` ADD CONSTRAINT `Countries_fk0` FOREIGN KEY (`flag_id`) REFERENCES `Flags`(`id`);

ALTER TABLE `Subgenres` ADD CONSTRAINT `Subgenres_fk0` FOREIGN KEY (`genre_id`) REFERENCES `Genres`(`id`);
