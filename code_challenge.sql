/*
 Navicat Premium Data Transfer

 Source Server         : MY_SQL
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : localhost:3306
 Source Schema         : code_challenge

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 25/12/2022 17:25:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for google_oauth
-- ----------------------------
DROP TABLE IF EXISTS `google_oauth`;
CREATE TABLE `google_oauth`  (
  `id` int(11) NOT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `provider_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of google_oauth
-- ----------------------------
INSERT INTO `google_oauth` VALUES (0, 'google', '{\"access_token\":\"ya29.a0AX9GBdXAqJ-zaPj7HDoCsJFL8vwXiKbhsYDpCQs6Y2lt4OX1cpF7A4J_SnJlIE3NHBOqvzbkmoogWmYS_WipQkvibGZ8PqLcMktNFGjkfU1KkAXBoWNOA8F4a54iiW0ectjPCmo1UNdQjoVfo7gZaWX6Y6-OAS4aCgYKAXgSAQASFQHUCsbCASHTmejunrbqCShPGC6I7Q0166\",\"expires_in\":3599,\"scope\":\"https://mail.google.com/\",\"token_type\":\"Bearer\",\"refresh_token\":\"1//0g5CBPQ43JsIsCgYIARAAGBASNwF-L9IrnLzcDAsdcS31IWe4r3qPkrFuuRTekJ2rrEEHTwfQ6akD7SxZXt0imM6xRYKLvgjNWLY\"}');

-- ----------------------------
-- Table structure for sent_emails
-- ----------------------------
DROP TABLE IF EXISTS `sent_emails`;
CREATE TABLE `sent_emails`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sent_emails
-- ----------------------------
INSERT INTO `sent_emails` VALUES (1, NULL, 'Test', 'Body Email');
INSERT INTO `sent_emails` VALUES (2, 'rathzai@gmail.com', 'Test', 'Body Email');
INSERT INTO `sent_emails` VALUES (3, 'rathzai@gmail.com', 'Test', 'Body Email');

SET FOREIGN_KEY_CHECKS = 1;
