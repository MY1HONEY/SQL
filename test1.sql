CREATE TABLE `doctors` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `adress_id` int(11) DEFAULT NULL,
  `tel_number` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
);

CREATE TABLE `patient` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `adress_id` int(11) DEFAULT NULL,
  `tel_number` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `insurence_company` varchar(255) DEFAULT NULL
);

CREATE TABLE `adress` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `street` varchar(255) DEFAULT NULL,
  `street_number` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL
);

CREATE TABLE `medicament` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price_insurance` float(11) DEFAULT NULL,
  `price_patient` float(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL
);

CREATE TABLE `list_of_medicament` (
  `id_doctor` int(11) NOT NULL AUTO_INCREMENT,
  `id_patiente` int(11) NOT NULL AUTO_INCREMENT,
  `id_medicament` int(11) NOT NULL AUTO_INCREMENT,
  `valid_from` date(11) DEFAULT NULL,
  `valid_to` date(11) DEFAULT NULL,
  `is_released` varchar(11) DEFAULT NULL
);

ALTER TABLE `doctors` ADD FOREIGN KEY (`adress_id`) REFERENCES `adress` (`id`);

ALTER TABLE `list_of_medicament` ADD FOREIGN KEY (`id_doctor`) REFERENCES `doctors` (`id`);

ALTER TABLE `patient` ADD FOREIGN KEY (`id`) REFERENCES `list_of_medicament` (`id_patiente`);

ALTER TABLE `medicament` ADD FOREIGN KEY (`id`) REFERENCES `list_of_medicament` (`id_medicament`);
