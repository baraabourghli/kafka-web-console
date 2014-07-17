# --- !Ups

ALTER TABLE zookeepers DROP PRIMARY KEY;
ALTER TABLE zookeepers ADD COLUMN id BIGINT NOT NULL AUTO_INCREMENT;
ALTER TABLE zookeepers ADD PRIMARY KEY (id);
ALTER TABLE zookeepers ALTER COLUMN name SET NOT NULL;
ALTER TABLE zookeepers ALTER COLUMN host SET NOT NULL;
ALTER TABLE zookeepers ALTER COLUMN port SET NOT NULL;
ALTER TABLE zookeepers ALTER COLUMN statusId SET NOT NULL;
ALTER TABLE zookeepers ALTER COLUMN groupId SET NOT NULL;
ALTER TABLE zookeepers ADD UNIQUE (name);

CREATE TABLE offsetHistory (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  zookeeperId BIGINT,
  topic VARCHAR(255),
  FOREIGN KEY (zookeeperId) REFERENCES zookeepers(id),
  UNIQUE (zookeeperId, topic)
);

CREATE TABLE offsetPoints (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  consumerGroup VARCHAR(255),
  timestamp TIMESTAMP,
  offsetHistoryId BIGINT,
  partition INT,
  offset BIGINT,
  logSize BIGINT,
  FOREIGN KEY (offsetHistoryId) REFERENCES offsetHistory(id)
);

CREATE TABLE settings (
  key_ VARCHAR(255) PRIMARY KEY,
  value VARCHAR(255)
);

INSERT INTO settings (key_, value) VALUES ('PURGE_SCHEDULE', '0 0 0 ? * SUN *');
INSERT INTO settings (key_, value) VALUES ('OFFSET_FETCH_INTERVAL', '30');

# --- !Downs

DROP TABLE IF EXISTS offsetPoints;
DROP TABLE IF EXISTS offsetHistory;
DROP TABLE IF EXISTS settings;

ALTER TABLE zookeepers DROP PRIMARY KEY;
ALTER TABLE zookeepers DROP COLUMN id;
ALTER TABLE zookeepers ADD PRIMARY KEY (name);
ALTER TABLE zookeepers ALTER COLUMN host SET NULL;
ALTER TABLE zookeepers ALTER COLUMN port SET NULL;
ALTER TABLE zookeepers ALTER COLUMN statusId SET NULL;
ALTER TABLE zookeepers ALTER COLUMN groupId SET NULL;