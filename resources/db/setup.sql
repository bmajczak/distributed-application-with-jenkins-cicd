-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS users;

-- Switch to the users database
USE users;

-- Create the user table if it does not exist
CREATE TABLE IF NOT EXISTS `user` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) DEFAULT NULL,
    `lastName` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
);

-- Insert some sample data into the user table
INSERT INTO `user` (`name`, `lastName`) VALUES 
    ('Jan', 'Kowalski'),
    ('Adam', 'Nowak');

-- Create a new user
CREATE USER 'app'@'%' IDENTIFIED BY 'app123';

-- Grant SELECT privileges on the user table to the new user
GRANT SELECT ON users.user TO 'app'@'%';
