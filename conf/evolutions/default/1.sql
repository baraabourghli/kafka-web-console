# --- !Ups

CREATE TABLE zookeepers (
  name VARCHAR(1),
  host VARCHAR(1),
  port DECIMAL(38),
  statusId TEXT,
  groupId TEXT,
  PRIMARY KEY (name)
);

CREATE TABLE groups (
  id TEXT,
  name VARCHAR(1),
  PRIMARY KEY (id)
);

CREATE TABLE status (
  id TEXT,
  name VARCHAR(1),
  PRIMARY KEY (id)
);

INSERT INTO groups (id, name) VALUES (0, 'ALL');
INSERT INTO groups (id, name) VALUES (1, 'DEVELOPMENT');
INSERT INTO groups (id, name) VALUES (2, 'PRODUCTION');
INSERT INTO groups (id, name) VALUES (3, 'STAGING');
INSERT INTO groups (id, name) VALUES (4, 'TEST');

INSERT INTO status (id, name) VALUES (0, 'CONNECTING');
INSERT INTO status (id, name) VALUES (1, 'CONNECTED');
INSERT INTO status (id, name) VALUES (2, 'DISCONNECTED');
INSERT INTO status (id, name) VALUES (3, 'DELETED');

# --- !Downs

DROP TABLE IF EXISTS zookeepers;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS status;