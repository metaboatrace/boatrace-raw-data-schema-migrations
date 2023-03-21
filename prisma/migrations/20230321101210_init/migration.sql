-- CreateTable
CREATE TABLE `boat_betting_contribute_rate_aggregations` (
    `stadium_tel_code` INTEGER NOT NULL,
    `boat_number` INTEGER NOT NULL,
    `aggregated_on` DATE NOT NULL,
    `quinella_rate` FLOAT NOT NULL,
    `trio_rate` FLOAT,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`stadium_tel_code`, `boat_number`, `aggregated_on`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `boat_settings` (
    `stadium_tel_code` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `race_number` INTEGER NOT NULL,
    `pit_number` INTEGER NOT NULL,
    `boat_number` INTEGER NOT NULL,
    `motor_number` INTEGER NOT NULL,
    `tilt` FLOAT NOT NULL,
    `propeller_renewed` BOOLEAN NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    UNIQUE INDEX `uniq_index_1`(`stadium_tel_code`, `date`, `race_number`, `boat_number`),
    UNIQUE INDEX `uniq_index_2`(`stadium_tel_code`, `date`, `race_number`, `motor_number`),
    PRIMARY KEY (`stadium_tel_code`, `date`, `race_number`, `pit_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `circumference_exhibition_records` (
    `stadium_tel_code` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `race_number` INTEGER NOT NULL,
    `pit_number` INTEGER NOT NULL,
    `exhibition_time` FLOAT NOT NULL,
    `exhibition_time_order` INTEGER NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`stadium_tel_code`, `date`, `race_number`, `pit_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `disqualified_race_entries` (
    `stadium_tel_code` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `race_number` INTEGER NOT NULL,
    `pit_number` INTEGER NOT NULL,
    `disqualification` ENUM('capsize', 'fall', 'sinking', 'violation', 'disqualification_after_start', 'engine_stop', 'unfinished', 'repayment_other_than_flying_and_lateness', 'flying', 'lateness', 'absent') NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`stadium_tel_code`, `date`, `race_number`, `pit_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `events` (
    `stadium_tel_code` INTEGER NOT NULL,
    `starts_on` DATE NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `grade` ENUM('sg', 'g1', 'g2', 'g3', 'no_grade') NOT NULL,
    `kind` ENUM('uncategorized', 'all_ladies', 'venus', 'rookie', 'senior', 'double_winner', 'tournament') NOT NULL,
    `canceled` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`stadium_tel_code`, `starts_on`, `title`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `motor_betting_contribute_rate_aggregations` (
    `stadium_tel_code` INTEGER NOT NULL,
    `motor_number` INTEGER NOT NULL,
    `aggregated_on` DATE NOT NULL,
    `quinella_rate` FLOAT NOT NULL,
    `trio_rate` FLOAT,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`stadium_tel_code`, `motor_number`, `aggregated_on`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `motor_maintenances` (
    `stadium_tel_code` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `race_number` INTEGER NOT NULL,
    `motor_number` INTEGER NOT NULL,
    `exchanged_parts` ENUM('electrical_system', 'carburetor', 'piston', 'piston_ring', 'cylinder', 'crankshaft', 'gear_case', 'carrier_body') NOT NULL,
    `quantity` INTEGER NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`stadium_tel_code`, `date`, `race_number`, `motor_number`, `exchanged_parts`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `motor_renewals` (
    `stadium_tel_code` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`stadium_tel_code`, `date`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `odds` (
    `stadium_tel_code` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `race_number` INTEGER NOT NULL,
    `betting_method` ENUM('trifecta') NOT NULL,
    `betting_number` INTEGER NOT NULL,
    `ratio` FLOAT NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`stadium_tel_code`, `date`, `race_number`, `betting_method`, `betting_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payoffs` (
    `stadium_tel_code` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `race_number` INTEGER NOT NULL,
    `betting_method` ENUM('trifecta') NOT NULL,
    `betting_number` INTEGER NOT NULL,
    `amount` INTEGER NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`stadium_tel_code`, `date`, `race_number`, `betting_method`, `betting_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `race_entries` (
    `stadium_tel_code` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `race_number` INTEGER NOT NULL,
    `racer_registration_number` INTEGER NOT NULL,
    `pit_number` INTEGER NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    UNIQUE INDEX `uniq_index_1`(`stadium_tel_code`, `date`, `race_number`, `racer_registration_number`),
    PRIMARY KEY (`stadium_tel_code`, `date`, `race_number`, `pit_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `race_records` (
    `stadium_tel_code` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `race_number` INTEGER NOT NULL,
    `pit_number` INTEGER NOT NULL,
    `course_number` INTEGER NOT NULL,
    `start_time` FLOAT,
    `start_order` INTEGER,
    `race_time` FLOAT,
    `arrival` INTEGER,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`stadium_tel_code`, `date`, `race_number`, `pit_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `racer_conditions` (
    `racer_registration_number` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `weight` FLOAT NOT NULL,
    `adjust` FLOAT NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`racer_registration_number`, `date`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `racer_winning_rate_aggregations` (
    `racer_registration_number` INTEGER NOT NULL,
    `aggregated_on` DATE NOT NULL,
    `rate_in_all_stadium` FLOAT NOT NULL,
    `rate_in_event_going_stadium` FLOAT NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`racer_registration_number`, `aggregated_on`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `racers` (
    `registration_number` INTEGER NOT NULL AUTO_INCREMENT,
    `last_name` VARCHAR(255) NOT NULL DEFAULT '',
    `first_name` VARCHAR(255) NOT NULL DEFAULT '',
    `gender` ENUM('male', 'female'),
    `term` INTEGER,
    `birth_date` DATE,
    `branch_id` INTEGER,
    `birth_prefecture_id` INTEGER,
    `height` INTEGER,
    `status` ENUM('active', 'retired'),
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`registration_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `races` (
    `stadium_tel_code` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `race_number` INTEGER NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `course_fixed` BOOLEAN NOT NULL DEFAULT false,
    `use_stabilizer` BOOLEAN NOT NULL DEFAULT false,
    `number_of_laps` INTEGER NOT NULL DEFAULT 3,
    `betting_deadline_at` DATETIME(0) NOT NULL,
    `canceled` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `index_races_on_betting_deadline_at`(`betting_deadline_at`),
    PRIMARY KEY (`stadium_tel_code`, `date`, `race_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `stadiums` (
    `tel_code` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `prefecture_id` INTEGER NOT NULL,
    `water_quality` ENUM('fresh', 'brackish', 'sea') NOT NULL,
    `tide_fluctuation` BOOLEAN NOT NULL,
    `lat` FLOAT NOT NULL,
    `lng` FLOAT NOT NULL,
    `elevation` FLOAT NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`tel_code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `start_exhibition_records` (
    `stadium_tel_code` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `race_number` INTEGER NOT NULL,
    `pit_number` INTEGER NOT NULL,
    `course_number` INTEGER NOT NULL,
    `start_time` FLOAT NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`stadium_tel_code`, `date`, `race_number`, `pit_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `weather_conditions` (
    `stadium_tel_code` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `race_number` INTEGER NOT NULL,
    `in_performance` BOOLEAN NOT NULL,
    `weather` ENUM('fine', 'cloudy', 'rainy', 'snowy', 'typhoon', 'fog') NOT NULL,
    `wind_velocity` FLOAT NOT NULL,
    `wind_angle` FLOAT,
    `wavelength` FLOAT,
    `air_temperature` FLOAT NOT NULL,
    `water_temperature` FLOAT NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`stadium_tel_code`, `date`, `race_number`, `in_performance`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `winning_race_entries` (
    `stadium_tel_code` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `race_number` INTEGER NOT NULL,
    `pit_number` INTEGER NOT NULL,
    `winning_trick` ENUM('nige', 'sashi', 'makuri', 'makurizashi', 'nuki', 'megumare') NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`stadium_tel_code`, `date`, `race_number`, `pit_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `boat_betting_contribute_rate_aggregations` ADD CONSTRAINT `fk_rails_ec282bff7d` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `boat_settings` ADD CONSTRAINT `fk_rails_572d216c26` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `circumference_exhibition_records` ADD CONSTRAINT `fk_rails_2ec4c19df6` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `disqualified_race_entries` ADD CONSTRAINT `fk_rails_e7d94e7a46` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `events` ADD CONSTRAINT `fk_rails_592c94ca33` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `motor_betting_contribute_rate_aggregations` ADD CONSTRAINT `fk_rails_2058c962fe` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `motor_maintenances` ADD CONSTRAINT `fk_rails_5245f5f097` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `motor_renewals` ADD CONSTRAINT `fk_rails_482054f143` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `odds` ADD CONSTRAINT `fk_rails_32f672cf9a` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `payoffs` ADD CONSTRAINT `fk_rails_e5aa048390` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `race_entries` ADD CONSTRAINT `fk_rails_9545dd91ad` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `race_records` ADD CONSTRAINT `fk_rails_2a540c71c9` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `races` ADD CONSTRAINT `fk_rails_5e85267f3d` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `start_exhibition_records` ADD CONSTRAINT `fk_rails_7c18e9d9fb` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `weather_conditions` ADD CONSTRAINT `fk_rails_5914ca6208` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `winning_race_entries` ADD CONSTRAINT `fk_rails_9fbec16230` FOREIGN KEY (`stadium_tel_code`) REFERENCES `stadiums`(`tel_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;
