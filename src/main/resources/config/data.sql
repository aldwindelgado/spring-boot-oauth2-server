-----------------------------------------------------------------
-- Author: Aldwin Delgado
-----------------------------------------------------------------

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;
SET datestyle = mdy;

\echo -----------------------------------------------------------------
\echo -- OAUTH DATA MODEL
\echo -----------------------------------------------------------------

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- DROP TABLE IF EXISTS "users";
-- DROP TABLE IF EXISTS "authorities";
DROP TABLE IF EXISTS "oauth_client_details";
-- DROP TABLE IF EXISTS "oauth_client_token";
-- DROP TABLE IF EXISTS "oauth_access_token";
-- DROP TABLE IF EXISTS "oauth_refresh_token";
-- DROP TABLE IF EXISTS "oauth_code";

\echo -----------------------------------------------------------------
\echo -- OAUTH TABLES
\echo -----------------------------------------------------------------

-- create table users (
--   username varchar(256),
--   password varchar(256),
--   enabled boolean
-- );

-- create table authorities (
--   username varchar(256),
--   authority varchar(256)
-- );

create table oauth_client_details (
  client_id VARCHAR(256) PRIMARY KEY,
  resource_ids VARCHAR(256),
  client_secret VARCHAR(256),
  scope VARCHAR(256),
  authorized_grant_types VARCHAR(256),
  web_server_redirect_uri VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(4096),
  autoapprove VARCHAR(256)
);

-- create table oauth_client_token (
--   token_id VARCHAR(256),
--   token BYTEA,
--   authentication_id VARCHAR(256),
--   user_name VARCHAR(256),
--   client_id VARCHAR(256)
-- );

-- create table oauth_access_token (
--   token_id VARCHAR(256),
--   token BYTEA,
--   authentication_id VARCHAR(256),
--   user_name VARCHAR(256),
--   client_id VARCHAR(256),
--   authentication BYTEA,
--   refresh_token VARCHAR(256)
-- );

-- create table oauth_refresh_token (
--   token_id VARCHAR(256),
--   token BYTEA,
--   authentication BYTEA
-- );

-- create table oauth_code (
--   code VARCHAR(256), authentication BYTEA
-- );

INSERT INTO oauth_client_details (client_id, resource_ids, client_secret, scope, authorized_grant_types, authorities, access_token_validity)
    VALUES ('sampleclient', 'sample-resource', crypt('samplepassword', gen_salt('bf')), 'trust', 'client_credentials,password', 'ROLE_CLIENT', 60);

INSERT INTO oauth_client_details (client_id, resource_ids, client_secret, scope, authorized_grant_types, authorities, access_token_validity)
    VALUES ('anotherclient', 'another-resource', crypt('anotherpassword', gen_salt('bf')), 'trust', 'client_credentials,password', 'ROLE_CLIENT', 60);

\echo -----------------------------------------------------------------
\echo -- Manage Ownership
\echo -----------------------------------------------------------------   

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM :TABLE_OWNER;
GRANT ALL ON SCHEMA public TO :TABLE_OWNER;
GRANT ALL ON SCHEMA public TO PUBLIC;

-- End --

