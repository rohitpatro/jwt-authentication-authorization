DROP DATABASE IF EXISTS `my_app`;
CREATE DATABASE IF NOT EXISTS `my_app`;
USE `my_app`;

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence`
(
    `next_val` bigint(20) DEFAULT NULL
);


DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role`
(
    `id`   bigint(20) NOT NULL,
    `name` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
);


DELETE
FROM `role`;
INSERT INTO `role` (`id`, `name`)
VALUES (1, 'ROLE_USER'),
       (2, 'ROLE_MANAGER'),
       (3, 'ROLE_ADMIN'),
       (4, 'ROLE_SUPER_ADMIN');

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user`
(
    `id`       bigint(20) NOT NULL,
    `name`     varchar(255) DEFAULT NULL,
    `password` varchar(255) DEFAULT NULL,
    `username` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
);


DELETE
FROM `user`;
INSERT INTO `user` (`id`, `name`, `password`, `username`)
VALUES (5, 'Rohit', '$2a$10$u/tQH/AGIfszUSdJ27fQlOJtZ7PaA7B02x.LTUaxT4vK9BZB6EKe.', 'rohit'),
       (6, 'Champ', '$2a$10$0G3amBzpIepPAvLSilcbA.micD5kQ.gyPTKrJR40sE5Sh4TynClZC', 'champ'),
       (7, 'Anjali', '$2a$10$CubyFFU/W6xxQoM2Hu9w5eDnZ50Mg5aY1P0dbTCTdQjvu8aobqV/O', 'anjali'),
       (8, 'Kuku', '$2a$10$QnVkiShgmMsL4IYh8xhMmubdJLzZRJcnNVIdYFP9mImoOg7MQyqAi', 'kuku');


DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles`
(
    `user_id`  bigint(20) NOT NULL,
    `roles_id` bigint(20) NOT NULL,
    KEY `fk_user_roles_roles_id` (`roles_id`),
    KEY `fk_user_roles_user_id` (`user_id`),
    CONSTRAINT `fk_user_roles_roles_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
    CONSTRAINT `fk_user_roles_user_id` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`)
);

DELETE
FROM `user_roles`;
INSERT INTO `user_roles` (`user_id`, `roles_id`)
VALUES (5, 1),
       (5, 2),
       (7, 2),
       (7, 4),
       (6, 1),
       (8, 2);