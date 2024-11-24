use weatherstation;

CREATE TABLE state_attributes (
  attributes_id BIGINT NOT NULL IDENTITY(1,1),
  hash INT NULL,
  shared_attrs TEXT NULL,
  PRIMARY KEY (attributes_id)
);
CREATE INDEX ix_state_attributes_hash
ON state_attributes(hash);

-- Creating the states_meta table
CREATE TABLE states_meta (
  metadata_id BIGINT NOT NULL IDENTITY(1,1),
  entity_id VARCHAR(255) NULL,
  PRIMARY KEY (metadata_id)
);
CREATE UNIQUE INDEX ix_states_meta_entity_id
ON states_meta(entity_id);

CREATE TABLE states (
  state_id BIGINT NOT NULL IDENTITY(1,1),
  entity_id VARCHAR(255) NULL,
  state VARCHAR(255) NULL,
  attributes VARCHAR(255) NULL,
  event_id SMALLINT NULL,
  last_changed VARCHAR(255) NULL,
  last_changed_ts FLOAT NULL,
  last_reported_ts FLOAT NULL,
  last_updated VARCHAR(255) NULL,
  last_updated_ts FLOAT NULL,
  old_state_id BIGINT NULL,
  attributes_id BIGINT NULL,
  context_id VARCHAR(255) NULL,
  context_user_id VARCHAR(255) NULL,
  context_parent_id VARCHAR(255) NULL,
  origin_idx SMALLINT NULL,
  context_id_bin VARBINARY(255) NULL,
  context_user_id_bin VARBINARY(255) NULL,
  context_parent_id_bin VARBINARY(255) NULL,
  metadata_id BIGINT NULL,
  PRIMARY KEY (state_id)
);
CREATE INDEX ix_states_attributes_id
ON states(attributes_id);
CREATE INDEX ix_states_context_id_bin
ON states(context_id_bin);
CREATE INDEX ix_states_last_updated_ts
ON states(last_updated_ts);
CREATE INDEX ix_states_metadata_id_last_updated_ts
ON states(metadata_id, last_updated_ts);
CREATE INDEX ix_states_old_state_id
ON states(old_state_id);
ALTER TABLE states
ADD CONSTRAINT states_ibfk_1 FOREIGN KEY (old_state_id)
REFERENCES states (state_id);
ALTER TABLE states
ADD CONSTRAINT states_ibfk_2 FOREIGN KEY (attributes_id)
REFERENCES state_attributes (attributes_id);
ALTER TABLE states
ADD CONSTRAINT states_ibfk_3 FOREIGN KEY (metadata_id)
REFERENCES states_meta (metadata_id);
