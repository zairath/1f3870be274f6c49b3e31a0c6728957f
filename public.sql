/*
 Navicat Premium Data Transfer

 Source Server         : PG_SQL
 Source Server Type    : PostgreSQL
 Source Server Version : 90325
 Source Host           : localhost:5432
 Source Catalog        : code_challenge
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90325
 File Encoding         : 65001

 Date: 25/12/2022 17:25:22
*/


-- ----------------------------
-- Sequence structure for sent_emails_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sent_emails_id_seq";
CREATE SEQUENCE "public"."sent_emails_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for sent_emails
-- ----------------------------
DROP TABLE IF EXISTS "public"."sent_emails";
CREATE TABLE "public"."sent_emails" (
  "id" int4 NOT NULL DEFAULT nextval('sent_emails_id_seq'::regclass),
  "to_email" varchar(255) COLLATE "pg_catalog"."default",
  "subject" varchar(255) COLLATE "pg_catalog"."default",
  "html" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of sent_emails
-- ----------------------------
INSERT INTO "public"."sent_emails" VALUES (1, 'rathzai@gmail.com', 'Test', 'Body Email');
INSERT INTO "public"."sent_emails" VALUES (2, 'rathzai@gmail.com', 'Test', 'Body Email');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sent_emails_id_seq"
OWNED BY "public"."sent_emails"."id";
SELECT setval('"public"."sent_emails_id_seq"', 3, true);
